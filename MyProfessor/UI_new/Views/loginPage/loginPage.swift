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
    @State private var navigateToCreatePin: Bool = false
    @State var studentName: String = ""
    @State var studentID: String = ""
    @State var pin: String = ""
    
    var body: some View {
        
        //@Stateobject var vm = vm()
        @State var guestViewListener: Bool = false
        @State var loginViewListener: Bool = false
        
        ZStack {
            backgroundColor()
            VStack(alignment: .leading) {
                LoginPageheader
                loginPageTextfields(context: "Student ID", placeholder: "ex. 12345678", data: $studentID)
                loginPageSecureFields(context: "Pin", placeholder: "my super secure pin :)", data: $pin).textContentType(.password)
                makePinBtn
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
            homepage(username: studentID)
        }
        .navigationDestination(isPresented: $navigateToCreatePin) {
            createPin()
        }
    }
    
    private var makePinBtn: some View {
        Button(action: {
            navigateToCreatePin = true
        } ) {
            makePinBtnUI
        }        }
    private var makePinBtnUI: some View {
        HStack {
            Spacer()
            Text("You dont have a PIN? Click here")
                .foregroundStyle(.white)
                .font(.system(size: 15, weight: .bold))
        }
        .padding(.trailing, 40)
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
            loginButton(isd: studentID, pin: pin)
        }) {
            Spacer()
            BlueButtonUI
                .padding(.top, 20)
            Spacer()
        }
    }
    
    private func continueAsGuest() {
        navigateAsGuest = true
    }
    
    private func loginButton(isd: String, pin: String) {
        loginManager.checkLoginCredentials(username: isd, password: pin) { isValid, studentName in
            DispatchQueue.main.async {
                if isValid {
                    self.navigateAsStudent = true
                    self.studentName = studentName!
                    print("✅ Student Name is: \(studentName ?? "Unknown")")  // ✅ Ensure name is printed before navigating
                } else {
                    self.navigateAsStudent = false
                    print("❌ Login failed")
                }
            }
        }
    }
}

#Preview {
    loginPage()
}
