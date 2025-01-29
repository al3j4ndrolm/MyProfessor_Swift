//
//  result-content-component.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/9/25.
//
//
import SwiftUI

struct result_content_component: View {
    
    @State var professor: Professor
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                professorName
                ratings
                schedule_component(professorElement: professor)
            }
            Spacer()
        }  .padding(.top, 18)
            .padding(.leading, 15)
    }
    private var professorName: some View {
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
    
    private var ratings: some View {
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
                .frame(width: 14,height: 14)
            Text("Difficulty: \(professor.difficulty, specifier: "%.1f")")
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
        }
    }
    
    
    
}

#Preview {
    result_content_component(professor: Professor(name: "Vinh Nguyen", allSchedules: [:], numRatings: 0, difficulty: 0, overallRating: 0, wouldTakeAgain: 0))
}
