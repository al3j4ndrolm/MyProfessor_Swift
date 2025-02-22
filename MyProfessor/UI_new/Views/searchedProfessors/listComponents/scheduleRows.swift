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
                    if isExpanded {
                        ForEach(scheduleArray, id: \.self) { element in
                            HStack {
                                scheduleDetails(stringElement: element)
                                whereAbouts(stringElement: element)
                                    .offset(y: -1)
                            }
                        }
                    } else {
                        ForEach(scheduleArray.prefix(1), id: \.self) { element in
                            HStack {
                                scheduleDetails(stringElement: element)
                                whereAbouts(stringElement: element)
                                    .offset(y: -1)
                            }
                        }
                    }
                }
                crnUI(inputCRN: crn)
                    .padding(.vertical, 9)
                Button(action: {
                    withAnimation(.easeOut(duration: 0.25)) {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "x.circle.fill" : "arrow.down.circle.fill")
                        .foregroundColor(.black)
                }.offset(y: 10)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, isExpanded ? (scheduleArray.count > 1 ? 9 : 2) : 0)
        .background(RoundedRectangle(cornerRadius: 32).fill(Color.white))
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
        let result = inputData.components(separatedBy: "/")
        if result.count >= 2 {
            return result[0].replacingOccurrences(of: "·", with: "") + " at " + result[1]
        }
        return inputData
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
