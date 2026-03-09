//
//  ProfileRow.swift
//  IceNFCTool
//
//  Created by private on 04/11/2023.
//

import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct ProfileRow: View {
    @State var profile: Profile
    var body: some View {
        NavigationLink {
            NavigationLazyView(WriteProfileView(model: .init(profile: profile)))
        } label: {
            HStack(alignment: .center, spacing: 16) {
                Image(uiImage: profile.icon.withRenderingMode(.alwaysTemplate))
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.accent)
                    .padding()
                Text(profile.name).font(.title)
            }//.listRowSeparator(.hidden)
        }
    }
}

//#Preview {
//    ProfileRow(profile: .oldPerson)
//}
