//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Nicolas Papegaey on 17/12/2020.
//

import SwiftUI

struct BigBlueTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

extension View {
    func bluestyled() -> some View {
        self.modifier(BigBlueTitle())
    }
}


struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}


extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}


struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    
    @State private var useRedText = false
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    var motto3: some View { Text("Draco dormiens") }
    
    var body: some View {
        VStack {
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "Hacking with Swift")
            VStack(spacing: 10) {
                CapsuleText(text: "First").titleStyle()
                CapsuleText(text: "Second").modifier(Title())
            }
            VStack {
                Text("Gryffindor").bluestyled()
                Text("Hufflepuff")
                    .font(.title2)
                motto1
                motto2
                motto3
            }
            .font(.title)
            /* VStack {
                Text("Gryffindor")
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 5)
            
            Button("Hello World") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(Color.red)
            
            Text("Hello World")
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.blue)
                .padding()
                .background(Color.green)
                .padding()
                .background(Color.yellow)
        
            Button("Hello World") {
                // flip the Boolean between true and false
                self.useRedText.toggle()
            }
            .foregroundColor(useRedText ? .red : .blue)
             */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
