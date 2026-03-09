//
//  ActionButton.swift
//  SIoP
//
//  Created by private on 27/01/2024.
//

import SwiftUI

struct ActionButton: View {

    @State var title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title.localizedUppercase)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
        }
        .frame(width: 300, height: 50)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerSize: .init(width: 8, height: 8)))
    }
}

#Preview {
    ActionButton(title: "Odczyt", action: {})
}
