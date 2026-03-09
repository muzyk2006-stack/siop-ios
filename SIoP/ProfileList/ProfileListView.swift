//
//  ProfileListView.swift
//  IceNFCTool
//
//  Created by private on 04/11/2023.
//

import SwiftUI

struct ProfileListView: View {
    @ObservedObject var viewModel: ProfileListViewModel
    @State var showHelp = false
    
    var body: some View {
            VStack {
                List {
                    Section(content: {
                        Text("Wybierz profil")
                            .font(.headline)
                    })
                    .listRowSeparator(.hidden)
                    .padding(.vertical)
                    ForEach(viewModel.state.profiles) { profile in
                        ProfileRow(profile: profile).listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    ProfileListView(viewModel: .init(state: .init()))
}
