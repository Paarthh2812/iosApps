//
//  BoardView.swift
//  iSwitch
//
//  Created by Paarth Parikh on 31/01/24.
//

import SwiftUI


struct BoardView: View {
    @Binding var board: BoardData
    @State private var editingboard = BoardData.emptyBoard
    @State private var isPresentingEditView = false
    @State private var state_switch: [Bool]
    
    init(board: Binding<BoardData>) {
        _board = board
        _state_switch = State(initialValue: board.wrappedValue.switch_state)
    }
    var body: some View {
        Form{
            Section(header: Text("Switches")) {
                ForEach(0..<board.no_of_switch,id:\.self){switch_n in
                    Button(action: {
                        SwitchingTask(Switch: switch_n)
                    }){
                        HStack{
                            Text(board.switch_names[switch_n].name).foregroundStyle(board.theme.accentColor).fontDesign(.rounded)
                            Spacer()
                            Toggle("", isOn: $state_switch[switch_n]).disabled(true)
                            Spacer()
                        }.padding()
                    }.listRowBackground(board.theme.mainColor);
                }
                .onAppear(perform: {
                    SyncTask()
                })
            }
        }
        .navigationTitle(board.identification)
        .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    editingboard = board
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    RenameBoardView(board: $editingboard)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    board = editingboard
                                }
                            }
                        }
                }
            }
    }
    
    private func SyncTask(){
        NetworkManager().sendDataToServer(IP_Add:board.IP_Add,reqType: "sync") { result in
            switch result {
            case .success(let response):
//                print("Response: \(response)")
                let boolList = response.map { char in
                    return char == "1"
                }
                state_switch = boolList
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
    private func SwitchingTask(Switch:Int){
        NetworkManager().sendDataToServer(IP_Add:board.IP_Add,reqType: "Change_State",Switch_Number:String(Switch)) { result in
            switch result {
            case .success(let response):
//                print("Response: \(response)")
                let boolList = response.map { char in
                    return char == "1"
                }
                state_switch = boolList
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}


struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BoardView(board: .constant(BoardData.sampleData[0]))
        }
    }
}
