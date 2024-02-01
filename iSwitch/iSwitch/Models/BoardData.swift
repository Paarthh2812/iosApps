//
//  BoardData.swift
//  iSwitch
//
//  Created by Paarth Parikh on 31/01/24.
//

import Foundation

struct BoardData: Identifiable,Codable {
    let id: UUID
    var identification: String
    var no_of_switch: Int
    var switch_names: [Switch_Names]
    var switch_state: [Bool]
    var IP_Add: String
    var theme : Theme
    
    init(id: UUID = UUID(), identification: String, no_of_switch: String, IP_Add: String) {
        self.id = id
        self.identification = identification
        self.no_of_switch = Int(no_of_switch) ?? 0
        self.IP_Add = IP_Add
        self.switch_names = (0..<self.no_of_switch).map { Switch_Names(name: "Switch\($0+1)") }
        self.switch_state = Array(repeating: false, count: self.no_of_switch)
        self.theme = .bubblegum
    }
}

extension BoardData {
    struct Switch_Names: Identifiable, Codable{
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    static var emptyBoard: BoardData {
        BoardData(identification: "", no_of_switch: "0", IP_Add: "")
        }
}

extension BoardData {
    static let sampleData: [BoardData] =
    [
        BoardData(identification: "Living Room",
                  no_of_switch: "4",
                  IP_Add: "192.168.0.100"),
        BoardData(identification: "Kitchen",
                  no_of_switch: "5",
                  IP_Add: "192.168.0.101"),
        BoardData(identification: "Living Room",
                  no_of_switch: "4",
                  IP_Add: "192.168.0.100"),
        BoardData(identification: "Kitchen",
                  no_of_switch: "5",
                  IP_Add: "192.168.0.101"),
        BoardData(identification: "Living Room",
                     no_of_switch: "4",
                     IP_Add: "192.168.0.100"),
           BoardData(identification: "Kitchen",
                     no_of_switch: "5",
                     IP_Add: "192.168.0.101"),
        BoardData(identification: "Living Room",
                    no_of_switch: "4",
                    IP_Add: "192.168.0.100"),
          BoardData(identification: "Kitchen",
                    no_of_switch: "5",
                    IP_Add: "192.168.0.101"),
        BoardData(identification: "Living Room",
                       no_of_switch: "4",
                       IP_Add: "192.168.0.100"),
        BoardData(identification: "Kitchen",
                       no_of_switch: "5",
                       IP_Add: "192.168.0.101"),
        BoardData(identification: "Living Room",
                      no_of_switch: "4",
                      IP_Add: "192.168.0.100"),
        BoardData(identification: "Kitchen",
                      no_of_switch: "5",
                      IP_Add: "192.168.0.101"),
    ]
}
