//
//  elementHeader.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct elementHeader: View {
    @State var professorName: String
    @Binding var Loading: Bool
    
    @State var ratings: String?
    @State var difficulty: String?
    @State var wouldTakeAgain: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
                professorNameComponent
                loadingComponent
                .padding(.leading, 5)
        }
    }
    
    private var professorNameComponent: some View {
        Text(professorName)
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
    }
    
    private var loadingComponent: some View {
        VStack {
            if !Loading {
                threeColorDots(width: 45, height: 12) //Wil make another component of 3 loading colour dots that will be animated
            } else {
                professorStatistics //MARK: Todo = Ratings, Difficulty, Would Take again
            }
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
                Text("Would take again: \(wouldTakeAgain ?? "")%")
                    .foregroundStyle(.white)
                    .font(.system(size: 11, weight: .bold, design: .default))
            }
        }
    }
    
    
}

#Preview {
    ZStack {
        backgroundColorLight()
        elementHeader(professorName: "Vinh Nguyen", Loading: .constant(true), ratings: "4.5", difficulty: "1.8", wouldTakeAgain: "94")
    }}
