//
//  formatters.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 4/17/25.
//
import Foundation

func formatterRSBtn(in input: String) -> String {
       if input.range(of: #" \d"#, options: .regularExpression) != nil {
           return input
       }
       if let digitRange = input.range(of: #"\d"#, options: .regularExpression) {
           return input[..<digitRange.lowerBound] + " " + input[digitRange.lowerBound...]
       }
    return input
}

func quarterTextCleanerForSearch(str: String) -> (String, String) {
    let full = str.components(separatedBy: " ")
    return (full[0], full[2])
}

func quarterTextCleaner(str: String) -> String {
    let full = str.components(separatedBy: " ")
    return String(full[0] + " " + full[1])
}
