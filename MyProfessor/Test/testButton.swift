//
//  testButton.swift
//  MyProfessor
//
//  Created by Alejandro Lopez on 2/12/25.
//

import SwiftUI

struct testButton: View {
    var professorFetchTest = ProfessorsFetcher()
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    do {
                        await professorFetchTest.getAllProfessors(className: "MATH", classCode: "1A", termCode: "S2025")
                        print(professorFetchTest.Professors)
                        print("Now getting ratings -------------------- ")
                        for key in professorFetchTest.Professors.keys {
                            await getProfessorRating(professor: &professorFetchTest.Professors[key]!)
                        }
                        
                        print(professorFetchTest.Professors)
                    }
                }
            }) {
                Text("Get professors")
            }
        }
    }
}
