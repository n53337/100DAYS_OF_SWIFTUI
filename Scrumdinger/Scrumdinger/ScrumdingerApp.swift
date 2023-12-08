//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by u53f on 08/12/2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
