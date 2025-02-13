//
//  userClassSearchSchedulesHeader.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/7/25.
//

import SwiftUI

struct userClassSearchSchedulesHeader: View {
    
    let term: [String]   // List of term(e.g., ["Fall", "2024"])
    let classInputs: [String] // List of class input (e.g., ["Math", "1A"])
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    backButton
                    threeColorDots(width: 80, height: 20)
                }
                .padding(.leading, 22)
                .padding(.top, 56)
                
                HStack {
                    courseDepartmentText
                    courseCodeText
                }
                .padding(.leading, 22)
                .padding(.top, 10)
                HStack {
                    quarterAndYearText
                }
                .padding(.leading, 22)
                Rectangle()
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .padding(.leading, 22)
                    .padding(.trailing, 150)
                    .padding(.top, 23)
            }
            
        }.ignoresSafeArea(.all)
    }
    
    
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            navigation_backbutton()
        }
    }
    
    private var courseDepartmentText: some View {
        Text(classInputs[0] ?? "ERROR Department not found")
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundStyle(.white)
    }
    
    private var courseCodeText: some View {
        Text(classInputs[1] ?? ", Error Course not Found")
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundStyle(.white)
    }
    
    private var quarterAndYearText: some View {
        Text("\(term[0] ?? "") \(term[1] ?? "")")
            .font(.system(size: 15, weight: .semibold, design: .default))
            .foregroundStyle(.white)
    }
}

#Preview {
    userClassSearchSchedulesHeader(term: ["Fall", "2025"], classInputs: ["Math","1A"])
}
