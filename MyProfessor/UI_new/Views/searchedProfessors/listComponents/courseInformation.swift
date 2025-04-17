//
//  courseInformation.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct courseInformation: View {
    
    @State var allSchedules: [String:[String]]
    @State private var classStatus: String? = "Open" 
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            ForEach(Array(allSchedules.keys), id: \.self) { crn in
                if let scheduleArray = allSchedules[crn] {
                    scheduleRows(crn: crn,
                                 scheduleArray: scheduleArray,
                                 classStatus: findClassStatus(scheduleElement: scheduleArray[0]))
                }
            }
        }.onAppear {
            print(allSchedules)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func findClassStatus(scheduleElement: String) -> String {
        let start = scheduleElement.startIndex
        let end = scheduleElement.index(start, offsetBy: 8)
        let results = String(scheduleElement[start..<end])
        
        switch results {
            case let value where value.contains("Open"):
                return "Open"
            case let value where value.contains("Full"):
                return "Full"
            case let value where value.contains("WL"):
                return "WL"
            default:
                return "N/A"
        }
    }

    
    
}


