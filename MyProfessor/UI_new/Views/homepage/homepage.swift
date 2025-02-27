//
//  homepage.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/30/25.
//

import SwiftUI

struct homepage: View {
    
    @State var username: String
    
    var body: some View {
        
        ZStack {
            backgroundColor()
            VStack {
                homepage_header(username: username)
                homepage_body()
                Spacer()
                
                loginButton(isd: "20555154", pin: "020202")

                registerNavigation()
                    .padding(.horizontal, 15)
                    .padding(.bottom, 45)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    homepage(username: "Leonard")
}
