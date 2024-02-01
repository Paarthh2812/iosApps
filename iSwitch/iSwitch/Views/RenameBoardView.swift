//
//  RenameBoardView.swift
//  iSwitch
//
//  Created by Paarth Parikh on 01/02/24.
//

import SwiftUI


struct RenameBoardView: View {
    @Binding var board : BoardData
    var body: some View {
        Form {
            Section(header: Text("Board Name")) {
                TextField("Title", text: $board.identification)
                ThemePicker(selection: $board.theme)
            }
            Section(header: Text("Switch Names")) {
                ForEach($board.switch_names) { switche in
                    TextField("Switch Name", text: switche.name )
                }
                .onDelete { indices in
                    board.switch_names.remove(atOffsets: indices)
                }
            }
        }
    }
}


struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        RenameBoardView(board: .constant(BoardData.sampleData[0]))
    }
}
