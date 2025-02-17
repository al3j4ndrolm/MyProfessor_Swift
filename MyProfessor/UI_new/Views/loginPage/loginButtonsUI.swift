//
//  loginButtonsUI.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/16/25.
//

import SwiftUI


var LoginButtonUI: some View {
   Text("Login")
        .font(.system(size: 15, weight: .semibold, design: .default))
        .foregroundStyle(Color(red: 0.3, green: 0.49, blue: 0.64))
        .padding(.vertical, 5)
        .padding(.horizontal, 15)
        .background(RoundedRectangle(cornerRadius: 25).fill(Color(red: 0.82, green: 0.92, blue: 1)))
}

var GuestButtonUI: some View {
        Text("Continue as Guest")
            .font(.system(size: 15, weight: .bold, design: .default))
            .foregroundStyle(.white.opacity(0.8))
            .padding(.horizontal, 15)
            .underline()
            
}

var LoginPageSpacerBetweenGuestAndLoginButton: some View {
   Text("or")
        .font(.system(size: 15, weight: .bold, design: .default))
        .foregroundStyle(.white.opacity(0.8))
        .padding(.top, 5)
        .padding(.horizontal, 15)
}

var customerServiceButtonUI: some View {
    Text("Click here to get supoprt")
        .font(.system(size: 15, weight: .bold, design: .default))
        .foregroundStyle(.white.opacity(0.5))
        .underline()

}

#Preview {
    LoginButtonUI
    GuestButtonUI
}
