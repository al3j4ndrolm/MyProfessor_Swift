//
//  RegisterRoot.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/26/25.
//

import SwiftUI

struct RegisterRoot: View {
    
    var body: some View {
        
        ZStack {
            backgroundColorLight()
            VStack(alignment: .leading) {
                header
                RegisterBody().padding(.top, 35)
                Spacer()
            }
        }.ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                loadingpage_backbutton()
                loadingpage_circles()
            }
            Text("Registration").font(.system(size: 32, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 20)
                .padding(.top, 10)
            divider
                .padding(.top, 10)
                .padding(.leading, 17)
        }
        .padding(.top, 75)
    }
    
    private var divider: some View {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 148, height: 1)
          .background(.white)
    }
    
    
}

#Preview {
    RegisterRoot()
}
