import UIKit
import WebKit


//
//  loginButton.swift
//  MyProfessor
//
//  Created by Alejandro Lopez on 2/12/25.
//
import SwiftUI

struct registrationButton: View {
    let sid: String
    let pin: String
    let registrationWebView = RegistrationWebViewManager()  // ✅ WebView instance
    
    var body: some View {
        VStack {
            Button(action: {
                print("🚀 Button clicked: Starting login and navigation...")
                registrationWebView.startLogin(username: sid, password: pin) { isValid, studentName in
                    DispatchQueue.main.async {
                        if isValid {
                            print("✅ Student Name: \(studentName ?? "Unknown")")
                        } else {
                            print("❌ Login failed")
                        }
                    }
                }
            }) {
                Text("Log in")
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
