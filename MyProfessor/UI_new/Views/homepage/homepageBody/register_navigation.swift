//
//  SwiftUIView.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

let darkGreenForGreenButtonText = Color(red: 0.01, green: 0.25, blue: 0.14)



struct registerNavigation: View {
    var body: some View {
        Button(action: {
            print("Take to register view")
        }) {
            registerButtonBody
        }
    }
    
    private var registerButtonBody: some View {
        rectangleRegisterButton
            .overlay(registerButtonPrompt)
    }
    
    //The one on figma is kind of weird
    
    
    private var rectangleRegisterButton: some View {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: .infinity, height: 56)
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
