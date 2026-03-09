//
//  ReadSectionView.swift
//  SIoP
//
//  Created by private on 03/02/2024.
//

import SwiftUI

struct ReadSectionView: View {
    let onRead: () -> Void
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.clear)
            ActionButton(title: "Odczyt", action: onRead)
        }
        .frame(height: 75)
    }
}

#Preview {
    ReadSectionView(onRead: {})
}
