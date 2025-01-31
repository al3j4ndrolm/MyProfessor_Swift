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
    
    //Will need to decide how to get current quarters right now this is temporary
    
    @State var quarterText: [String] = ["Fall 2024", "Winter 2025"]
    @State private var selectedFirstQuarter: Bool = true
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
            selectedQuarterText = quarterText[selectedFirstQuarter ? 0 : 1]
            //TODO == Get current quarters displayed in portal, and send that to the array quarterText, Initially the array quarterText should just be empty both [0] and [1]
            
            //In here We will fill the array with the quarter texts and load the buttons and initial chosen quarter like we have above this todo
        }
    }
    
    private var buttonFirstQuarter: some View {
        Button(action: {
            selectedFirstQuarter.toggle()
            selectedQuarterText = quarterText[0]
        }) {
            buttonFirstQuarterBody
        }
    }
    
    private var buttonSecondQuarter: some View {
        Button(action: {
            selectedFirstQuarter.toggle()
            selectedQuarterText = quarterText[1]
        }) {
            buttonSecondQuarterBody
        }
    }
    
    
    private var buttonFirstQuarterBody: some View {
        Text(quarterText[0])
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundStyle(selectedFirstQuarter ? selectedTextColour : .black)
            .padding(.vertical, 6)
            .frame(width: 125, height: 30)
            .background(RoundedRectangle(cornerRadius: 32).fill(selectedFirstQuarter ? greenButtonColor : unselectedColour))
    }
    
    private var buttonSecondQuarterBody: some View {
        Text(quarterText[1])
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundStyle(!selectedFirstQuarter ? selectedTextColour : .black)
            .padding(.vertical, 6)
            .frame(width: 125, height: 30)
            .background(RoundedRectangle(cornerRadius: 32).fill(!selectedFirstQuarter ? greenButtonColor : unselectedColour))
    }
    
}

#Preview {
    homepage_quarterButtons()
}
