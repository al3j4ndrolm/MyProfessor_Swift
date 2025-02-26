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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                professorNameComponent
            professorStatistics
                .padding(.leading, 5)
        }
    }
    
    private var professorNameComponent: some View {
        Text(professorName)
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
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
                Text("Would take again: \(wouldTakeAgain ?? "")%")
                    .foregroundStyle(.white)
                    .font(.system(size: 11, weight: .bold, design: .default))
            }
        }
    }
    
    
}
