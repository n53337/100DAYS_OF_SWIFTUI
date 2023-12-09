//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by u53f on 08/12/2023.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum:DailyScrum
    @State private var newAttendeeName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Metting Info"){
                    TextField("Title", text: $scrum.title)
                    HStack{
                        Slider(value: $scrum.lengthInDouble, in: 5...30, step: 1)
                        Text("\(scrum.lengthInMinutes) minutes")
                    }
                    ThemePicker(selected: $scrum.theme)
                }
                
                Section("Attendees"){
                    ForEach(scrum.attendees){ attendee in
                        Text(attendee.name)
                    }
                    .onDelete{ attendee in
                        scrum.attendees.remove(atOffsets: attendee)
                    }
                    
                    HStack{
                        TextField("New Attendee", text: $newAttendeeName)
                        Button(action:{
                            withAnimation{
                                let attendee = DailyScrum.Attendee(name: newAttendeeName)
                                scrum.attendees.append(attendee)
                                newAttendeeName = ""
                            }
                        }){
                            Image(systemName: "plus.circle.fill")
                        }
                        .disabled(newAttendeeName.isEmpty)
                    }
                }
                
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(.emptyScrum))
    }
}
