//
//  ReadMessageView.swift
//  SIoP
//
//  Created by private on 03/02/2024.
//

import SwiftUI

struct ReadMessageView: View {
    @State var message: String
    
    var body: some View {
        Text(message)
    }
}

#Preview {
    ReadMessageView(message: "w razie wypadku")
}
