//
//  ProfileListViewModel.swift
//  SIoP
//
//  Created by private on 24/02/2024.
//

import Foundation

class ProfileListViewModel: ObservableObject {
    
    @Published var state: State
    
    struct State {
        var profiles: [Profile]
        init() {
            self.profiles = Profile.loadFromJson()
        }
    }
    
    init(state: State) {
        self.state = state
    }
}
