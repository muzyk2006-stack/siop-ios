//
//  HomeView.swift
//  SIoP
//
//  Created by private on 24/02/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderHomeView()
                Spacer()
                ActionButton(title: "Odczyt", action: {
                    viewModel.startNFCReading()
                })
                ActionButton(title: "Profile", action: {
                    viewModel.showProfiles()
                })
                ActionButton(title: "Pomoc", action: {
                    viewModel.showHelp()
                })
                ActionButton(title: "O aplikacji", action: {
                    
                })
                NavigationLink(
                    destination: ProfileListView(viewModel: .init(state: .init())),
                    isActive: $viewModel.state.showProfiles,
                    label: {
                        EmptyView()
                    })
            }
        }.sheet(isPresented: $viewModel.state.showHelp, content: {
            HelpView()
        })
        .sheet(isPresented: $viewModel.state.showNFCMessage, content: {
            ReadMessageView(message: viewModel.state.nfcMessage ?? "")
        })

    }
}

//#Preview {
//    HomeView()
//}
