//
//  searchedClassSchedules.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/6/25.
//

import SwiftUI

struct searchedClassSchedules: View {
    
    //use the above information we receive from homepage to search using vm
    let term: [String] //[Fall , 2024] -> Unpack in parent
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
