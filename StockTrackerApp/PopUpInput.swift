//
//  PopUpInput.swift
//  StockTrackerApp
//
//  Created by Maria on 10/25/24.
//

import Foundation

struct MyPopUp: View {
    @Binding var isPresented: Bool
    @Binding var userInput: String

    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Enter Your Input")
                    .font(.headline)
                    .padding()
                TextField("Enter text here", text: $userInput)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                HStack {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .padding()
                    Button("Submit") {
                        // Handle user input here
                        print("User input: \(userInput)")
                        isPresented = false
                    }
                    .padding()
                }
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding()
        }
    }
}
