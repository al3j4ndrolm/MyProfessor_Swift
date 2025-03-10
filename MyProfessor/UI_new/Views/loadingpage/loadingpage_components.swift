//
//  loadingpage_components.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/6/25.
//

import SwiftUI

struct loadingpage_circles: View {
    var body: some View {
        threeColorDots(width: 80, height: 20)
            .padding(.leading, 7)
    }
}

struct loadingpage_backbutton: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            navigation_backbutton()
                .padding(.leading, 20)
        }
    }
}

struct loadingpage_text: View {
    var body: some View {
        Text("Getting results...")
            .font(.system(size: 24, weight: .bold, design: .default))
            .foregroundStyle(.white)
    }
}


