//
//  EmailProfessorBtn.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 4/16/25.
//

import SwiftUI

struct EmailProfessorBtn: View {
    var body: some View {
        Button(action: {
            print("gumball waterson sent an email to ms simian")
        }) {
            HStack(spacing:2) {
                Image(systemName: "envelope")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.white)
                Text("Message Professor")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    EmailProfessorBtn()
}
