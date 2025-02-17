//
//  landingpage_login_button.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct landingPageLoginValidationButton: View {
    
    @State private var navigateAsGuest: Bool = false
    @State private var navigateAsStuDENT: Bool = false
    
    var body: some View {
        VStack {
            Button(action: {
                loginHereButton()
            }) {
                studentButton
            }
            
            Button(action: {
                continueAsGuest()
            }) {
                guestButton
            }
        }
        .padding(.top, 59)
        .navigationDestination(isPresented: $navigateAsGuest) {
            homepage(username: "Guest")
        }
        .navigationDestination(isPresented: $navigateAsStuDENT) {
            loginPage()
        }
    }
    
    private var guestButton: some View {
        Text("or continue as a Guest")
            .font(Font.custom("Lato-Bold", size: 15))
            .foregroundStyle(Color.white)
    }
    
    private var studentButton: some View {
        Text("Are you a student? Log in here")
            .font(Font.custom("Lato-Bold", size: 15))
            .foregroundStyle(Color(red: 0.3, green: 0.49, blue: 0.64))
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(red: 0.82, green: 0.92, blue: 1)))
    }
    private func continueAsGuest() {
        navigateAsGuest = true
    }
    private func loginHereButton() {
        navigateAsStuDENT = true
    }
    
    
}

#Preview {
    landingPageLoginValidationButton()
}
