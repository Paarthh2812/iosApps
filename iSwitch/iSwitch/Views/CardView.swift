//
//  CardView.swift
//  iSwitch
//
//  Created by Paarth Parikh on 27/01/24.
//

import SwiftUI


struct CardView: View {
    let board: BoardData
    var body: some View {
        VStack(alignment: .leading) {
            Text(board.identification)
                .font(.headline)
                .fontDesign(.rounded)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(board.no_of_switch)", systemImage: "switch.2")
                    .accessibilityLabel("\(board.no_of_switch) attendees")
                Spacer()
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(board.theme.accentColor)
    }
}


struct CardView_Previews: PreviewProvider {
    static var board = BoardData.sampleData[0]
    static var previews: some View {
        CardView(board: board)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
