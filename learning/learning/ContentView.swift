//
//  ContentView.swift
//  learning
//
//  Created by u53f on 04/12/2023.
//

import SwiftUI


class User:ObservableObject {
    @Published var name:String
    @Published var age:Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var user = User(name: "usef", age: 21)

struct OtherView: View{

    @ObservedObject var usr = user
    
    var body: some View{
        Text(usr.name)
    }
}

struct ContentView: View {
    
    @ObservedObject var myUser = user
    @State public var showSheet = false

    var body: some View {
           
        VStack {
            Text("Hello, \(user.name)").badge(4)
            TextField("Enter a name", text: $myUser.name)
            OtherView()
            Button("Open Sheet"){
                showSheet.toggle()
            }
        }
           
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
