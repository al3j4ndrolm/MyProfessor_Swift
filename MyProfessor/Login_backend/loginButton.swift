//
//  loginButton.swift
//  MyProfessor
//
//  Created by Alejandro Lopez on 2/12/25.
//
import SwiftUI

struct loginButton: View {
    let isd: String
    let pin: String
    let headlessWebView = HeadlessLogInWebViewManager()  // ✅ Background WebView
    
    var body: some View {
        VStack {
            Button(action: {
                print("Button clicked")
                headlessWebView.checkLoginCredentials(username: isd, password: pin) { isValid, studentName in
                    DispatchQueue.main.async {
                        if isValid {
                            print("✅ Student Name: \(studentName ?? "Unknown")")  // ✅ Ensure name is printed before navigating
                        } else {
                            print("❌ Login failed")
                        }
                    }
                }
            }) {
                Text("Log in")
            }
        }
    }
}
