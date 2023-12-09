//
//  DetailView.swift
//  Scrumdinger
//
//  Created by u53f on 08/12/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum:DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var showEdit = false
    
    var body: some View {
        List{
            Section("Meeting Info"){
                NavigationLink(destination: MettingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                }
                
                HStack{
                    Label("Length", systemImage: "clock")
                        
                    Spacer()
                    Text("\(scrum.lengthInMinutes)")
                         
                }
                         
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                        Spacer()
                    Text("\(scrum.theme.rawValue)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                    
                }
            }
            
            
            Section("Attendees"){
                ForEach(scrum.attendees){ attendee in
                    Label("\(attendee.name)", systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                showEdit = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $showEdit){
            NavigationStack{
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                showEdit = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                showEdit = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            DetailView(scrum: .constant(.sampleData[0]))
        }
    }
}
