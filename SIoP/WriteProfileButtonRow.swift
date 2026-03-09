//
//  WriteProfileButtonRow.swift
//  IceNFCTool
//
//  Created by private on 04/11/2023.
//

import SwiftUI

struct WriteProfileButtonRow: View {
    var onWrite: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            ActionButton(title: "Zapisz", action: onWrite)
            Spacer()
        }
//        .background(Color.gray)
    }
}

#Preview {
    List {
        WriteProfileButtonRow(onWrite: {})
    }.listStyle(.plain)
}
