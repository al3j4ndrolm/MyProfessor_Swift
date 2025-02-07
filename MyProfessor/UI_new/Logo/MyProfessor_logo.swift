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
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(Color.white)
            Text("Professor")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(Color.white)
                .offset(y: -8)
        }
    }
    
    
}

struct myProfessorLogo_loadingScreen: View {
    var body: some View {
        ZStack {
            appTitle
            threeColorDots()
                .frame(width: 50, height: 50)
                .offset(x: 25 , y: -10)
        }
    }
    private var appTitle: some View {
        VStack(alignment: .leading) {
            Text("My")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
            Text("Professor")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .offset(y: -8)
        }
    }
}


#Preview {
    myProfessorLogo_loadingScreen()
}
