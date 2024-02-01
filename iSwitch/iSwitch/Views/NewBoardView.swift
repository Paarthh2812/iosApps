//
//  NewBoardView.swift
//  iSwitch
//
//  Created by Paarth Parikh on 31/01/24.
//

import SwiftUI


struct NewBoardView: View {
    @Binding var ispresentingrefresh : Bool
    @Binding var ispresentingadd : Bool
    @Binding var reply_add : String
    @Binding var textSwitch : Bool
    @State private var petname : String = ""
    @State private var SSID : String = ""
    @State private var pass : String = ""
    var body: some View {
        NavigationStack{
            Form {
                Section(header: Text("Connect to Local WiFi"))
                {
                    HStack{
                        Text("WiFi")
                        Spacer()
                        Text("Smart Switch/Board")
                    }
                    HStack{
                        Text("Password")
                        Spacer()
                        Text("123456789")
                    }
                }
                Section(header: Text("New Device Pairing Details")) {
                    HStack{
                        Text("Identification")
                        Spacer()
                        TextField("Title", text: $petname)
                    }
                    HStack{
                        Text("WiFi")
                        Spacer()
                        TextField("WiFi_SSID", text: $SSID)
                    }
                    HStack{
                        Text("Password")
                        Spacer()
                        TextField("WiFi_Password", text: $pass)
                    }
                }.multilineTextAlignment(.trailing)
            }.toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        ispresentingadd = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {ispresentingadd = false
                        PairingTask()
                        textSwitch = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                textSwitch = false
                                ispresentingrefresh = true
                            }
                        }
                    }
                           , label: {
                        Text("Add")
                        
                    })
                }
        }
        }
    }
    private func PairingTask(){
        NetworkManager().sendDataToServer(IP_Add: "192.168.1.1", reqType: "Pairing_Data", Identification: petname, Wifi_SSID: SSID , Wifi_Password: pass ){ result in
            switch result {
            case .success(let response):
                if(response == "Data Saved Succesfully"){
                    reply_add = "Data Saved Succesfully"}
                else{
                    reply_add = "Error Communicating"
                }
//                print("Response: \(response)")
            case .failure(_):
                reply_add = "Error Communicating"
//                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
}


struct NewBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewBoardView(ispresentingrefresh: .constant(false),ispresentingadd: .constant(true),reply_add: .constant("hey"),textSwitch: .constant(false))
        }
    }
}
