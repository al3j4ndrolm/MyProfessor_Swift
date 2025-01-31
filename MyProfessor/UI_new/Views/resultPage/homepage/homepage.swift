//
//  homepage.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/30/25.
//

import SwiftUI

struct homepage: View {
    var body: some View {
        ZStack {
            backgroundColor()
            VStack {
                homepage_header()
                homepage_body()
                Spacer()
                
                //Just standard button can change later
                registerNavigation()
                    .padding(.horizontal, 15)
                    .padding(.bottom, 45)
                
                //To make it close as possible with figma button do this one
                //registerNavigation()
                    //.offset(y: 30)
            }
        }
    }
}

#Preview {
    homepage()
}
