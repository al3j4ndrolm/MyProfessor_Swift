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
    @State private var ratings: ProfessorRatings = ProfessorRatings(
        difficulty: "0.0", overallRating: "0.0", ratingsQuantity: "N/A", wouldTakeAgain: "N/A"
    )

    
    var body: some View {
        VStack(alignment: .leading) {
            if isLoading {
                elementHeader(
                    professorName: formatName(professor.name),
                    ratings: ratings.overallRating,
                    difficulty: ratings.difficulty,
                    wouldTakeAgain: ratings.wouldTakeAgain
                )
            } else {
                elementHeader(
                    professorName: formatName(professor.name),
                    ratings: ratings.overallRating,
                    difficulty: ratings.difficulty,
                    wouldTakeAgain: ratings.wouldTakeAgain
                )
            }
        }
        .task {
            do {
            ratings = try await GetProfessorRatings(professor: professor.name)
            } catch {
                
            }
            isLoading = false
        }
    }
}
