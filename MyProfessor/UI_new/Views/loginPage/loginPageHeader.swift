//
//  loginPageHeader.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/16/25.
//

import SwiftUI

var LoginPageheader: some View {
    VStack(alignment: .leading) {
        myProfessorLogo()
            .padding(.horizontal, 111)
        Text("Log in")
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundStyle(.white)
            .padding(.leading, 20)
            .padding(.bottom, 32)
            .padding(.top, 25)
    }
}


#Preview {
    LoginPageheader
}
