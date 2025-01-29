//
//  contentContainer.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/1/25.
//

import SwiftUI

struct contentContainer: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(.white)
            .cornerRadius(36)
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: -3)
    }
}

#Preview {
    contentContainer()
}
