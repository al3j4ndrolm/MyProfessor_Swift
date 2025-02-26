//
//  landing_page.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct landingPage: View {
    @State var trueer: Bool = false
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
                        Button(action: {
                            trueer = true
                        })
                        {
                            Text("test")
                        }
                        Spacer()
                    }
                    Spacer()
                }
                 Spacer()
            }
        }.navigationDestination(isPresented: $trueer) {
            SearchedProfessors()
        }
    }
}

#Preview {
    landingPage()
}
