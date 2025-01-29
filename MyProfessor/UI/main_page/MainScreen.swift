//
//  homepage.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 12/29/24.
//

import SwiftUI

struct homepage: View {
    
    var body: some View {
        ZStack {
            PageBackgroundBuilder(asset_path: "homepage-background")
            VStack {
                homePageHeader()
                    .padding(.bottom, 23)
                homepageContent()
            }
        }
    }
}

#Preview {
    homepage()
}
