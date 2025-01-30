//
//  content_landingpage.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct content_landingpage: View {
    
    let featureDescriptions: [String] = ["Search for professors of any\nspecific class you are going to take", "Register for classes in less than 5 seconds", "Have early access to academic schedules"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Here you will be able to:")
                .font(Font.custom("Lato-Bold", size: 20))
                .foregroundStyle(Color.white)
                .padding(.bottom, 30)
            informationBall(image: "magnifyingglass", text: featureDescriptions[0])
            informationBall(image: "clock", text: featureDescriptions[1])
                .padding(.top, 16)
            informationBall(image: "calendar", text: featureDescriptions[2])
                .padding(.top, 24)
        }
        .padding(.leading, 20)
    }
    
    private func informationBall(image: String, text: String) -> some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundStyle(Color(red: 0.0, green: 0.5, blue: 0.0))
                .background(newGreenCircle().frame(width: 45, height: 45))
                .padding(.leading, 10)
            Text(text)
                .font(Font.custom("Lato-Bold", size: 15))
                .foregroundColor(Color.white)
                .padding(.leading, 20)
        }
    }
    
}

#Preview {
    content_landingpage()
}
