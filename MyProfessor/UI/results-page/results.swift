//
//  results.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/1/25.
//

import SwiftUI
struct results: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var professorSearchLoading: Bool = false
    
    @State var departmentCode: String
    @State var courseCode: String
    @State var termCode: String
    
    @State var quarterYearForUI: String
    
    @StateObject var dataVM = DataTunnelVM()
    @StateObject var getProfessors = ProfessorsFetcher()
    
    var body: some View {
        ZStack {
            PageBackgroundBuilder(asset_path: "homepage-search")
                .opacity(0.65)
            
            VStack {
                resultsHeader(courseText: departmentCode + " " + courseCode, quarterText: quarterYearForUI)
                
                if professorSearchLoading {
                    VStack(alignment: .leading) {
                        if dataVM.professorData.isEmpty {
                            HStack {
                                Text("We couldn't find a course using that code. Please double-check your search.")
                                    .font(.headline)
                                    .foregroundStyle(Color.red.opacity(0.9))
                                    .fontWeight(.semibold)
                                    .padding()
                                Spacer()
                            }
                        } else {
                            ScrollView {
                                VStack(alignment: .leading) {
                                    ForEach(dataVM.professorData, id: \.name) { professor in
                                        HStack {
                                            VStack(alignment: .leading) {
                                                professorName(professor: professor)
                                                ratings(professor: professor)
                                                schedule_component(professorElement: professor)
                                            }
                                            Spacer()
                                        }
                                        .padding(.top, 18)
                                        .padding(.leading, 15)
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    .background(contentContainer())
                    .padding(.top)
                } else {
                    VStack {
                        HStack {
                            ProgressView()
                                .padding(.leading, 15)
                                .padding(.top, 15)
                            Spacer()
                        }
                        Spacer()
                    }
                        .background(contentContainer())
                        .padding(.top)
                }
                Spacer()
            }
            
            // Place the back button outside of the toolbar, directly in ZStack
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        back_button()
                    }
                    Spacer()
                }
                .padding(.horizontal, 13)
                .padding(.top, 51)
                Spacer()
            }.ignoresSafeArea()
        }
        .onAppear {
            Task {
                try await callProfessorData()
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
    }
    
    private func professorName(professor: Professor) -> some View {
        HStack {
            Text("\(professor.name)")
                .font(.custom("Lato-bold", size: 24))
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
            Text("\(professor.numRatings) reviews")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundStyle(Color.gray)
                .offset(y: 3)
            Spacer()
        }
    }
    
    private func ratings(professor: Professor) -> some View {
        HStack {
            redCircle()
                .frame(width: 14, height: 14)
                .padding(0)
            Text("Reccomended: \(professor.wouldTakeAgain, specifier: "%.0f")%")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
            yellowCircle()
                .frame(width: 14, height: 14)
            Text("Rating: \(professor.overallRating, specifier: "%.1f")")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
            greenCircle()
                .frame(width: 14, height: 14)
            Text("Difficulty: \(professor.difficulty, specifier: "%.1f")")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
        }
    }
    
    fileprivate func callProfessorData() async throws {
        do {
            let fetchedData = try await getProfessors.getProfessorData(
                departmentCode: departmentCode,
                courseCode: courseCode,
                termCode: termCode
            )
            await MainActor.run {
                professorSearchLoading.toggle()
            }
            try await dataVM.searchProfessorAndGetRatings(
                professors: fetchedData,
                departmentCode: departmentCode,
                courseCode: courseCode,
                termCode: termCode
            )
        } catch {
            print("Error occurred: \(error)")
        }
    }
}

#Preview {
    results(departmentCode: "MATH", courseCode: "1C", termCode: "W2025", quarterYearForUI: "")
}
