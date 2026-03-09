//
//  WriteProfileView.swift
//  IceNFCTool
//
//  Created by private on 04/11/2023.
//

import SwiftUI

struct WriteProfileView: View {
    @ObservedObject var model: WriteProfileModel
    

    var body: some View {
        List {
            ForEach(Array(model.fields.enumerated()), id: \.1) { index, field in
                ProfileFieldRow(label: field.title, value: $model.fields[index].value)
            }
            Section{
                WriteProfileButtonRow(onWrite: model.write)
            }
        }
        .onDisappear {
            model.saveToCache()
        }
        .listStyle(.plain)
        .navigationTitle(model.profile.name)
    }
    

}

//#Preview {
//    WriteProfileView(profile: .init(name: "Motocyklisata", fields: []))
//}
