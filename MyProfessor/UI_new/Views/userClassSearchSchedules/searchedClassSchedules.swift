//
//  searchedClassSchedules.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/6/25.
//

import SwiftUI

struct searchedClassSchedules: View {
    
    let term: [String]
    let classInput: [String]
    
    var body: some View {
        ZStack {
            backgroundColorLight()
            
            VStack {
                HStack{
                    userClassSearchSchedulesHeader(term: term, classInputs: classInput)
                    Spacer()
                }
                Spacer()
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    searchedClassSchedules(term: ["Fall", "2025"], classInput: ["Math","1A"])
}
