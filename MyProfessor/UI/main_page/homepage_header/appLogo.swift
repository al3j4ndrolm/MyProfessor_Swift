//
//  appLogo.swift
//  MyProfessor-SwiftUI
//
//  Created by Alejandro Lopez on 1/18/25.
//

import SwiftUI

struct appLogo: View {
    
    var body: some View {
        ZStack {
            appTitle
            rowColoredDotsLogo()
                .offset(x: 40,y: -15)
        }
    }
    
    private var appTitle: some View {
        VStack(alignment: .leading) {
            Text("My")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Professor")
                .font(.largeTitle)
                .fontWeight(.bold)
                .offset(y: -8)
        }
        .frame(width: 173)
    }
    
    
}
