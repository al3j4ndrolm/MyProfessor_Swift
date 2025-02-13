//
//  threeColorDots.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct threeColorDots: View {
    @State var width: CGFloat
    @State var height: CGFloat
    
    var body: some View {
        HStack {
            newGreenCircle()
            newYellowCircle()
            newRedCircle()
        }
        .frame(width: width, height: height)
    }
}

struct newYellowCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(yellow)
    }
}

struct newRedCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(red)
    }
}

struct newGreenCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(green)
    }
}

#Preview {
    threeColorDots(width: 30, height: 30)
}
