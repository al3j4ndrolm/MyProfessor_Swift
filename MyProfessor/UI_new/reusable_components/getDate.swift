//
//  File.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/30/25.
//

import Foundation


func getDate() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM d, yyyy"
    
    return dateFormatter.string(from: date)
}
