//
//  HtmlFetcher.swift
//  MyProfessor
//
//  Created by Alejandro Lopez on 2/17/25.
//

import Foundation

func fetchHTML(from urlString: String) async -> String? {
    guard let url = URL(string: urlString) else {
        print("❌ Invalid URL")
        return nil
    }

    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("✅ Final URL: \(httpResponse.url?.absoluteString ?? "Unknown")")
        }

        return String(data: data, encoding: .utf8)
    } catch {
        print("❌ Error fetching HTML: \(error)")
        return nil
    }
}
