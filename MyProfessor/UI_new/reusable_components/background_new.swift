//
//  SwiftUIView.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

//Notes
//To use the background we make a zstack on whatever view you are going to use this background
/*
 Zstack {
    backgroundColor()
 under the backgroundColor you can then place whatever view you have
 }
 */

import SwiftUI

struct backgroundColor: View {
    let gradient = LinearGradient(
        gradient: Gradient(colors: [
            .black,
            .black.opacity(0.95),
            .black.opacity(0.85),
            .black.opacity(0.65)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                }
            }
            .background(gradient).ignoresSafeArea()
        }
    }
}

struct backgroundColorLight: View {
    let gradient = LinearGradient(
    gradient: Gradient(colors: [
        .black,
        .black.opacity(0.85),
        .black.opacity(0.65),
        .black.opacity(0.35)]),
    startPoint: .top,
    endPoint: .bottom
)

var body: some View {
    ZStack {
        HStack {
            Spacer()
            VStack {
                Spacer()
            }
        }
        .background(gradient).ignoresSafeArea()
    }
}
}

#Preview {
    backgroundColorLight()
}
