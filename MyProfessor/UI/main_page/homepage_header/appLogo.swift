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
                .offset(x: 50, y: -5)
        }
    }

    private var appTitle: some View {
        VStack(alignment: .leading, spacing: -10) {
            Text("My")
                .font(.system(size: 40, weight: .bold))
            .foregroundColor(.white)
            Text("Professor")
                .font(.system(size: 40, weight: .bold))
            .foregroundColor(.white)
        }
    }
}
