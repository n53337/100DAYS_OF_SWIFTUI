//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by u53f on 08/12/2023.
//

import SwiftUI

struct ThemeView: View {
    let theme:Theme
    
    var body: some View {
        Text(theme.rawValue)
            .frame(maxWidth: .infinity)
            .padding(4)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .cornerRadius(4)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .bubblegum)
    }
}
