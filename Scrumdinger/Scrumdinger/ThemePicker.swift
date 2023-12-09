//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by u53f on 08/12/2023.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selected:Theme
    
    var body: some View {
        Picker("Select a theme", selection: $selected){
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
        
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selected: .constant(.bubblegum))
    }
}
