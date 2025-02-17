//
//  loginPage.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/29/25.
//

import SwiftUI

struct loginPage: View {
    
    var body: some View {
        @State var studentID: String = ""
        @State var password: String = ""
        
        //@Stateobject var vm = vm()
        @State var guestViewListener: Bool = false
        @State var loginViewListener: Bool = false
        
        
        ZStack {
            backgroundColor()
            VStack(alignment: .leading) {
                LoginPageheader
                loginPageTextfields(studentId: studentID, studentPassword: password)
                navigation
                Spacer()
                userNavigateForSupport
            }
        }
            .navigationBarBackButtonHidden(true)
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
            confirmLogin()
        }) {
            LoginButtonUI
                .padding(.top, 20)
                .padding(.horizontal, 163)
        }
    }
    
    private func continueAsGuest() {
       //navigate to guest view
        
    }
   
    private func confirmLogin() {
       //navigate to homepage with user's state
    }
    
}

#Preview {
    loginPage()
}
