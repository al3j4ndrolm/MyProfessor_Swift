//
//  showCurrentQuarterText.swift
//  MyProfessor-SwiftUI
//
//  Created by Alejandro Lopez on 1/17/25.
//
import SwiftUI

// Shows the current quarter in De Anza College

struct currentQuarterInformationText: View {
    @State var currentTerm = "Loading..."
    
    var body: some View {
        
        Text("Current quarter: \(currentTerm)")
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .task {
                await loadCurrentTerm()
        }
    }
    
    fileprivate func loadCurrentTerm() async {
            do {
                let term = try await getCurrentTerm()
                currentTerm = term  // UI automatically updates
            } catch {
                currentTerm = "Error fetching term"
            }
        }

}
