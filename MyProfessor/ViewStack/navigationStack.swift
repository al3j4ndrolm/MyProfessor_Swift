//
//  SwiftUIView.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/10/25.
//

import SwiftUI

struct userNavigationFlow: View {
    @StateObject private var RSModel = RecentSearchModel()
    
    
    var body: some View {
        NavigationStack {
            homepage()
        }.environmentObject(RSModel)
    }
}

#Preview {
    userNavigationFlow()
}
