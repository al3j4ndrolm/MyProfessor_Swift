//
//  searchBar.swift
//  MyProfessor3
//
//  Created by Leonard on 11/17/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var userText: String
    @Binding var toggleField: Bool
    var placeholder: String = "Ex. Math 1A"
    
    let saveSearch: () -> Void
    
    
    @FocusState private var isFocused: Bool // Focus state for the TextField
    
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .foregroundStyle(Color.secondary)
                .padding(.horizontal, 4)
            
            
            TextField(placeholder, text: $userText)
                .foregroundStyle(Color.secondary)
                .disableAutocorrection(true)
                .focused($isFocused)
                .onChange(of: userText) { oldValue, newValue in
                    if newValue.count > 10 {
                        userText = String(newValue.prefix(10)) // Limit to 10 characters
                    } //Give feature for indication later
                }
                .onSubmit {
                    toggleField.toggle()
                    isFocused = false
                    saveSearch()
                }
                .padding(.horizontal, 4)
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.secondary)
                .onTapGesture {
                    toggleField.toggle()
                    isFocused = false
                    saveSearch()
                }.padding(.horizontal, 8)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .font(.headline)
        .accessibilityLabel("Search Bar")
        .accessibilityHint("Enter the course code to search for professors")
        .background(searchbarBackground)
        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 8)
            }
    
    private var searchbarBackground: some View {
        
       RoundedRectangle(cornerRadius: 25)
           .foregroundStyle(Color.indigo.opacity(0.05))

    }
    
    
}

#Preview {
    SearchBar(userText: .constant(""), toggleField: .constant(false), saveSearch: {print("Save")} )
}

