//
//  searchedProfessors.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct SearchedProfessors: View {
    @State var quarters: (termText: String, termCode: String)
    @State var departmentAndCourseNumber: String?
    @StateObject var professorsFetcher = ProfessorsFetcher()
    @State var loadProfessors: Bool = true
    
    var body: some View {
        ZStack {
            if !loadProfessors && professorsFetcher.Professors.isEmpty {
                backgroundColorLight()
                edgeCases
            }
            else if !loadProfessors {
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
            departmentAndCourseNumber = cleaningUserInput(userInput: departmentAndCourseNumber ?? "").uppercased()
            Task {
                await professorsFetcher.getAllProfessors(
                    className: departmentAndCourseNumber?.components(separatedBy: " ").first ?? "",
                    classCode: departmentAndCourseNumber?.components(separatedBy: " ").last ?? "",
                    termCode: quarters.termCode)
                withAnimation(.easeIn(duration: 0.3)) {
                    loadProfessors = false
                }//Get professors, send Instructions to Child view
            }
        }.navigationBarBackButtonHidden(true)
    }
   //do not touch this is made by a well renowned wizard, G sensei.
    private func cleaningUserInput(userInput: String) -> String {
        let cleanedInput = userInput.filter { !$0.isWhitespace }
        if let range = cleanedInput.range(of: "\\d", options: .regularExpression) {
            let index = range.lowerBound
            return cleanedInput.prefix(upTo: index) + " " + cleanedInput.suffix(from: index)
        }
        return cleanedInput
    }
    
    private var edgeCases: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                loadingpage_backbutton()
                loadingpage_circles()
                Spacer()
            }
            .padding(.top, 56)
            Text("Your search")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundStyle(.white).opacity(0.85)
                .padding(.top, 45)
                .padding(.leading, 30)
            Text("\(departmentAndCourseNumber ?? "")")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundStyle(.red).opacity(0.85)
                .padding(.leading, 45)
            Text("was bad :(")
                .font(.system(size: 30, weight: .bold, design: .default))
                .foregroundStyle(.white).opacity(0.85)
                .padding(.leading, 75)
            
            Spacer()
            HStack {
                Spacer()
                myProfessorLogo_loadingScreen()
                    .padding(.bottom, 30)
                Spacer()
            }
        }.ignoresSafeArea()
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


