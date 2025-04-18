//
//  userdefaultHead.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 4/17/25.
//

import Foundation
import SwiftUI

struct RSModel: Codable, Identifiable {
    let id = UUID()
    let quarter: String
    let searchText: String
}

class RecentSearchModel: ObservableObject {
    private let defKey   = "class_searches"
    private let maxCount = 20

    @Published private(set) var searches: [RSModel] = [] {
        didSet {
            saveSearches()
        }
    }

    init() {
        loadSearches()
    }

    func add(quarter: String, searchText: String) {
        let newEntry = RSModel(quarter: quarter, searchText: formatterRSBtn(in: searchText))
    
        if let idx = searches.firstIndex(where: { $0.searchText == newEntry.searchText  &&  $0.quarter == newEntry.quarter}) {
            searches.remove(at: idx)
        }

        searches.insert(newEntry, at: 0)

        if searches.count > maxCount {
            searches.removeLast()
        }
    }

    func remove(at index: Int) {
        guard searches.indices.contains(index) else { return }
        searches.remove(at: index)
    }


    private func loadSearches() {
        guard
            let data = UserDefaults.standard.data(forKey: defKey),
            let decoded = try? JSONDecoder().decode([RSModel].self, from: data)
        else {
            return
        }
        self.searches = decoded
    }

    private func saveSearches() {
        guard let data = try? JSONEncoder().encode(searches) else { return }
        UserDefaults.standard.set(data, forKey: defKey)
    }
}
