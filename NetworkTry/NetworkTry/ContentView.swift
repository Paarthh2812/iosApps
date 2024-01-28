//
//  ContentView.swift
//  NetworkTry
//
//  Created by Paarth Parikh on 28/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var posts = [Posts]()
    var body: some View {
        VStack {
            Text("Heyy")
        }
        .onAppear(){
            NetworkCall().senddataDataToServer()
            }
        }
    
}

#Preview {
    ContentView()
}
