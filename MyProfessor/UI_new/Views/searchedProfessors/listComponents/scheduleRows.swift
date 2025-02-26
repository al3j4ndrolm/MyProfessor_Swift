//
//  scheduleRows.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct scheduleRows: View {
    let crn: String
    let scheduleArray: [String]
    let classStatus: String?
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                status
                VStack(alignment: .leading, spacing: 0) {
                    if !isExpanded {
                        HStack{
                            scheduleDetails(stringElement: scheduleArray[0])
                            whereAbouts(stringElement: scheduleArray[0])
                        }
                    } else {
                        ForEach(scheduleArray, id: \.self) { element in
                            HStack {
                                scheduleDetails(stringElement: element)
                                whereAbouts(stringElement: element)
                            }
                        }
                    }
                }
                crnUI(inputCRN: crn)
                    .padding(.vertical, 9)
                if scheduleArray.count > 1 {
                    buttonDropdown
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 3)
        .background(RoundedRectangle(cornerRadius: 32).fill(Color.white))
    }
    
    private var buttonDropdown: some View {
        Button(action: {
            withAnimation(.easeOut(duration: 0.25)) {
                isExpanded.toggle()
            }
        }) {
            Image(systemName: isExpanded ? "x.circle.fill" : "arrow.down.circle.fill")
                .foregroundColor(.black)
        }.offset(y: 10)
    }

    private var status: some View {
        Text(classStatus ?? "N/A")
            .font(.system(size: 11, weight: .bold))
            .foregroundStyle(.black)
            .padding(.vertical, 3)
            .padding(.horizontal, 6)
            .background(RoundedRectangle(cornerRadius: 32).fill(green))
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
            .padding(.vertical, 9)
    }
    
    private func scheduleDetails(stringElement: String) -> some View {
        Text(getSchedules(inputData: stringElement))
            .font(.system(size: 11, weight: .bold))
            .foregroundStyle(.black)
            .padding(.vertical, 12)
            .padding(.bottom, 2)
    }
    
    private func getSchedules(inputData: String) -> String {
        print("entering getschedules")
        let result = inputData.filter { $0 != "·"}.components(separatedBy: "/")
        print(result)
        return result[1] + " " + result[2]
    }
    
    private func whereAbouts(stringElement: String) -> some View {
        Text(getWhereabouts(inputData: stringElement))
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(.black)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(RoundedRectangle(cornerRadius: 32).fill(WHEREABOUTCOLOR))
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
    }
    
    private func getWhereabouts(inputData: String) -> String {
        return inputData.components(separatedBy: "/").last ?? "N/A"
    }
    
    private func crnUI(inputCRN: String) -> some View {
        Text(inputCRN)
            .font(.system(size: 11, weight: .semibold, design: .default))
            .foregroundStyle(.black)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .background(RoundedRectangle(cornerRadius: 32).fill(colourCRN))
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
    }
    
}
