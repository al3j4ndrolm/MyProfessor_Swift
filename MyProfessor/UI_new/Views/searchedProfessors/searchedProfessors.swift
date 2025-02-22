//
//  searchedProfessors.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

//Root

struct searchedProfessors: View {
    @State var departmentAndCourseNumber: String? = "MATH 1D"
    @State var quarterYear: String? = "Winter 2025"
    
    //Professor and Ratings caller here --> var ProfessorList
    
    var body: some View {
        ZStack {
            backgroundColorLight()
            VStack(alignment: .leading, spacing: 0) {
                searchedProfessorsHeader(
                    departmentAndCourseNumber: departmentAndCourseNumber,
                    quarterYear: quarterYear)
                .padding(.leading, 20)
                searchedProfessorsBody
                Spacer()
                
            }
        }
    }
    
    //Foreach Professors -> , Loading == loading time for .onappear {}
    private var searchedProfessorsBody: some View {
            ScrollView() {
                VStack(alignment: .leading) {
                elementHeader(professorName: "Vinh Nguyen", Loading: .constant(true))
                        .padding(.leading)
                courseInformation() //allschedules: [string: [string]], courseStatus: [string:string]
            }
        }.padding(.top, 25)
    }
}

#Preview {
    searchedProfessors()
}
