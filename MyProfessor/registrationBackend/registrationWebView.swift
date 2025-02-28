//
//  registrationWebView.swift
//  MyProfessor
//
//  Created by Alejandro Lopez on 2/26/25.
//

import WebKit

class HeadlessRegistrationWebViewManager: NSObject, WKNavigationDelegate {
    
    private var webView: WKWebView?
    private var completionHandler: ((Bool) -> Void)?
    private var sid: String = ""
    private var pin: String = ""
    var classesToRegister: [String] = []
    
    /// ✅ Creates a new WebView instance, removing old instances properly
    private func setupWebView() {
        webView?.stopLoading()  // ✅ Stop any previous loading
        webView = nil  // ✅ Destroy old WebView before creating a new one

        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: configuration)  // ✅ Create new instance
        webView?.navigationDelegate = self  // ✅ Set delegate correctly
    }

    /// ✅ Ensures old login attempts do not interfere with new ones
    func checkLoginCredentials(username: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        print("Inside function")

        setupWebView()
//        self.completionHandler = { isValid in
//            if isValid {
////                self.getStudentName(self.webView!) { name in
////                    self.studentName = name ?? ""  // ✅ Store name in class variable
////                    completion(true, self.studentName)  // ✅ Return both isValid & studentName
//                }
//            } else {
//                completion(false, nil)
//            }
//        }
        
        self.sid = username
        self.pin = password
//        self.hasCheckedLogin = false

        let loginURL = URL(string: "https://ssb-prod.ec.fhda.edu/PROD/bwskfreg.P_AltPin")!
        let request = URLRequest(url: loginURL)
        webView?.load(request)

        print("End function")
    }


    /// ✅ Ensures `didFinish` only runs ONCE per login attempt
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("✅ Page Loaded!")

//        if !hasCheckedLogin {
//            hasCheckedLogin = true
//
//            inputInformation(webView, data: self.sid, inputFieldId: "UserID")
//            inputInformation(webView, data: self.pin, inputFieldId: "PIN")
//            pressLoginButton(webView)
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                self.checkIsValidStudent(webView) { isValid in
//                    if isValid {
//                        self.getStudentName(webView) { name in
//                            self.studentName = name ?? ""
//                            self.completionHandler?(true)  // ✅ Now executes after name is fetched!
//                        }
//                    } else {
//                        self.completionHandler?(false)
//                    }
//                }
//            }
//        }
    }


//    /// ✅ Inputs credentials into the webpage
//    private func inputInformation(_ webView: WKWebView, data: String, inputFieldId: String) {
//        let jsCode = "document.getElementById('\(inputFieldId)').value = '\(data)';"
//        webView.evaluateJavaScript(jsCode, completionHandler: nil)
//    }
//
//    /// ✅ Clicks the login button
//    private func pressLoginButton(_ webView: WKWebView) {
//        let jsCode = "document.querySelector('input[type=\"submit\"][value=\"Login\"]').click();"
//        webView.evaluateJavaScript(jsCode, completionHandler: nil)
//    }
//    
//    private func getStudentName(_ webView: WKWebView, completion: @escaping (String?) -> Void) {
//        let jsCode = """
//                (function() {
//                    let element = document.querySelectorAll('.pagebodydiv td.pldefault')[1];
//                    if (element) {
//                        let text = element.textContent.trim(); // Get text and remove extra spaces
//
//                        // Extract the first name using regex
//                        let match = text.match(/Welcome,\\s+(\\w+)/);
//                        return match ? match[1] : null;  
//                    }
//                    return null; // Return null if element not found
//                })();
//                """
//
//        webView.evaluateJavaScript(jsCode) { (result, error) in
//            if let error = error {
//                print("JavaScript Execution Failed: \(error)")
//                completion(nil)
//            } else if let name = result as? String {
//                self.studentName = name  // ✅ Store the extracted name
//                completion(name)
//            } else {
//                completion(nil)
//            }
//        }
//    }
}
