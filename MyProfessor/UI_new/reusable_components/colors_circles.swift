//
//  threeColorDots.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

struct threeColorDots: View {
    
    var body: some View {
        HStack {
            newGreenCircle()
            newYellowCircle()
            newRedCircle()
        }
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
    threeColorDots()
}
