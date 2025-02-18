//
//  birthdate.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/17/25.
//

import SwiftUI

struct BirthdatePicker: View {
    @Binding var selectedDate: Date
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter
    }()
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(selectedDate, formatter: dateFormatter)")
                    .font(.subheadline)
                    .italic()
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 20)
                    .padding(.vertical , 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(searchBarColor)
                    )
                    .padding(.leading, 20)
                    .padding(.trailing, 30)
            }
        }
    }
}

#Preview {
    BirthdatePicker(selectedDate: .constant(Date()))
}
