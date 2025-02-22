//
//  searchedProfessorsHeader.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct searchedProfessorsHeader: View {
    @Environment(\.dismiss) private var dismiss
    @State var departmentAndCourseNumber: String?
    @State var quarterYear: String?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                backButton
                threeColorDots(width: 80, height: 20)
            }
            courseText
            quarterText
            Divider
                .padding(.top, 25)
        }
    }
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            navigation_backbutton()
        }
    }
    
    private var courseText: some View {
        Text(departmentAndCourseNumber ?? "")
            .foregroundStyle(.white)
            .font(.system(size: 32, weight: .bold, design: .default))
    }
    
    private var quarterText: some View {
        Text(quarterYear ?? "")
            .foregroundStyle(.white)
            .font(.system(size: 15, weight: .bold, design: .default))
    }
    
    private var Divider: some View {
        Rectangle()
        .foregroundColor(.clear)
        .frame(width: 148, height: 1)
        .background(.white)
    }
    
}

#Preview {
    ZStack {
        backgroundColor()
        searchedProfessorsHeader(departmentAndCourseNumber: "Math 1D", quarterYear: "Winter 2025")
    }
}
