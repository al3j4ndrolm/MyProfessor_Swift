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
                        await professorFetchTest.getAllProfessors(className: "SPAN", classCode: "4", termCode: "S2025")
                        print(professorFetchTest.Professors)
                    }
                }
            }) {
                Text("Get professors")
            }
        }
    }
}
