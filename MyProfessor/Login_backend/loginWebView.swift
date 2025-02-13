import WebKit

class HeadlessLogInWebViewManager: NSObject, WKNavigationDelegate {
    private var webView: WKWebView!
    private var completionHandler: ((Bool) -> Void)?  // ✅ Stores callback for result
    private var hasLoggedIn = false
    private var hasCheckedLogin = false
    private var sid: String = ""
    private var pin: String = ""

    override init() {
        super.init()
        setupWebView()
    }

    private func setupWebView() {
        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: configuration)  // ✅ Hidden WebView
        webView.navigationDelegate = self
    }

    func checkLoginCredentials(username: String, password: String, completion: @escaping (Bool) -> Void) {
        print("Inside function")
        self.completionHandler = completion  // ✅ Store callback for later use
        let loginURL = URL(string: "https://ssb-prod.ec.fhda.edu/PROD/bwskfreg.P_AltPin")!
        let request = URLRequest(url: loginURL)
        self.sid = username
        self.pin = password
        webView.load(request)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("✅ Page Loaded!")

        if !hasLoggedIn {
            // ✅ First time: Fill in credentials and press login
            inputInformation(webView, data: self.sid, inputFieldId: "UserID")
            inputInformation(webView, data: self.pin, inputFieldId: "PIN")
            pressLoginButton(webView)
            hasLoggedIn = true  // Prevent looping
        } else if !hasCheckedLogin {
            hasCheckedLogin = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {  // ✅ Wait for page transition
                self.checkIsValidStudent(webView) { isValid in
                    self.completionHandler?(isValid)  // ✅ Return result to caller
                }
            }
        }
    }

    private func inputInformation(_ webView: WKWebView, data: String, inputFieldId: String) {
        let jsCode = "document.getElementById('\(inputFieldId)').value = '\(data)';"
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }

    private func pressLoginButton(_ webView: WKWebView) {
        let jsCode = "document.querySelector('input[type=\"submit\"][value=\"Login\"]').click();"
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }

    private func checkIsValidStudent(_ webView: WKWebView, completion: @escaping (Bool) -> Void) {
        let jsCode = """
        (function() {
            let element = document.querySelectorAll('.pagebodydiv td.pldefault')[1];
            return element && element.textContent.includes("Welcome");
        })();
        """

        webView.evaluateJavaScript(jsCode) { (result, error) in
            if let error = error {
                print("JavaScript Execution Failed: \(error)")
                completion(false)
            } else if let isValid = result as? Bool {
                completion(isValid)
            } else {
                completion(false)
            }
        }
    }
}
