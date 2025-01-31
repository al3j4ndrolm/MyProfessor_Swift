//
//  landingpage_login_button.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct landingPageLoginValidationButton: View {
    var body: some View {
        VStack {
            Button(action: {
                login()
            }) {
                studentButton
            }
            
            Button(action: {
                login()

            }) {
                guestButton
            }
        }
        .padding(.top, 59)
    }
    
    private var guestButton: some View {
        NavigationLink("Or continue as a Guest", destination: homepage())
            .font(Font.custom("Lato-Bold", size: 15))
            .foregroundStyle(Color.white)
            .padding(.top, 5)
    }
    
    private var studentButton: some View {
        Text("Are you a student? Log in here")
            .font(Font.custom("Lato-Bold", size: 15))
            .foregroundStyle(Color(red: 0.3, green: 0.49, blue: 0.64))
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(red: 0.82, green: 0.92, blue: 1)))
    }
    //change with actual logic later
    private func login() {
        print("login pressed")
    }
}

#Preview {
    landingPageLoginValidationButton()
}
