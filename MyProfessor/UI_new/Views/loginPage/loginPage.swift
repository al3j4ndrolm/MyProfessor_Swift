//
//  loginPage.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/29/25.
//

import SwiftUI

struct loginPage: View {
    
    @State private var loginManager = HeadlessLogInWebViewManager()
    @State private var navigateAsGuest: Bool = false
    @State private var navigateAsStudent: Bool = false
    @State var studentID: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        //@Stateobject var vm = vm()
        @State var guestViewListener: Bool = false
        @State var loginViewListener: Bool = false
        
        
        
        ZStack {
            backgroundColor()
            VStack(alignment: .leading) {
                LoginPageheader
                loginPageTextfields(studentId: $studentID, studentPassword: $password)
                navigation
                Spacer()
                userNavigateForSupport
            }
        }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateAsGuest) {
                homepage(username: "Guest")
            }
            .navigationDestination(isPresented: $navigateAsStudent) {
                homepage(username: "Alejandro")
            }
    }
    
    private var userNavigateForSupport: some View {
        VStack(alignment: .center) {
            Text("Are you having problems logging in?")
                .font(.system(size: 15, weight: .bold, design: .default))
                .foregroundStyle(Color(red: 0.59, green: 0.59, blue: 0.59))
                .padding(.horizontal, 63)
            customerServiceButton
        }
    }
    
    private var customerServiceButton: some View {
        Button(action: {
            print("take user to customer service")
        }) {
            customerServiceButtonUI
        }
    }
    
    private var navigation: some View {
        VStack(alignment: .center, spacing: 0) {
            LoginButton
            LoginPageSpacerBetweenGuestAndLoginButton
            GuestButton
        }
    }
    
    private var GuestButton: some View {
        Button(action: {
            continueAsGuest()
        }) {
            GuestButtonUI
        }
    }
    
    private var LoginButton: some View {
        Button(action: {
            loginButton(isd: studentID, pin: password)
        }) {
            LoginButtonUI
                .padding(.top, 20)
                .padding(.horizontal, 163)
        }
    }
    
    private func continueAsGuest() {
        navigateAsGuest = true
    }
   
    private func loginButton(isd: String, pin: String) {
        loginManager.checkLoginCredentials(username: isd, password: pin) { isValid in
            if isValid {
                navigateAsStudent = true
            } else {
                navigateAsStudent = false
            }
        }
    }
}

#Preview {
    loginPage()
}
