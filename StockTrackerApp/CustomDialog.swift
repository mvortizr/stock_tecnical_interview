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
    let action: () -> ()
    let textfieldLabel: String
    @State private var userInput = ""

    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .bold()
                .padding()
            TextField(textfieldLabel, text: $userInput)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 20)
            Button {
                action()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.black)
                    
                    Text(buttonTitle)
                        .font(.system(size: 16, weight:.bold))
                        .foregroundColor(.white)
                        .padding()
                }
                    .padding()
            }
        }
        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .padding()
        .background(.black)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay{
            VStack {
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                    }.tint(.white)
                }
                
                Spacer()
            }.padding()
        }
        .shadow(radius:20)
        .padding(30)
    }
}

#Preview {
    CustomDialog(title: "New Stock Symbol", buttonTitle: "Ok", action: {
        print("Button tapped!")
    }, textfieldLabel: "Enter new Stock Symbol")
}
