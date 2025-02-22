//
//  RatingsFetcherModel.swift
//  MyProfessor3
//
//  Created by Leonard on 11/17/24.

import Foundation
import SwiftSoup
    
func getProfessorRating(professor: inout Professor) async {
    
    let deAnzaCollegeCode = "1967"
    let formattedName = formatProfessorName(name: professor.name)
    do {
        let parsedRmpHtml = try SwiftSoup.parse(await fetchHTML(from: "https://www.ratemyprofessors.com/search/professors/\(deAnzaCollegeCode)?q=\(formattedName[0])%20\(formattedName[1])")!)
        fetchRatingData(html: parsedRmpHtml, professorInstance: &professor)
    } catch {
        return
    }
}

private func fetchRatingData(html: Document, professorInstance: inout Professor) {
    do {
        
        guard let professor = try html.select("a.TeacherCard__StyledTeacherCard-syjs0d-0").first() else {
                    print("Professor card not found")
                    return
                }
        let ratingTotal = try professor.select("[class^=CardNumRating__CardNumRatingNumber]").first()?.ownText() ?? "N/A"
        let numberOfRatings = try professor.select(".CardNumRating__CardNumRatingCount-sc-17t4b9u-3.jMRwbg")
        let wouldTakeAgainAndDifficulty = try professor.select(".CardFeedback__CardFeedbackNumber-lq6nix-2.hroXqf")
        professorInstance.overallRating = ratingTotal
        professorInstance.numRatings = try numberOfRatings.text()
        professorInstance.wouldTakeAgain = try wouldTakeAgainAndDifficulty[0].text()
        professorInstance.difficulty = try wouldTakeAgainAndDifficulty[1].text()

        print("the fetching ended")
    } catch {
        return
    }
}

private func formatProfessorName(name: String) -> Array<Substring> {
    
    var formattedName: Array<Substring> = []
    
    if name.contains(",") {
        formattedName = name.split(separator: ",").reversed()
        return formattedName
    } else {
        formattedName = name.split(separator: " ")
        return formattedName
    }
}


