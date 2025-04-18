//
//  RSbtn.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 4/17/25.
//

import SwiftUI

struct RSbtn: View {
    
    let btnSearchText: String
    let quarterTextBtn: String
    @State private var pressed: Bool = false
    var body: some View {
        Button(action: {
            pressed.toggle()
        }) {
            button
        }.navigationDestination(isPresented: $pressed) {
            SearchedProfessors(quarters: quarterTextCleanerForSearch(str: quarterTextBtn), departmentAndCourseNumber: btnSearchText)
        }

    }
    func insertSpaceBeforeFirstNumber(in input: String) -> String {
           if input.range(of: #" \d"#, options: .regularExpression) != nil {
               return input
           }
           if let digitRange = input.range(of: #"\d"#, options: .regularExpression) {
               return input[..<digitRange.lowerBound] + " " + input[digitRange.lowerBound...]
           }
        return input
    }
    
    private func quarterTextCleanerForSearch(str: String) -> (String, String) {
        let full = str.components(separatedBy: " ")
        return (full[0], full[2])
    }
    
    private func quarterTextCleaner(str: String) -> String {
        let full = str.components(separatedBy: " ")
        return String(full[0] + " " + full[1])
    }
    
    private var button: some View {
        HStack {
            Text(formatterRSBtn(in: btnSearchText).uppercased() + " - " + quarterTextCleaner(str: quarterTextBtn))
                .foregroundStyle(.white)
                .font(.system(size: 11, weight: .bold))
                .padding(.vertical, 6)
                .padding(.horizontal, 11)
                .frame(width: 165, height: 25)
                .background(RoundedRectangle(cornerRadius: 32).inset(by: 0.5).stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1))
        }
    }
}

#Preview {
    ZStack{
    backgroundColor()
}
}
