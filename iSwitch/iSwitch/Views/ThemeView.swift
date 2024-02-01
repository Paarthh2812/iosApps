//
//  ThemeView.swift
//  iSwitch
//
//  Created by Paarth Parikh on 01/02/24.
//

import SwiftUI


struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text("")
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}


struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
