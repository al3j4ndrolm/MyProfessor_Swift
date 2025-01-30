//
//  threeColorDots.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/19/25.
//

import SwiftUI

//New ui colors

let redNew = Color(red: 1, green: 0.7, blue: 0.7)
let yellowNew = Color(red: 1, green: 0.93, blue: 0.56)
let greenNew = Color(red: 0.83, green: 1, blue: 0.64)

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
            .foregroundStyle(yellowNew)
    }
}

struct newRedCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(redNew)
    }
}

struct newGreenCircle: View {
    var body: some View {
        Circle()
            .foregroundStyle(greenNew)
    }
}

#Preview {
    threeColorDots()
}
