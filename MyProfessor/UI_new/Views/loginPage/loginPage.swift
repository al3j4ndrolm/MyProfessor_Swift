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
        
        
        ZStack {
            backgroundColor()
            VStack(alignment: .leading) {
                header
                loginPageTextfields(studentId: studentID, studentPassword: password)
                navigation
                Spacer()
            }
            .padding(.top, 33)
        }.ignoresSafeArea(.all)
            .navigationBarBackButtonHidden(true)
    }
    
    private var header: some View {
        VStack(alignment: .leading) {
            myProfessorLogo()
                .padding(.horizontal, 111)
            Text("Log in")
                .font(.system(size: 32, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 20)
                .padding(.bottom, 32)
                .padding(.top, 32)
        }
    }
    
    private var navigation: some View {
            LoginButton
                .padding(.top, 20)
                .padding(.horizontal, 163)
    }
    
    private var LoginButton: some View {
       Text("Login")
            .font(.system(size: 15, weight: .semibold, design: .default))
            .foregroundStyle(Color(red: 0.3, green: 0.49, blue: 0.64))
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(RoundedRectangle(cornerRadius: 25).fill(Color(red: 0.82, green: 0.92, blue: 1)))
    }
    
    private func confirmLogin() {
        
    }
    
}

#Preview {
    loginPage()
}
