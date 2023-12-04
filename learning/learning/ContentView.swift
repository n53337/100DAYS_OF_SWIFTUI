//
//  ContentView.swift
//  learning
//
//  Created by u53f on 04/12/2023.
//

import SwiftUI

struct Person{
    let name:String
}

struct ContentView: View {
    private let names = [Person(name: "usef"), Person(name: "khaled")]
    @State private var selected = ""
    @State private var enabled = false
    
    var body: some View {
        VStack{
        
            Form{
                Picker("Select", selection: $selected, content: {
                    ForEach(names, id: \.self.name){
                        Text("\($0.name)")
                    }
                })
                Toggle(isOn: $enabled) {
                    Text("Allow Notifications")
                }
        
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
