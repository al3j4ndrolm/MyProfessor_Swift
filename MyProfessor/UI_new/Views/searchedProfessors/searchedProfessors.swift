//
//  searchedProfessors.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct SearchedProfessors: View {
    @State var departmentAndCourseNumber: String? = "MATH 1D"
    @State var quarterYear: String? = "Winter 2025"
    @StateObject var professorsFetcher = ProfessorsFetcher()
    @State var loadProfessors: Bool = true

    var body: some View {
        ZStack {
            backgroundColorLight()
            VStack(alignment: .leading, spacing: 0) {
                searchedProfessorsHeader(departmentAndCourseNumber: departmentAndCourseNumber,
                                           quarterYear: quarterYear)
                    .padding(.leading, 20)
                searchedProfessorsBody
                Spacer()
            }
        }
        .onAppear {
            Task {
                await professorsFetcher.getAllProfessors(className: "MATH",
                                                         classCode: "1D",
                                                         termCode: "S2025")
                loadProfessors = false
                print(professorsFetcher.Professors.values)
                    //Get professors, send Instructions to Child view
            }
        }
    }
    
    private var searchedProfessorsBody: some View {
        if loadProfessors {
            AnyView(
            loadingPage()) //This is just a rough idea, still very buggy!
        } else {
            AnyView(
            ScrollView {
                VStack(spacing: 10) {
           
                    ForEach(Array(professorsFetcher.Professors.values), id: \.name) { professor in
                        ProfessorRowView(professor: professor)
                        //Child View takes professor name, and searches with it
                        //The object needed will be processed there
                    }
                }
                .padding(.horizontal)
            }
            )
        }
    }
}

