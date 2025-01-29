//
//  HttpUtil.swift
//  MyProfessor
//
//  Created by Leonard on 11/17/24.
//

import Foundation
import SwiftSoup

// Input the URL of a Website will make it return the soup to find the data.
    
func getSoupFromWebsite(url: String) async throws -> Document {
    
    guard let url = URL(string: url) else {
        throw URLError(.badURL)
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
        throw URLError(.badServerResponse)
    }
    
    guard let htmlpage = String(data: data, encoding: .utf8) else {
        throw URLError(.cannotDecodeContentData)
    }
    
    return try SwiftSoup.parse(htmlpage)
}




