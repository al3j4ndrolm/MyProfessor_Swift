//
//  homepage_quarterButtons.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 1/31/25.
//

import SwiftUI

let selectedTextColour = Color(red: 0.25, green: 0.48, blue: 0.37)
let unselectedColour = Color(red: 0.85, green: 0.85, blue: 0.85)

struct homepage_quarterButtons: View {
    
    
    // Now quarters will be storing the array of tuples with both termText and termCode.
    
    @State var quarters: [(termText: String, termCode: String)] = [(termText: "Fetching...", termCode: "NA"), (termText: "Fetching...", termCode: "NA")]
    @State private var selectedQuarter: Bool = true
    @State private var selectedQuarterText = ""
    
    var body: some View {
        HStack {
            buttonFirstQuarter
                .padding(.leading, 30)
            buttonSecondQuarter
                .padding(.leading, 10)
            Spacer()
        }
        .padding(.top, 18)
        .onAppear {
            Task {
                quarters = try await getCurrentTerms()
            }
        }
    }
     
    private var buttonFirstQuarter: some View {
        Button(action: {
            if selectedQuarter == false {
                selectedQuarter.toggle()
            }
            
        }) {
            buttonFirstQuarterBody
        }
    }
    
    private var buttonSecondQuarter: some View {
        Button(action: {
            if selectedQuarter == true {
                selectedQuarter.toggle()
            }
        }) {
            buttonSecondQuarterBody
        }
    }
    
    
    private var buttonFirstQuarterBody: some View {
        Text(quarters[0].0)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundStyle(selectedQuarter ? selectedTextColour : .black)
            .padding(.vertical, 6)
            .frame(width: 125, height: 30)
            .background(RoundedRectangle(cornerRadius: 32).fill(selectedQuarter ? greenButtonColor : unselectedColour))
    }
    
    private var buttonSecondQuarterBody: some View {
        Text(quarters[1].0)
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundStyle(!selectedQuarter ? selectedTextColour : .black)
            .padding(.vertical, 6)
            .frame(width: 125, height: 30)
            .background(RoundedRectangle(cornerRadius: 32).fill(!selectedQuarter ? greenButtonColor : unselectedColour))
    }
    
}

#Preview {
    homepage_quarterButtons()
}
