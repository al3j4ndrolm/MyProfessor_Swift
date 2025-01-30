//
//  myProfessorLogo.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct myProfessorLogo: View {
    
    var body: some View {
        ZStack {
            appTitle
            threeColorDots()
                .frame(width:68,height:18)
                .offset(x: 50,y: -10)
        }
    }
    
    private var appTitle: some View {
        VStack(alignment: .leading) {
            Text("My")
                .font(Font.custom("Lato-Bold", size: 40))
                .foregroundStyle(Color.white)
            Text("Professor")
                .font(Font.custom("Lato-Bold", size: 40))
                .foregroundStyle(Color.white)
                .offset(y: -8)
        }
    }
    
    
}


#Preview {
    myProfessorLogo()
}
