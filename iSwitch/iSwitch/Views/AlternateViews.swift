////
////  AlternateViews.swift
////  iSwitch
////
////  Created by Paarth Parikh on 01/02/24.
////
////
////  ContentView.swift
////  iSwitch
////
////  Created by Paarth Parikh on 31/01/24.
////
//
//import SwiftUI
//
//struct AlternateViews: View {
//    @Binding var boards : [BoardData]
//    @Environment(\.scenePhase) private var scenePhase
//    @State private var ispresentingrefresh = false
//    @State private var isPresentingadd = false
//    @State private var textSwitch = false
//    @State private var reply_add : String = ""
//    let saveAction: ()->Void
//    var body: some View {
//        NavigationStack{
//            List($boards){ $board in
//                NavigationLink(destination:BoardView(board: $board)){
//                    CardView(board: board)
//                }
//                .listRowBackground(Color.gray)
//            }
//            .navigationTitle("iSwitch")
//            .toolbar{
//                ToolbarItem(placement: .navigationBarLeading) {
//                Button(action: {
//                }) {
//                    Image(systemName: "arrow.clockwise")
//                }.padding()
//                }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: {
//                }) {
//                    Image(systemName: "plus")
//                }.padding()
//            }}
//            .onChange(of: scenePhase) { phase in
//                if phase == .inactive { saveAction() }
//            }
//            .sheet(isPresented: $isPresentingadd) {
//                NewBoardView(ispresentingrefresh: $ispresentingrefresh,ispresentingadd: $isPresentingadd,reply_add : $reply_add,textSwitch:$textSwitch)
//            }
//            .overlay(content:{
//                if (textSwitch) {
//                    ZStack {
//                        Color.black.opacity(0.7)
//                            .edgesIgnoringSafeArea(.all)
//                        Text(reply_add)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.gray)
//                            .cornerRadius(10)
//                    }
//                    .transition(.opacity)
//                }})
//        }
//        if(ispresentingrefresh == true){
//            RefreshView(boards:$boards,ispresentingrefresh: $ispresentingrefresh)
//                .background(Color.black.opacity(0.3))
//                                    .edgesIgnoringSafeArea(.all)
//        }
//        
//    }
//}
//
//#Preview {
//    AlternateViews(boards:.constant(BoardData.sampleData),saveAction: {})
//}
