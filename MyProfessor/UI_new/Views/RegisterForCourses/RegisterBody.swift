//
//  RegisterBody.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/26/25.
//

import SwiftUI

struct RegisterBody: View {
    
    @State private var selectedQuarter: Bool = true
    @State var quarters: [(termText: String, termCode: String)] = [(termText: "Fetching...", termCode: "NA"), (termText: "Fetching...", termCode: "NA")]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Select term to register")
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 20)
            quarterButtons
            Text("\(quarters[selectedQuarter ? 0 : 1].termText)")
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 20)
                .padding(.top, 35)
        }
        .onAppear {
            Task {
                do {
                    quarters = try await getCurrentTerms()
                }
            }
        }
    }
    
    private var divider: some View {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 148, height: 1)
          .background(.white)
    }
    
    private var quarterButtons: some View {
        VStack {
            HStack {
                firstQuarterButton
                secondQuarterButton
            }
        }
        .padding(.leading, 20)
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
}

#Preview {
    RegisterBody()
}
