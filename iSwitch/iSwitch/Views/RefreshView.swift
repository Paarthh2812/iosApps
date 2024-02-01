//
//  RefreshView.swift
//  iSwitch
//
//  Created by Paarth Parikh on 31/01/24.
//
import SwiftUI
import Network

struct RefreshView: View {
    @Binding var boards : [BoardData]
    @Binding var ispresentingrefresh : Bool
    @State var new_boards : [BoardData] = []
    @State var scan_ip : Float = 0
    @State var value_prog : Float = 0
    var body: some View {
        VStack{
            Text("Searching for Devices").font(.title)
            ProgressView(value: scan_ip/256).padding()
            HStack(){
                Text("Scanning")
                Spacer()
                Text("\(Int(scan_ip/2.55))/100")
            }.onAppear(perform: {
                scanDevices()
            })
            .onDisappear(perform: {appendNewBoards()}
            )
            Button(action: {ispresentingrefresh = false}) {
                Text("Close")
            }
        }.padding()
    }
    
    private func appendNewBoards() {
            for newBoard in new_boards {
                if !boards.contains(where: { $0.IP_Add == newBoard.IP_Add }) {
                    boards.append(newBoard)
                }
            }
        }
    
    private func scanDevices() {
        Task {
            do {
                guard let ipAddress = NetworkManager().getIP() else {
                    print("Failed to retrieve IP address.")
                    return
                }

                // Extract the subnet by removing the last octet
                guard let lastDotIndex = ipAddress.lastIndex(of: ".") else {
                    print("Invalid IP address format.")
                    return
                }
                let subnet = ipAddress[ipAddress.startIndex..<lastDotIndex]
                for value in 0..<256 {
                    let tryIP = "\(subnet).\(value)"
                    await scanDevice(ip: tryIP)
                }
            }
        }
    }
    

    private func scanDevice(ip: String) async {
        do {
            NetworkManager().sendDataToServer(IP_Add: ip, reqType: "refresh") { result in
                scan_ip += 1
                if(scan_ip == 256){
                    ispresentingrefresh = false
                }
                switch result {
                case .success(let response):
                    print("Response from \(ip): \(response)")
                    let splitArray = response.components(separatedBy: ":")
                    if(splitArray[0] == ip){
                        print(ip)
                        new_boards.append(BoardData(identification: splitArray[1], no_of_switch: splitArray[2], IP_Add: splitArray[0]))
                    }
                case .failure(let error):
                    print("Error for \(ip): \(error.localizedDescription)")
                }
            }
        }
    }
}


struct RefreshView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RefreshView(boards: .constant(BoardData.sampleData),ispresentingrefresh: .constant(true))
        }
    }
}
