//
//  recentSearchView.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 4/17/25.
//

import SwiftUI

struct recentSearchView: View {
    @EnvironmentObject var rs: RecentSearchModel
    var body: some View {
        VStack(alignment: .leading) {
            header
            recentSearches
        }
    }
    
    private var recentSearches: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView {
                ForEach(Array(rs.searches), id: \.id) { search in
                    HStack {
                        RSbtn(btnSearchText: search.searchText, quarterTextBtn: search.quarter)
                            .padding(.leading, 20)
                            .padding(.vertical, 5)
                        Spacer()
                    }
                }
            }
        }
    }
    
    private var header: some View {
        Text("Recent search")
            .font(.system(size: 24)).bold()
            .foregroundStyle(.white).padding(.leading, 20)
            .padding(.top, 28)
    }
}




#Preview {ZStack {
    backgroundColor()
    recentSearchView()
}
}
