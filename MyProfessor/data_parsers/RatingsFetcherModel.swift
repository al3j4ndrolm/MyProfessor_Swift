//
//  RatingsFetcherModel.swift
//  MyProfessor3
//
//  Created by Leonard on 11/17/24.

import Foundation

func GetProfessorRatings(professor: String) async throws -> ProfessorRatings {
    guard var components = URLComponents(string: "https://myprofessor-get-ratings-api.onrender.com/professor") else {
        return ProfessorRatings(
            difficulty: "0.0", overallRating: "0.0", ratingsQuantity: "N/A", wouldTakeAgain: "N/A"
        )
    }

    let name = professor.split(separator: " ")
    
    guard name.count >= 2 else {
        print("name formatted weirdly \(name)")
        return ProfessorRatings(
            difficulty: "0.0", overallRating: "0.0", ratingsQuantity: "N/A", wouldTakeAgain: "N/A"
        )

    }
    let fullName = "\(name[0])+\(name[1])"
    components.queryItems = [
        URLQueryItem(name: "name", value: fullName)
    ]
    
    guard let url = components.url else { return ProfessorRatings(
        difficulty: "0.0", overallRating: "0.0", ratingsQuantity: "N/A", wouldTakeAgain: "N/A"
    )
 }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let professorRatings = try decoder.decode(ProfessorRatings.self, from: data)
    
    return professorRatings
}

struct ProfessorRatings: Codable {
    var difficulty: String
    var overallRating: String
    var ratingsQuantity: String
    var wouldTakeAgain: String
}

