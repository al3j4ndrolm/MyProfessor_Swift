//
//  homepage_header.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/30/25.
//

import SwiftUI

struct homepage_header: View {
    
    
    var body: some View {
        VStack {
            threeColorDotsAndMenuDropdown
            welcomeGuestUsername
            dateText
        }
        .padding(.leading, 20)
        .padding(.top, 45)
        .ignoresSafeArea()
    }
    
    private var threeColorDotsAndMenuDropdown: some View {
        HStack {
            threeColorDots(width: 80, height: 20)
                .padding(.top, 55)
            Spacer()
        }
    }
    
    private var welcomeGuestUsername: some View {
        HStack{
                Text("Welcome back!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top, 20)
            Spacer()
        }
    }
    
    private var dateText: some View {
        HStack {
            Text("\(getDate())")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .offset(y: 6)
            Spacer()
        }
    }
}

#Preview {
    homepage_header()
}
