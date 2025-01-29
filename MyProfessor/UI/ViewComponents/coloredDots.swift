//
//  MyProfessor-3-colour-dots.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/1/25.
//

import SwiftUI

struct rowColoredDotsLogo: View {
    var body: some View {
        HStack{
            redCircle()
                .frame(width: 20, height: 20)
            yellowCircle()
                .frame(width: 20, height: 20)
                .offset(x: -2.5)
            greenCircle()
                .frame(width: 20, height: 20)
                .offset(x: -3.5)
        }
    }
}

struct redCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(red)
    }
}

struct yellowCircle : View {
    var body: some View {
        Circle()
            .foregroundStyle(yellow)
    }
}

struct greenCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(green)
    }
}

#Preview {
    rowColoredDotsLogo()
}
