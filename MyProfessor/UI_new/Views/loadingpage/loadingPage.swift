//
//  loadingPage.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

//Use this view everytime something loads

// If !loaded { loadingpage }

struct loadingPage: View {
    var body: some View {
        ZStack {
            backgroundColorLight()
            VStack {
                HStack {
                    loadingpage_backbutton()
                    loadingpage_circles()
                    Spacer()
                }
                .padding(.top, 56)
                loadingpage_text()
                    .padding(.top, 334)
                Spacer()
                myProfessorLogo_loadingScreen()
                    .padding(.bottom, 30)
            }
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    loadingPage()
}
