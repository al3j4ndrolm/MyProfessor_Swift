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
            }
        }
    }
}

#Preview {
    homepage()
}
