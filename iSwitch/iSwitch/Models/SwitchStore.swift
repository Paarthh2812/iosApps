//
//  SwitchStore.swift
//  iSwitch
//
//  Created by Paarth Parikh on 31/01/24.
//

import SwiftUI
import Foundation

@MainActor
class SwitchStore: ObservableObject {
    @Published var boards: [BoardData] = []

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrumsa.data")
    }
    
    func load() async throws {
            let task = Task<[BoardData], Error> {
                let fileURL = try Self.fileURL()
                guard let data = try? Data(contentsOf: fileURL) else {
                    return []
                }
                let boarddatas = try JSONDecoder().decode([BoardData].self, from: data)
                return boarddatas
            }
            let boards = try await task.value
            self.boards = boards
        }
    func save(boards: [BoardData]) async throws {
            let task = Task {
                let data = try JSONEncoder().encode(boards)
                let outfile = try Self.fileURL()
                try data.write(to: outfile)
                
            }
            _ = try await task.value
        }
}
