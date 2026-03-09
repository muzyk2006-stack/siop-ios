//
//  TagReader.swift
//  SIoP
//
//  Created by private on 03/02/2024.
//

import Foundation
import CoreNFC

class TagReader: NSObject, NFCNDEFReaderSessionDelegate, ObservableObject {
    
    @Published var outputMessage: String?
    @Published var readError: Error?
    
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        DispatchQueue.main.async {
            session.invalidate()
            let record = messages.first!.records.first!
            let (text,_) = record.wellKnownTypeTextPayload()
            self.outputMessage = text
        }
    }
    

    lazy var readerSession: NFCNDEFReaderSession = {
       let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        session.alertMessage = "Zbliż telefonu do tagu NFC z systemu SIoP."
        return session
    }()
    

//    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {
//
//        // You connect to the desired tag.
//        let tag = tags.first!
//        session.connect(to: tag) { (error: Error?) in
//            guard error == nil else {
//                session.restartPolling()
//                return
//            }
//            tag.readNDEF { [weak self] message, error in
//                guard error == nil else {
//                    self?.readError = error
//                    return
//                }
//                guard let data = message?.records.first?.payload else {
//                    return
//                }
//                
//                let message = String(data: data, encoding: .utf8)
//                debugPrint(message)
//                self?.outputMessage = message
//            }
//        }
//    }
    
    func read() {
        readerSession.begin()
    }
}
