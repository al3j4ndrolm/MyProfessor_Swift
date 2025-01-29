//
//  back-button.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/8/25.
//

import SwiftUI

struct back_button: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.left")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
            Text("Home")
                .font(.title2)
                .foregroundStyle(Color.primary)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    back_button()
}
