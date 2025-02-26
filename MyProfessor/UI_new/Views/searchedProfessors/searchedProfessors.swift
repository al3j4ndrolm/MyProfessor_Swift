//
//  searchedProfessors.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct SearchedProfessors: View {
    @State var quarters: (termText: String, termCode: String)
    @State var departmentAndCourseNumber: String? = "MATH 1D"
    @StateObject var professorsFetcher = ProfessorsFetcher()
    @State var loadProfessors: Bool = true
    
    var body: some View {
        ZStack {
            if !loadProfessors {
                backgroundColorLight()
                VStack(alignment: .leading, spacing: 0) {
                    searchedProfessorsHeader(departmentAndCourseNumber: departmentAndCourseNumber,
                                             quarterYear: quarters.termText)
                    .padding(.leading, 20)
                    
                    searchedProfessorsBody
                        .padding(.top, 10)
                    Spacer()
                }
            } else {
                loadingPage()
            }
        }
        .onAppear {
            Task {

                await professorsFetcher.getAllProfessors(className: departmentAndCourseNumber?.components(separatedBy: " ").first ?? "",
                                                         classCode: departmentAndCourseNumber?.components(separatedBy: " ").last ?? "",
                                                         termCode: quarters.termCode)
                withAnimation(.easeIn(duration: 0.3)) {
                    loadProfessors = false
                }//Get professors, send Instructions to Child view
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    private var searchedProfessorsBody: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                ForEach(Array(professorsFetcher.Professors.values), id: \.name) { professor in
                    ProfessorRowView(professor: professor)
                    //Child View takes professor name, and searches with it
                    //The object needed will be processed there
                    courseInformation(allSchedules: professor.allSchedules)
                }
            }
            .padding(.horizontal)
        }
    }
}
