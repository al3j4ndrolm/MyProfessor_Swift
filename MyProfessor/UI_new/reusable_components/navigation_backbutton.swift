//
//  navigation_backbutton.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

struct navigation_backbutton: View {
    var body: some View {
        Image(systemName: "arrow.left.circle")
            .font(.system(size: 24, weight: .semibold, design: .default))
            .foregroundStyle(.white)
    }
}

#Preview {
    navigation_backbutton()
}
