//
//  school_logo.swift
//  MyProfessor-SwiftUI
//
//  Created by Alejandro Lopez on 1/18/25.
//

import SwiftUI

struct schoolLogo: View {
    
     var body: some View {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 159, height: 70)
          .background(
            Image("DeAnza-Logo")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 159, height: 70)
              .clipped()
          )
    }
}
