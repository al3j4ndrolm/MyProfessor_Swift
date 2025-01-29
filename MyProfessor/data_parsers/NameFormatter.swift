//
//  NameFormatter.swift
//  MyProfessor-SwiftUI
//
//  Created by Alejandro Lopez on 1/17/25.
//


// Format the names from "LAST_NAME, FIRST_NAME" to "FIRST_NAME LAST_NAME"

func formatName(_ name: String) -> String {
    let parts = name.split(separator: ",")
    
    guard parts.count == 2 else {
        return name
    }
    
    let lastName = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
    let firstName = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
    
    let formattedName = "\(firstName.capitalized) \(lastName.capitalized)"
    return formattedName
}
