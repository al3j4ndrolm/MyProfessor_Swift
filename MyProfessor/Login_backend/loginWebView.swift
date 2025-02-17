import WebKit

class HeadlessLogInWebViewManager: NSObject, WKNavigationDelegate {
    private var webView: WKWebView?
    private var completionHandler: ((Bool) -> Void)?
    private var sid: String = ""
    private var pin: String = ""
    private var hasCheckedLogin = false  // ✅ Prevents multiple checks

    override init() {
        super.init()
        setupWebView()
    }

    /// ✅ Creates a new WebView instance, removing old instances properly
    private func setupWebView() {
        webView?.stopLoading()  // ✅ Stop any previous loading
        webView = nil  // ✅ Destroy old WebView before creating a new one

        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: configuration)  // ✅ Create new instance
        webView?.navigationDelegate = self  // ✅ Set delegate correctly
    }

    /// ✅ Ensures old login attempts do not interfere with new ones
    func checkLoginCredentials(username: String, password: String, completion: @escaping (Bool) -> Void) {
        print("Inside function")

        setupWebView()  // ✅ Reset WebView before starting login
        self.completionHandler = completion
        self.sid = username
        self.pin = password
        self.hasCheckedLogin = false  // ✅ Reset check flag

        let loginURL = URL(string: "https://ssb-prod.ec.fhda.edu/PROD/bwskfreg.P_AltPin")!
        let request = URLRequest(url: loginURL)
        webView?.load(request)

        print("End function")
    }

    /// ✅ Ensures `didFinish` only runs ONCE per login attempt
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("✅ Page Loaded!")

        if !hasCheckedLogin {  // ✅ Prevent duplicate calls
            hasCheckedLogin = true  // ✅ Mark that login is checked

            inputInformation(webView, data: self.sid, inputFieldId: "UserID")
            inputInformation(webView, data: self.pin, inputFieldId: "PIN")
            pressLoginButton(webView)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.checkIsValidStudent(webView) { isValid in
                    self.completionHandler?(isValid)  // ✅ Return result to caller
                }
            }
        }
    }

    /// ✅ Inputs credentials into the webpage
    private func inputInformation(_ webView: WKWebView, data: String, inputFieldId: String) {
        let jsCode = "document.getElementById('\(inputFieldId)').value = '\(data)';"
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }

    /// ✅ Clicks the login button
    private func pressLoginButton(_ webView: WKWebView) {
        let jsCode = "document.querySelector('input[type=\"submit\"][value=\"Login\"]').click();"
        webView.evaluateJavaScript(jsCode, completionHandler: nil)
    }

    /// ✅ Checks if login was successful
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
