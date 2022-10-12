//
//  ContentView.swift
//  Text Editor
//
//  Created by Kiki Chan on 6/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var userText = ""
    @State var capMode = 1
    
    var body: some View {
        VStack {
            
            Spacer()
            
            if capMode == 1 {
                Text(userText.uppercased())
                    .font(.largeTitle)
            } else if capMode == 2 {
                Text(userText.capitalized)
                    .font(.largeTitle)
            } else {
                Text(userText.lowercased())
                    .font(.largeTitle)
            }
            
            Spacer()
            
            Button(action:{
                if capMode == 1 {
                    UIPasteboard.general.string = userText.uppercased()
                } else if capMode == 2 {
                    UIPasteboard.general.string = userText.capitalized
                } else {
                    UIPasteboard.general.string = userText.lowercased()
                }
            }) {
                RoundedButton(title: "Copy", color: .orange)
            }
            
            HStack {
                Button(action:{
                    capMode = 1
                }) {
                    RoundedButton(title: "CAPS", color: .blue)
                }
                
                Button(action:{
                    capMode = 2
                }) {
                    RoundedButton(title: "First Letter", color: .green)
                }
                
                Button(action:{
                    capMode = 3
                }) {
                    RoundedButton(title: "lowercase", color: .red)
                }
            }
            
            TextField("Enter text here...", text: $userText)
                .padding()
            
        }
        .padding()
        
    }
}

struct RoundedButton: View {
    
    var title: String
    var color: Color
    
    var body: some View {
        Text(title)
        .padding(10)
        .frame(maxWidth:.infinity)
        .background(color)
        .font(.headline)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
