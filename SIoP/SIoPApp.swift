//
//  SIoPApp.swift
//  SIoP
//
//  Created by private on 04/11/2023.
//

import SwiftUI

@main
struct SIoPApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: .init())
        }
    }
}
