//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by u53f on 08/12/2023.
//

import Foundation

struct DailyScrum: Identifiable {
    let id = UUID()
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var lengthInDouble: Double {
        get{
            Double(lengthInMinutes)
        }
        
        set{
            lengthInMinutes = Int(newValue)
        }
    }
    var theme: Theme
    
    
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id = UUID()
        let name:String
    }
    
    static var emptyScrum:DailyScrum = DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
}


extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"].map{Attendee(name: $0)},
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"].map{Attendee(name: $0)},
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"].map{Attendee(name: $0)},
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]
}
