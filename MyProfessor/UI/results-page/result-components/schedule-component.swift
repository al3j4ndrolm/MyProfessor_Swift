//
//  schedule-component.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/10/25.
//

import SwiftUI

struct schedule_component: View {
    
    @State var professorElement: Professor
    @State var opened: Bool = false
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Schedule")
                .font(.caption)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.secondary)
                .padding(.horizontal, 65)
                .padding(.vertical, opened ? 2 : 0)
                .padding(.top, !opened ? 4 : 0)
                .onTapGesture {
                    opened.toggle()
                }
            if opened {
                VStack(alignment: .leading) {
                    ForEach(professorElement.allSchedules.map { ($0.key, $0.value)}, id: \.0) { classcode, schedules in
                        dataSchedule(scheduleString: schedules, crnString: classcode)
                    }
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 28).fill(Color(red: 0.92, green: 0.92, blue: 0.92)))
    }
    
    private func dataSchedule(scheduleString: [String], crnString: String) -> some View {
        HStack {
            schedule(schedule: scheduleString)
                .multilineTextAlignment(.leading)
            crn(crn: crnString)
        }
        .padding(.leading, 12)
        .padding(.trailing, 41)
        .padding(.bottom, 8)
    }
    
    private func schedule(schedule: [String]) -> some View {
        VStack {
            Text(schedule.first ?? "")
                .font(.custom("Lato-bold", size: 12))
                .foregroundStyle(Color.primary)
                .padding(.leading, 11)
                .padding(.trailing, 7)
                .padding(.vertical, 7)
        }.background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 0.85, green: 0.85, blue: 0.85)))
    }
    
    private func crn(crn: String) -> some View {
        VStack {
            Text(crn)
                .font(.custom("Lato-bold", size: 12))
                .foregroundStyle(Color.primary)
                .padding(.vertical, 3)
                .padding(.horizontal, 8)
        }.background(RoundedRectangle(cornerRadius: 16).fill(Color(red: 1, green: 0.83, blue: 0.65)))
    }
}

#Preview {
    schedule_component(professorElement: Professor(name: "Vinh Nguyen", allSchedules: [:], numRatings: 0, difficulty: 0, overallRating: 0, wouldTakeAgain: 0))
}
