//
//  ContentView.swift
//  NetworkTry
//
//  Created by Paarth Parikh on 28/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var sync : String = "hey"
    @State var refresh : String = "hey refresh"
    var body: some View {
        VStack {
            Text("Heyy")
            Text(sync)
            Text(refresh)
            Button(action: {
                NetworkCall().sendDataToServer(IP_Add:"192.168.0.100",reqType: "sync") { result in
                    switch result {
                    case .success(let response):
                        print("Response: \(response)")
                        self.sync = response
                        // Handle success
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                        // Handle error
                    }
                }
            }){
                Text("SYNC");
            };
            Button(action: {
                NetworkCall().sendDataToServer(IP_Add:"192.168.0.100",reqType: "refresh") { result in
                    switch result {
                    case .success(let response):
                        print("Response: \(response)")
                        self.refresh = response
                        // Handle success
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                        // Handle error
                    }
                }
            }){
                Text("Refresh");
            };
            Button(action: {
                NetworkCall().sendDataToServer(IP_Add:"192.168.0.100",reqType: "Change_State",Switch_Number: "1") { result in
                    switch result {
                    case .success(let response):
                        print("Response: \(response)")
                        self.sync = response
                        // Handle success
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                        // Handle error
                    }
                }
            }){
                Text("Change State");
            };
        }
        }
    
}

#Preview {
    ContentView()
}
