//
//  homepage_body.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

struct homepage_body: View {
    
    @State var searchInisiated: Bool = false
    @State var searchText: String = ""
    @State var terms = []
    
    var body: some View {
        VStack{
            searchByClassText
            searchNavigationBody
            homepage_quarterButtons()
            Spacer()
        }
        .padding(.top , 20)
        .navigationDestination(isPresented: $searchInisiated) {
            searchedClassSchedules(term: ["Fall", "2025"], classInput: searchText.components(separatedBy: " "))
        }
    }
    
    private var searchNavigationBody: some View {
        HStack {
            searchBarHomepage
            magnifyingGlassButton
        }
        .padding(.leading, 16)
        .padding(.trailing, 38)
    }
    
    private var magnifyingGlassButton: some View {
        Button(action: {
            searchClassByText()
        }) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 32, weight: .semibold, design: .default))
                .foregroundStyle(.white)
        }
    }
    
    private func searchClassByText() {
        searchInisiated = true //Send signal to searchedClassSchedules, they will process the loading
    }
    
    
    private var searchBarHomepage: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $searchText)
                .foregroundColor(.black) // Input text color
                .padding(.leading, 20)
                .padding(.vertical, 12)
                .background(RoundedRectangle(cornerRadius: 32).fill(Color(
                    red: 0.85,
                    green: 0.85,
                    blue: 0.85)))
                .padding(.leading, 13)
            if searchText.isEmpty {
                Text("Ex. Math 1A")
                    .font(.subheadline) // Set the font to subheadline
                    .italic() // Apply italic style
                    .fontWeight(.semibold) // Apply font weight
                    .foregroundColor(.secondary.opacity(0.7)) // Set placeholder color
                    .padding(.leading, 31)
                    .padding(.vertical, 12)
                
            }
        }
    }
    
    private var searchByClassText: some View {
        HStack {
            Text("Search by class")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.leading, 20)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        backgroundColor()
        homepage_body()
    }
}
