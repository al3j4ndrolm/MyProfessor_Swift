//
//  header_landingpage.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct headerlandingPage: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                welcomeTextLandingPage
                    .padding(.top, 59)
                    .padding(.bottom, 20)
                myProfessorLogo()
            }
            .padding(.leading, 20)
        }
    }
    
    private var welcomeTextLandingPage: some View {
        Text("Welcome to")
            .font(Font.custom("Lato-Bold", size: 32))
            .foregroundStyle(Color.white)
    }
    
    
    
}

#Preview {
    headerlandingPage()
}
