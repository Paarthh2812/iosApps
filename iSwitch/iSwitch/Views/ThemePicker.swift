//
//  ThemePicker.swift
//  iSwitch
//
//  Created by Paarth Parikh on 01/02/24.
//

import SwiftUI


struct ThemePicker: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Pick Color", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}


struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
