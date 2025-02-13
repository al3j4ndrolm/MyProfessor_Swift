//
//  homepage_quarterButtons.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

let selectedTextColour = Color(red: 0.25, green: 0.48, blue: 0.37)
let unselectedColour = Color(red: 0.85, green: 0.85, blue: 0.85)

struct homepageQuarterButtonBuilder: View {
    @Binding var selected: Bool
    @State var quarterText: String
    
    var body: some View {
        VStack {
            buttonBody
        }
    }
    private var buttonBody: some View {
        Text(quarterText)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundStyle(selected ? selectedTextColour : .black)
            .padding(.vertical, 6)
            .frame(width: 125, height: 30)
            .background(RoundedRectangle(cornerRadius: 32).fill(selected ? greenButtonColor : unselectedColour))
    }
}

#Preview {
    homepageQuarterButtonBuilder(selected: .constant(true), quarterText: "Fall 2025")
}
