//
//  SwiftUIView.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

let darkGreenForGreenButtonText = Color(red: 0.01, green: 0.25, blue: 0.14)



struct registerNavigation: View {
    
    @State private var navigateToLandingPage: Bool = false
    var body: some View {
        Button(action: {
            navigateToLandingPage = true
        }) {
            registerButtonBody
        }.navigationDestination(isPresented: $navigateToLandingPage) {
            landingPage()
        }
    }

    private var registerButtonBody: some View {
        rectangleRegisterButton
            .overlay(registerButtonPrompt)
    }
    
    
    private var rectangleRegisterButton: some View {
        Rectangle()
          .foregroundColor(.clear)
          .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56)
          .background(greenButtonColor)
          .cornerRadius(32)
          .shadow(color: .secondary.opacity(0.6), radius: 0.5, x: 0.3, y: 5)
    }
    
    private var registerButtonPrompt: some View {
        Text("Ready to register?")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .foregroundStyle(darkGreenForGreenButtonText)
        
    }
    
    
}

#Preview {
    registerNavigation()
}
