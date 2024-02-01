//
//  iSwitchApp.swift
//  iSwitch
//
//  Created by Paarth Parikh on 31/01/24.
//

import SwiftUI

@main
struct iSwitchApp: App {
    @StateObject private var store = SwitchStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            MainView(boards: $store.boards){
                Task {
                    do {
                        print("saving")
                        try await store.save(boards: store.boards)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "iSwitch will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.boards = BoardData.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
