//
//  createPin.swift
//  MyProfessor
//
//  Created by Leonard Wibowo on 2/17/25.
//

import SwiftUI

struct createPin: View {
    
    @State var newPin: String = ""
    @State var confirmPin: String = ""
    @State var navigateAsGuest: Bool = false
    @State var birthdate: Date = Date()
    @State var showingDatePicker = false
    
    
    var body: some View {
        ZStack {
            backgroundColor()
            VStack(alignment: .leading) {
                createPinHeader
                    .blur(radius: showingDatePicker ? 3 : 0)
                    .zIndex(0)
                birthdateField
                    .zIndex(1)
                PinTextfields
                    .blur(radius: showingDatePicker ? 3 : 0)
                    .zIndex(0)
                    .padding(.top, 12)
                navigation
                    .blur(radius: showingDatePicker ? 3 : 0)
                    .zIndex(0)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateAsGuest) {
            homepage(username: "Guest")
        }
    }
  
    private var createPinHeader: some View {
        VStack {
            myProfessorLogo()
                .padding(.horizontal, 111)
            VStack {
                Text("Welcome to MyProfessor!")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                + Text(" You will need to create a PIN to access your selected & enrolled courses")
                    .font(.system(size: 20, weight: .light, design: .default))
                    .foregroundStyle(.white.opacity(0.6))
            }.padding(.horizontal, 25)
        }
    }
    
    private var PinTextfields: some View {
        VStack {
            loginPageTextfields(context: "New Pin", placeholder: "ex. 123456", data: $newPin).textContentType(.username)
            loginPageSecureFields(context: "Confirm new PIN", placeholder: "Re enter your new PIN", data: $confirmPin).textContentType(.password)
        }
    }
    
    private var continueButton: some View {
        Button(action: {
            print("create new user instance")
        }) {
            BlueButtonUI
        }
    }
    
    private var continueAsGuest: some View {
        Button(action: {
            navigateAsGuest = true
        }) {
            GuestButtonUI
        }
    }
    
    private var navigation: some View {
        HStack {
            Spacer()
            VStack(alignment: .center, spacing: 0) {
                continueButton
                LoginPageSpacerBetweenGuestAndLoginButton
                continueAsGuest
            }.padding(.top, 32)
            Spacer()
        }
    }
    private var birthdateField: some View {
        VStack(alignment: .leading) {
            Text("Date of birth")
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundStyle(.white)
                .padding(.leading, 30)
            BirthdatePicker(selectedDate: $birthdate)
                .blur(radius: showingDatePicker ? 3 : 0)
                .overlay {
                    if showingDatePicker {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation(.smooth(duration: 0.35)) {
                                    showingDatePicker = false
                                }
                            }
                        VStack(spacing: 20) {
                            DatePicker("Select a Date",
                                       selection: $birthdate,
                                       displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .labelsHidden()
                            .padding()
                            
                            Button("Done") {
                                withAnimation(.smooth(duration: 0.35)) {
                                    showingDatePicker = false
                                }
                            }
                            .padding()
                        }
                        .frame(maxWidth: 300)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                        )
                        .shadow(radius: 10)
                        .transition(.scale)
                    }
                }
                .onTapGesture {
                    withAnimation {
                        showingDatePicker.toggle()
                    }
                }
        }
        .padding(.top, 20)
    }
    
}


#Preview {
    createPin()
}
