//
//  Theme.swift
//  iSwitch
//
//  Created by Paarth Parikh on 01/02/24.
//

import SwiftUI


enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indego
    case lavender
    case megenta
    case navy
    case orangee
    case oxblood
    case periwinkle
    case poppy
    case purplee
    case seafoam
    case sky
    case tan
    case teel
    case yelow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orangee, .periwinkle, .poppy, .seafoam, .sky, .tan, .teel, .yelow: return .black
        case .indego, .megenta, .navy, .oxblood, .purplee: return .white
        }
    }
    var mainColor: Color {
        Color(rawValue)
    }
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
    
}
