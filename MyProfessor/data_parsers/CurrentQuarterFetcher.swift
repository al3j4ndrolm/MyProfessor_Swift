//
//  CurrentQuarterFetcher.swift
//  MyProfessor-SwiftUI
//
//  Created by Alejandro Lopez on 1/17/25.
//

//This function is getting the current term the school is at.

func getCurrentTerms() async throws -> [(termText: String, termCode: String)] {
    
    do {
        let soup = try await getSoupFromWebsite(url: "https://www.deanza.edu/schedule/")
        // current_term is the button that appears as active on the website.
        let term1 = try soup.select("#btn1")
        let term2 = try soup.select("#btn2")
        let termsResult: [(termText: String, termCode: String)] = [(termText: try term1.text(), termCode: try term1.attr("value")), (termText: try term2.text(), termCode: try term2.attr("value"))]
        return termsResult
        
    } catch {
        return [(termText: "No available" , termCode: "No available")]
    }
}


