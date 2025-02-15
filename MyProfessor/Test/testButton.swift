//
//  testButton.swift
//  MyProfessor
//
//  Created by Alejandro Lopez on 2/12/25.
//

import SwiftUI

struct testButton: View {
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    do {
                        try await getCurrentTerms()
                    }
                }
            }) {
                Text("Get terms")
            }
        }
    }
}
