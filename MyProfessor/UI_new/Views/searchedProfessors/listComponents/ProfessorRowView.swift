//
//  ProfessorRowView.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/25/25.
//

import SwiftUI
import Foundation

struct ProfessorRowView: View {
    @ObservedObject var professor: Professor
    @State private var isLoading = true
    
    // Initialize with default values to avoid binding errors.
    @State private var ratings: ProfessorRating = ProfessorRating(
        overallRating: "N/A",
        numRatings: "N/A",
        wouldTakeAgain: "N/A",
        difficulty: "N/A"
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            if isLoading {
                elementHeader(
                    professorName: professor.name,
                    ratings: ratings.overallRating,
                    difficulty: ratings.difficulty,
                    wouldTakeAgain: ratings.wouldTakeAgain
                )
            } else {
                elementHeader(
                    professorName: professor.name,
                    ratings: ratings.overallRating,
                    difficulty: ratings.difficulty,
                    wouldTakeAgain: ratings.wouldTakeAgain
                )
            }
        }
        .task {
            // Fetch the ratings asynchronously.
            if let fetchedRatings = await getProfessorRating(for: professor.name) {
                ratings = fetchedRatings
            }
            isLoading = false
        }
    }
}
