//
//  userClassSearchSchedulesHeader.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/7/25.
//

import SwiftUI

struct userClassSearchSchedulesHeader: View {
    
    @State var department: String = "MATH"
    @State var courseCode: String = "1D"
    
    @State var selectedQuarter: String = "Winter"
    @State var currentYear: String = "2025"
    
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
        Text(department ?? "ERROR Department not found")
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundStyle(.white)
    }
    
    private var courseCodeText: some View {
        Text(courseCode ?? ", Error Course not Found")
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundStyle(.white)
    }
    
    private var quarterAndYearText: some View {
        Text("\(selectedQuarter ?? "") \(currentYear ?? "")")
            .font(.system(size: 15, weight: .semibold, design: .default))
            .foregroundStyle(.white)
    }
}

#Preview {
    userClassSearchSchedulesHeader()
}
