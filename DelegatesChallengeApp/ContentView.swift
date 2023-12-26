//
//  ContentView.swift
//  DelegatesChallengeApp
//
//  Created by Lucas Lopes on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var zipText = ""
    @State private var value = 0
    @State private var toggleText = ""
    @State private var canEditText = false
    
    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            VStack {
                TextField("Zip Code", text: $zipText).onReceive(zipText.publisher.collect())
                {
                    zipText = String($0.prefix(5))
                }.background(.white).cornerRadius(3.0).font(.system(size: 18, weight: .regular))
                
                CurrencyTextField(numberFormatter: numberFormatter, value: $value).padding(20).overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.3), lineWidth:1))
                    .frame(height: 50).background(.white).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                HStack{
                    TextField("Enable to enter text", text: $toggleText).disabled(!canEditText)
                        .background(.white).cornerRadius(3.0).font(.system(size: 18, weight: .regular)).frame(width: 250)
                    Toggle("", isOn: $canEditText)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
