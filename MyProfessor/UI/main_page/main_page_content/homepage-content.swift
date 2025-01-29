//
//  homepage-content.swift
//  MyProfessor-SwiftUI
//
//  Created by Leonard Wibowo on 12/29/24.
//

import SwiftUI

struct homepageContent: View {
    
    @State var selectedButtonIsFirstButton: Bool = true
    
    @State var quarterText: String = ""
    @State var quarterButtonState: Bool = true
    
    @State private var pressed = false
    @State var userText = ""
    
    @StateObject var getTerms = ProfessorsFetcher()
    @State var terms: [[String:String]] = []
    @State var quarterCode = ""
    @State var firstTerm: (String?, String?) = ("", "")
    @State var secondTerm: (String?, String?) = ("", "")
    @State private var currentTerm: String = "Loading..."
    
    @State var searchHistory: [searchHistoryElement] = [] {
        didSet {
            saveSearch()
        }
    }
    @State var userdefaultkey: String = "history_list"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                HeaderText
                    .padding(.top, 17)
                    .padding(.leading, 24)
                navigateSearchSection
                    .padding(.vertical, 28)
//                Text("search history clear") TO BE ADDED IN FUTURE UPDATES
//                    .onTapGesture {
//                        UserDefaults.standard.removeObject(forKey: userdefaultkey)
//                    }
//                searchHistoryList (To be implemented in future updates)
                
                Spacer()
            }
            Spacer()
        }
        .background(contentContainer())
        .onAppear {
            Task {
                do {
                    terms = try await getTerms.getTerms()
                    firstTerm = ("S2025", "Spring 2025")
                    secondTerm = (terms[1]["term_code"], terms[1]["term_text"])
                    
                    //Setup initial button choice
                    quarterCode = firstTerm.0 ?? ""
                    quarterText = firstTerm.1 ?? ""
                    selectedButtonIsFirstButton = true
                    
                    //setup search history
                    getHistory()
                    
                }
            }
        }
        .navigationDestination(isPresented: $pressed){
            if let (departmentCode, courseCode) = splitStringByFirstInteger(input: userText) {
                results(departmentCode: departmentCode, courseCode: courseCode, termCode: quarterCode, quarterYearForUI: quarterText)
            }
        }
    }
    
    // TO BE IMPLEMENTED IN FUTURE UPDATES!
    
//    private var searchHistoryList: some View {
//        VStack {
//            ForEach(searchHistory, id: \.id) { history in
//                    Text("\(history.searchText) + \(history.quarterYear)")
//                
//            }
//        }
//    }
    
    private func addToHistory() {
        if searchHistory.count >= 5 { searchHistory.removeFirst() }
        searchHistory.append(searchHistoryElement(searchText: userText.capitalized, quarterYear: quarterText))
        print(searchHistory)
    }
    
    private func getHistory() {
        guard let data = UserDefaults.standard.data(forKey: userdefaultkey) else {
            return
        }
        guard let savedHistory = try? JSONDecoder().decode([searchHistoryElement].self, from: data) else {return}
        
        self.searchHistory = savedHistory
    }
    
    private func saveSearch() {
        if let encodedData = try? JSONEncoder().encode(searchHistory) {
            UserDefaults.standard.set(encodedData, forKey: userdefaultkey)
        }
    }
    
    private func splitStringByFirstInteger(input: String) -> (String, String)? {
        let trimmedInput = input.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
        if let range = trimmedInput.range(of: "\\d", options: .regularExpression) {
            let beforeInteger = String(trimmedInput[..<range.lowerBound])
            let afterInteger = String(trimmedInput[range.lowerBound...])
            return (beforeInteger.uppercased(), afterInteger.uppercased())
        }
        return nil
    }
    
    private var HeaderText: some View {
        VStack(alignment: .leading) {
//            welcomeText (TO BE ADDED IN FUTURE UPDATES)
            currentQuarterInformationText()
        }
    }
    
    private var navigateSearchSection: some View {
        VStack(alignment: .leading){
            searchNavigationHeader
                .padding(.horizontal, 30)
            SearchBar(userText: $userText, toggleField: $pressed) {
                addToHistory()
            }
                .padding(.horizontal, 24)
            QuarterButtons
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
        }
    }
    
private var QuarterButtons: some View {
    HStack(spacing: 16){
        QuarterButton(title: firstTerm.1 ?? "", isSelected: selectedButtonIsFirstButton) {
            quarterCode = firstTerm.0 ?? ""
            quarterText = firstTerm.1 ?? ""
            selectedButtonIsFirstButton = true
            
        }
        QuarterButton(title: secondTerm.1 ?? "", isSelected: !selectedButtonIsFirstButton) {
            quarterCode = secondTerm.0 ?? ""
            quarterText = secondTerm.1 ?? ""
            selectedButtonIsFirstButton = false
        }
    }
}
    
    private var searchNavigationHeader: some View {
        Text("Search professors by class")
            .foregroundStyle(Color.secondary)
            .fontWeight(.semibold)
            .font(.subheadline)
    }
    
    // TO BE ADDED IN FUTURE UPDATES
    
//    private var welcomeText: some View {
//        Text("Welcome back, Guest")
//            .foregroundStyle(.black)
//            .font(.subheadline)
//            .fontWeight(.semibold)
//    }
//
    
    private var BtnQuarterNew: some View {
        Text("\(firstTerm.1 ?? "")")
            .foregroundStyle(.white)
            .font(Font.custom("Lato", size: 15))
            .frame(maxWidth: 100)
            .padding(.horizontal, 3)
            .padding(.vertical, 5)
            .background(Color.blue)
            .cornerRadius(20)
    }
    private var BtnQuarterLate: some View {
        Text("\(secondTerm.1 ?? "")")
            .foregroundStyle(.white)
            .font(Font.custom("Lato", size: 15))
            .frame(maxWidth: 100)
            .padding(.horizontal, 3)
            .padding(.vertical, 5)
            .background(Color.blue)
            .cornerRadius(20)
    }
}
struct QuarterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(isSelected ? Color.white : Color.gray.opacity(0.7))
                .font(Font.custom("Lato", size: 15))
                .frame(maxWidth: 100)
                .padding(.horizontal, 3)
                .padding(.vertical, 5)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.15))
                .cornerRadius(20)
        }    }
}

struct searchHistoryElement: Identifiable, Codable {
    var id: UUID = UUID()
    var searchText: String //user search text
    var quarterYear: String // firstterm.1/secondterm.1
}

#Preview {
    homepageContent()
}
