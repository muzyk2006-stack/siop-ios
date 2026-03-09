//
//  ProfileFieldRow.swift
//  IceNFCTool
//
//  Created by private on 04/11/2023.
//

import SwiftUI

struct ProfileFieldRow: View {
    @State var label: String
    @Binding var value: String
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(label)
                .font(.caption)
            TextField("", text: $value)
                 .frame(height: 44)
                 .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                 .cornerRadius(5)
                 .overlay(
                     RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 1.0)
                        .fill(Color.textFieldBackgroundColor)
                 )
        })
    }
}

#Preview {
    ProfileFieldRow(label: "Imie:",value: .constant(""))
}
