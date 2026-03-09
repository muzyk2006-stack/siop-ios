//
//  ProfileTagWriter.swift
//  IceNFCTool
//
//  Created by private on 04/11/2023.
//

import Foundation
import CoreNFC

class ProfileTagWriter: NSObject, NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        
    }
        
    var readerSession: NFCNDEFReaderSession?
    
    let fields: [ProfileField]
    
    init(fields: [ProfileField]) {
        self.fields = fields
        super.init()
        readerSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
    }
    
    func write() {
        readerSession?.alertMessage = "Przytrzymaj Urządzenie blisko Tagu do którego chcesz zapisać"
        readerSession?.begin()
    }
    
    func readerSessionDidBecomeActive(_ session: NFCNDEFReaderSession) {
        
    }
    
    var tagMessage: NFCNDEFMessage {
        let text = fields.map { "\($0.outputTitle ?? $0.title)\n\($0.value)"}.joined(separator: "\n")
        return NFCNDEFMessage(records: [NFCNDEFPayload.wellKnownTypeTextPayload(string: text, locale: .current)!])
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetect tags: [NFCNDEFTag]) {

        // You connect to the desired tag.
        let tag = tags.first!
        session.connect(to: tag) { (error: Error?) in
            if error != nil {
                session.restartPolling()
                return
            }
            
            // You then query the NDEF status of tag.
            tag.queryNDEFStatus() { (status: NFCNDEFStatus, capacity: Int, error: Error?) in
                if error != nil {
                    session.invalidate(errorMessage: "Fail to determine NDEF status.  Please try again.")
                    return
                }
                
                let message = self.tagMessage
                
                if status == .readOnly {
                    session.invalidate(errorMessage: "Tag is not writable.")
                } else if status == .readWrite {
                    if message.length > capacity {
                        session.invalidate(errorMessage: "Tag capacity is too small.  Minimum size requirement is \(message.length) bytes.")
                        return
                    }
                    
                    // When a tag is read-writable and has sufficient capacity,
                    // write an NDEF message to it.
                    tag.writeNDEF(message) { (error: Error?) in
                        if error != nil {
                            debugPrint(error?.localizedDescription)
                            session.invalidate(errorMessage: "Update tag failed. Please try again. \(error?.localizedDescription)")
                        } else {
                            session.alertMessage = "Update success!"
                            session.invalidate()
                        }
                    }
                } else {
                    session.invalidate(errorMessage: "Tag is not NDEF formatted.")
                }
            }
        }
    }
}
