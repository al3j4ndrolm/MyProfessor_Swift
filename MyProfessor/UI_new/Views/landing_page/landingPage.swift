//
//  landing_page.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct landingPage: View {
    var body: some View {
        ZStack {
            backgroundColor()
            HStack {
                VStack(alignment: .leading) {
                    headerlandingPage()
                    content_landingpage()
                    
                    HStack {
                        Spacer()
                        landingPageLoginValidationButton()
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}
#Preview {
    landingPage()
}
