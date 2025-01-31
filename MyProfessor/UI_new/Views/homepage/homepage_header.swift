//
//  homepage_header.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/30/25.
//

import SwiftUI

struct homepage_header: View {
    
    @State var username: String
    
    var body: some View {
        VStack {
            threeColorDotsAndMenuDropdown
            welcomeGuestUsername
            dateText
        }
        .padding(.leading, 20)
        .ignoresSafeArea()
    }
    
    private var threeColorDotsAndMenuDropdown: some View {
        HStack {
            logoDots
                .padding(.top, 55)
            Spacer()
            menuDropdown
                .padding(.top, 50)
                .padding(.trailing, 20)
        }
    }
    
    //Notes: I dont know what kind of animation or feature you want here, so ill leave it for later
    private var menuDropdown: some View {
        Image(systemName: "line.3.horizontal")
            .font(.system(size: 48, weight: .bold, design: .default))
            .foregroundStyle(.white)
    }
    
    private var logoDots: some View {
            threeColorDots()
                .frame(width: 80,height: 20)
    }
    
    private var welcomeGuestUsername: some View {
        HStack{
            if username != ""{
                Text("Welcome back,\n\(username)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top, 20)
            }
            else {
                Text("Welcome back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.top, 20)
            }
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
    homepage_header(username: "Leonard")
}
