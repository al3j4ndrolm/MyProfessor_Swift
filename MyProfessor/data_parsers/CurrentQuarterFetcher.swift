//
//  CurrentQuarterFetcher.swift
//  MyProfessor-SwiftUI
//
//  Created by Alejandro Lopez on 1/17/25.
//

//This function is getting the current term the school is at.

func getCurrentTerm() async throws -> String {
    
    do {
        
        let soup = try await getSoupFromWebsite(url: "https://www.deanza.edu/schedule/")
        // current_term is the button that appears as active on the website.
        let current_term = try soup.select(".btn-term.control.active")
        return try current_term.text()
        
    } catch {
        return "Unable to fetch: Current TERM"
    }
}


