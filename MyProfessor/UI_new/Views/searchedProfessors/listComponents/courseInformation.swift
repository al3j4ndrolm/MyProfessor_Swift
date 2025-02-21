//
//  courseInformation.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/18/25.
//

import SwiftUI

struct courseInformation: View {
    
    @State var allSchedules: [String:[String]] = [
        "39320": [
            "M·W····/04:00 PM-06:15 PM/ONLINE",
            "M·W····/04:00 PM-06:17 PM/ONLINE",
            "M·W····/04:00 PM-06:16 PM/ONLINE",
        ],
        "39133": [
            "M·W····/04:00 PM-06:15 PM/ONLINE"
        ]
    ]
    //Change allschedules on appear with a call to get professor schedule
    @State var classStatus: String? = "Open" // logic issue here but whatever
    //We need to find a way to connect the class status with their respective Crns
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(Array(allSchedules.keys), id: \.self) { crn in
                if let scheduleArray = allSchedules[crn] {
                    scheduleRows(crn: crn,
                                      scheduleArray: scheduleArray,
                                      classStatus: classStatus)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    ZStack {
        backgroundColorLight()
        courseInformation()
    }
}
