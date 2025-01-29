//
//  landing-page.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 12/29/24.
//

import SwiftUI

struct PageBackgroundBuilder: View {
    
    @State var asset_path: String
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(
                Image(asset_path)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .opacity(0.42)
            )
            .cornerRadius(48)
            .ignoresSafeArea()
            .padding(.bottom, 550)
    }
}

#Preview {
    PageBackgroundBuilder(asset_path: "homepage-background")
}
