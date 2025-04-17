//
//  elementHeader.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct elementHeader: View {
    let professorName: String
    let ratings: String?
    let difficulty: String?
    let wouldTakeAgain: String?
    let numReview: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                professorNameComponent
            professorStatistics
                .padding(.leading, 5)
        }
    }
    
    private func shortenProfessorName(_ fullName: String) -> String {
        var parts = fullName.split(separator: " ").map(String.init)
        
        if parts.count >= 2 {
            let lastName = parts[1]
            if lastName.count > 8 {
                parts[1] = String(lastName.first!) + "."
            }
        }
        
        return parts.joined(separator: " ")
    }
    
    private var professorNameComponent: some View {
        HStack(alignment: .bottom, spacing: 4) {
            Text(shortenProfessorName(professorName))
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold, design: .default))
            Text(numReview ?? "0" + "reviews")
                .font(.system(size: 8, weight: .semibold))
                .foregroundStyle(.white)
            EmailProfessorBtn()
                .padding(.leading, 9)
        }
    }
    
    private var professorStatistics: some View {
        HStack(spacing: 7) {
            HStack(spacing: 4){
                newGreenCircle()
                    .frame(width: 12, height: 12)
                Text("Rating: \(ratings ?? "")")
                    .foregroundStyle(.white)
                    .font(.system(size: 11, weight: .bold, design: .default))
            }
            HStack(spacing: 4){
                newYellowCircle()
                    .frame(width: 12, height: 12)
                Text("Difficulty: \(difficulty ?? "")")
                    .foregroundStyle(.white)
                    .font(.system(size: 11, weight: .bold, design: .default))
            }
            HStack(spacing: 4){
                newRedCircle()
                    .frame(width: 12, height: 12)
                Text("Would take again: \(wouldTakeAgain ?? "")")
                    .foregroundStyle(.white)
                    .font(.system(size: 11, weight: .bold, design: .default))
            }
        }
    }
    
    
}
