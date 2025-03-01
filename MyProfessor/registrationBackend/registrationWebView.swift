import WebKit

class RegistrationWebViewManager: NSObject, WKNavigationDelegate {
    private var webView: WKWebView?
    private var completionHandler: ((Bool) -> Void)?
    private var sid: String = ""
    private var pin: String = ""
    private var hasCheckedLogin = false
    var studentName: String = "Testing"
    private var clickStep: Int = 0  // ✅ Keeps track of menu navigation steps
    
    override init() {
        super.init()
        setupWebView()
    }

    /// ✅ Creates a new WebView instance, removing old instances properly
    private func setupWebView() {
        webView?.stopLoading()
        webView = nil

        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView?.navigationDelegate = self
    }

    /// ✅ Starts login and automatically navigates through menu options
    func startLogin(username: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        print("🚀 Starting login process...")

        setupWebView()
        self.sid = username
        self.pin = password
        self.hasCheckedLogin = false
        self.completionHandler = { isValid in
            if isValid {
                self.getStudentName(self.webView!) { name in
                    self.studentName = name ?? ""
                    completion(true, self.studentName)
                }
            } else {
                completion(false, nil)
            }
        }

        let loginURL = URL(string: "https://ssb-prod.ec.fhda.edu/PROD/bwskfreg.P_AltPin")!
        let request = URLRequest(url: loginURL)
        webView?.load(request)
    }

    /// ✅ Handles web page load events
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("✅ Page Loaded!")

        if !hasCheckedLogin {
            hasCheckedLogin = true

            inputInformation(webView, data: self.sid, inputFieldId: "UserID")
            inputInformation(webView, data: self.pin, inputFieldId: "PIN")
            pressLoginButton(webView)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.checkIsValidStudent(webView) { isValid in
                    if isValid {
                        print("✅ Login successful! Proceeding to student menu navigation...")
                        self.clickStep = 1  // ✅ Start from the first step
                        self.pressMenuButtons(webView)
                    } else {
                        print("❌ Login failed.")
                    }
                }
            }
        } else {
            // ✅ Continue clicking through menu items
            if clickStep > 0 && clickStep <= 3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.pressMenuButtons(webView)
                }
            }

            // ✅ Always print the final page source after the last click
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                print("✅ Final step reached. Printing final page source...")
                self.printPageSource(webView)
            }
        }
    }


    /// ✅ Sequentially clicks menu buttons after login
    private func pressMenuButtons(_ webView: WKWebView) {
        let jsCode: String

        switch clickStep {
        case 1:
            jsCode = "document.querySelectorAll('a.submenulinktext2')[5]?.click();"
        case 2:
            jsCode = "document.querySelectorAll('a.submenulinktext2')[4]?.click();"
        case 3:
            jsCode = "document.querySelectorAll('a.submenulinktext2')[5]?.click();"
        default:
            print("⚠️ Unexpected clickStep value: \(clickStep)")
            return
        }

        print("🔹 Executing menu click step \(clickStep)")

        webView.evaluateJavaScript(jsCode) { result, error in
            if let error = error {
                print("❌ JavaScript Execution Failed: \(error)")
            } else {
                print("✅ Click step \(self.clickStep) executed")
                self.clickStep += 1  // ✅ Move to the next step
                print("➡️ Moving to click step \(self.clickStep)")
            }
        }
    }

    /// ✅ Extracts and prints the full page source
    private func printPageSource(_ webView: WKWebView) {
        let jsCode = "document.documentElement.outerHTML;"

        webView.evaluateJavaScript(jsCode) { result, error in
            if let error = error {
                print("❌ Error fetching page source: \(error)")
            } else if let htmlString = result as? String {
                print("🔎 FINAL PAGE SOURCE:\n\(htmlString)")
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
                print("❌ JavaScript Execution Failed: \(error)")
                completion(false)
            } else if let isValid = result as? Bool {
                completion(isValid)
            } else {
                completion(false)
            }
        }
    }

    /// ✅ Extracts student name from page
    private func getStudentName(_ webView: WKWebView, completion: @escaping (String?) -> Void) {
        let jsCode = """
        (function() {
            let element = document.querySelectorAll('.pagebodydiv td.pldefault')[1];
            if (element) {
                let text = element.textContent.trim();
                let match = text.match(/Welcome,\\s+(\\w+)/);
                return match ? match[1] : null;  
            }
            return null;
        })();
        """

        webView.evaluateJavaScript(jsCode) { (result, error) in
            if let error = error {
                print("❌ JavaScript Execution Failed: \(error)")
                completion(nil)
            } else if let name = result as? String {
                self.studentName = name
                completion(name)
            } else {
                completion(nil)
            }
        }
    }
}
