//
//  RatingsFetcherModel.swift
//  MyProfessor3
//
//  Created by Leonard on 11/17/24.

import Foundation
import SwiftSoup

func getProfessorRating(for professorName: String) async -> ProfessorRating? {
    let deAnzaCollegeCode = "1967"
    let formattedName = formatProfessorName(name: professorName)
    let urlString = "https://www.ratemyprofessors.com/search/professors/\(deAnzaCollegeCode)?q=\(formattedName[0])%20\(formattedName[1])"
    
    do {
        guard let htmlContent = await fetchHTML(from: urlString) else {
            print("Failed to fetch HTML content.")
            return nil
        }
        let parsedRmpHtml = try SwiftSoup.parse(htmlContent)
        return try fetchRatingData(from: parsedRmpHtml)
    } catch {
        print("Error parsing HTML or fetching rating data: \(error)")
        return nil
    }
}


private func fetchRatingData(from html: Document) throws -> ProfessorRating? {
    guard let professorElement = try html.select("a.TeacherCard__StyledTeacherCard-syjs0d-0").first() else {
        print("Professor card not found")
        return nil
    }
    
    let ratingTotal = try professorElement.select("[class^=CardNumRating__CardNumRatingNumber]").first()?.ownText() ?? "N/A"
    let numberOfRatings = try professorElement.select(".CardNumRating__CardNumRatingCount-sc-17t4b9u-3.jMRwbg").text()
    let feedbackElements = try professorElement.select(".CardFeedback__CardFeedbackNumber-lq6nix-2.hroXqf")
    
    guard feedbackElements.count >= 2 else {
        print("Insufficient feedback data")
        return nil
    }
    
    let wouldTakeAgain = try feedbackElements[0].text()
    let difficulty = try feedbackElements[1].text()
    
    return ProfessorRating(
        overallRating: ratingTotal,
        numRatings: numberOfRatings,
        wouldTakeAgain: wouldTakeAgain,
        difficulty: difficulty
    )
}


private func formatProfessorName(name: String) -> [String] {
    let formattedName: [String]
    
    if name.contains(",") {
        formattedName = name.split(separator: ",").reversed().map { $0.trimmingCharacters(in: .whitespaces) }
    } else {
        formattedName = name.split(separator: " ").map { $0.trimmingCharacters(in: .whitespaces) }
    }
    
    return formattedName
}



struct ProfessorRating {
    let overallRating: String
    let numRatings: String
    let wouldTakeAgain: String
    let difficulty: String
}
