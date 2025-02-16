//
//  userClassSearchSchedulesHeader.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/7/25.
//

import SwiftUI

struct userClassSearchSchedulesHeader: View {
    
    let term: [String]?   // List of term(e.g., ["Fall", "2024"])
    let classInputs: [String]? // List of class input (e.g., ["Math", "1A"])
    //The class inputs have already been filtered down to searchable strings.
    //If any errors from the function come back than we show the error in Body not header.
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                topHeader
                courseDepartmentAndCourseCode
                quarterAndYearText
            }
            
        }.ignoresSafeArea(.all)
    }
    
    //Organizing
    private var topHeader: some View {
        HStack {
            backButton
            threeColorDots(width: 80, height: 20)
        }
        .padding(.leading, 22)
        .padding(.top, 56)
    }
    private var divider: some View {
        Rectangle()
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, maxHeight: 1)
            .padding(.leading, 22)
            .padding(.trailing, 150)
            .padding(.top, 23)
    }
    private var backButton: some View {
        Button(action: {
            dismiss()
        }) {
            navigation_backbutton()
        }
    }
    //Components
    private var courseDepartmentAndCourseCode: some View {
        VStack {
            if let classInputs = classInputs,
               classInputs.count == 2,
               let department = classInputs.first,
               let code = classInputs.last {
                Text("\(department) \(code)".capitalized)
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundStyle(.white)
            }
            else {
                Text("Error: Bad search input")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundStyle(.red)
            }
        }        .padding(.leading, 22)
            .padding(.top, 10)
    }
    
    private var quarterAndYearText: some View {
        VStack {
            if let term = term,
               term.count == 2 {
                Text("\(term[0]) \(term[1])")
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundStyle(.white)
            }
            else {
                Text("Error with fetching terms") // if this ever happends then the function broke
                    .font(.system(size: 15, weight: .semibold, design: .default))
                    .foregroundStyle(.red)
            }
        }.padding(.leading, 22)
    }
    
    
    
}
/*Font ->
 Text("")
     .font(.system(size: 15, weight: .semibold, design: .default))
     .foregroundStyle(.white)
*/
#Preview {
    userClassSearchSchedulesHeader(term: ["Fall", "2025"], classInputs: ["Math","1A"])
}
