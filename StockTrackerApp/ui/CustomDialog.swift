//
//  CustomDialog.swift
//  StockTrackerApp
//
//  Created by Maria on 10/26/24.
//

import SwiftUI

struct CustomDialog: View {
    let title: String
    let buttonTitle: String
    let action: (String) -> Void
    let textfieldLabel: String
    let closeAction: () -> Void // New parameter for closing action
    
    @State private var userInput = ""
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 20))
                .padding()
            TextField(textfieldLabel, text: $userInput)
                .foregroundColor(.black)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
            Button {
                action(userInput)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    Text(buttonTitle)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                        .padding()
                }
                .padding()
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .background(.black)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        closeAction() // Close dialog on "x" button tap
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .tint(.white)
                }
                Spacer()
            }
            .padding()
        }
        .shadow(radius: 20)
        .padding(30)
    }
}

