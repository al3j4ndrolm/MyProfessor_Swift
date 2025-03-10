//
//  homepage_body.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

struct homepage_body: View {
    
    @State var searchInisiated: Bool = false
    @State var searchText: String = ""
    @State var selectedQuarter: Bool = true
    @State var showWarning: Bool = false
    @State var quarters: [(termText: String, termCode: String)] = [(termText: "Fetching...", termCode: "NA"), (termText: "Fetching...", termCode: "NA")]
    //bro wrote an essay
    
    var body: some View {
        VStack{
            searchByClassText
            searchNavigationBody
            quarterButtons
            registrationButton(sid: "20555154", pin: "020202")
            
            Spacer()
        }
        .onAppear {
            Task {
                do {
                    quarters = try await getCurrentTerms()
                }
            }
        }
        .padding(.top , 20)
        .navigationDestination(isPresented: $searchInisiated) {
            SearchedProfessors(quarters: quarters[selectedQuarter ? 0 : 1], departmentAndCourseNumber: searchText)
            //MARK: Todo = Figure out this quarters tuple structure
        }
    }
    
    private var quarterButtons: some View {
        VStack {
            HStack {
                firstQuarterButton
                secondQuarterButton
            }
            if showWarning {
                Text("Please enter a course in the required format")
                    .foregroundColor(.red)
                    .font(.footnote)
                    .frame(maxHeight: 20)
            }
        }
        .padding(.leading, 30)
        .padding(.trailing, 100)
        .padding(.top)
    }
        
    
    private var firstQuarterButton: some View {
        Button(action:
                {
            selectedQuarter = true
            
        }) {
            homepageQuarterButtonBuilder(selected: $selectedQuarter, quarterText: $quarters[0].0)
        }
        
    }
    
    private var secondQuarterButton: some View {
        Button(action:
                {
            selectedQuarter = false
            
        }) {
            homepageQuarterButtonBuilder(selected: not($selectedQuarter), quarterText: $quarters[1].0)
        }
    }
    
    
    private var searchNavigationBody: some View {
        HStack {
            searchBarHomepage
            magnifyingGlassButton
        }
        .padding(.leading, 16)
        .padding(.trailing, 38)
    }
    
    private var magnifyingGlassButton: some View {
        Button(action: {
            if searchText == "" {
               showWarning = true
            }
            else {
                searchClassByText()
            }
        }) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 32, weight: .semibold, design: .default))
                .foregroundStyle(.white)
        }
    }
    
    private func searchClassByText() {
        searchInisiated = true
    }
    
    
    private var searchBarHomepage: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $searchText)
                .onSubmit {
                    if searchText == "" {
                       showWarning = true
                    }
                    else {
                        searchClassByText()
                    }
                }
                .foregroundColor(.black)
                .padding(.leading, 20)
                .padding(.vertical, 12)
                .background(RoundedRectangle(cornerRadius: 32).fill(Color(
                    red: 0.85,
                    green: 0.85,
                    blue: 0.85)))
                .padding(.leading, 13)
            if searchText.isEmpty {
                Text("Ex. Math 1A")
                    .font(.subheadline) // Set the font to subheadline
                    .italic() // Apply italic style
                    .fontWeight(.semibold) // Apply font weight
                    .foregroundColor(.secondary.opacity(0.7)) // Set placeholder color
                    .padding(.leading, 31)
                    .padding(.vertical, 12)
                
            }
        }
    }
    
    private var searchByClassText: some View {
        HStack {
            Text("Search by class")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.leading, 20)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        backgroundColor()
        homepage_body()
    }
}

func not(_ value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}
