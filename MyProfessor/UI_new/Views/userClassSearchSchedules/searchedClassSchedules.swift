//
//  searchedClassSchedules.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/6/25.
//

import SwiftUI

struct searchedClassSchedules: View {
    
    //use the above information we receive from homepage to search using vm

    
    
    var body: some View {
        ZStack {
            backgroundColorLight()
            
            VStack {
                HStack{
                    userClassSearchSchedulesHeader()
                    Spacer()
                }
                Spacer()
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    searchedClassSchedules()
}
