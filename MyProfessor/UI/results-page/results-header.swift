//
//  results-header.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 1/1/25.
//

import SwiftUI

struct resultsHeader: View {
    
    @State var courseText: String = ""
    @State var quarterText: String = ""
    
    var body: some View {
       header
    }
    private var header: some View {
        VStack {
            rowColoredDotsLogo()
                .offset(y: 5)
            courseHeader
            quarterHeader
        }
    }
    
    private var courseHeader: some View {
        Text(courseText)
            .foregroundStyle(.primary)
            .font(.custom("Lato-Bold", size: 40))
    }
    
    private var quarterHeader: some View {
        Text(quarterText)
            .font(.title2)
            .fontWeight(.semibold)
    }
}

#Preview {
    resultsHeader()
}
