//
//  NewUserScreen.swift
//  MyProfessor
//
//  Created by Alejandro Lopez on 1/28/25.
//

import SwiftUI

struct NewUserScreen: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            gradienBlackToWhiteBackground()
            
            VStack(alignment: .leading, spacing: 20) {
                welcomeMessage() // Welcome message at the top
                
                // Features List
                featureObject(featureContentText: "Search for professors of any\nspecific class you are going to take")
                featureObject(featureContentText: "Register for classes in less than 5 seconds")
                featureObject(featureContentText: "Have early access to academic schedules")
            }
            .padding(.horizontal, 20) // Horizontal padding for alignment
            .padding(.top, 100) // Vertical padding to offset from the top
        }
        .ignoresSafeArea()
    }
}

struct featureObject: View {
    var featureContentText: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Circle()
                .fill(Color(red: 0.83, green: 1, blue: 0.64))
                .frame(width: 45, height: 45)

            Text(featureContentText)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

struct gradienBlackToWhiteBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.black,  // Dark at the top
                Color(red: 0.1, green: 0.1, blue: 0.1), // Very dark gray
                Color(red: 0.2, green: 0.2, blue: 0.2)  // Subtle gray at bottom
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct welcomeMessage: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            firstLine()
            appLogo().padding(.top, 1)
            secondLine()
        }
    }
    
    struct firstLine: View {
        var body: some View {
            Text("Welcome to")
                .font(.system(size: 35, weight: .bold))
                .foregroundColor(.white)
        }
    }
    
    struct secondLine: View {
        var body: some View {
            Text("Here you will be able to:")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
    }
}


