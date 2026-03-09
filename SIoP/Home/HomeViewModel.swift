//
//  HomeViewModel.swift
//  SIoP
//
//  Created by private on 24/02/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var tagReader: TagReader?
    @Published var state: State = State()
    private var cancelStore: Set<AnyCancellable> = []
    struct State {
        var showHelp = false
        var showNFCMessage = false
        var showProfiles = false
        var nfcMessage: String?
    }
    
    func showHelp() {
        state.showHelp = true
    }
    
    func showProfiles() {
        state.showProfiles = true
    }
    
    func didReadMessage(message: String?) {
        if let val = message {
            state.nfcMessage = val
            state.showNFCMessage = true
        }
    }
    
    func startNFCReading() {
        tagReader = TagReader()
        tagReader?.$outputMessage
            .sink(receiveValue: { [weak self] val in
                self?.didReadMessage(message: val)
        }).store(in: &cancelStore)
        
        tagReader?.read()
        
    }
}
