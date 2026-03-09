//
//  WriteProfileModel.swift
//  SIoP
//
//  Created by private on 04/11/2023.
//

import Foundation
import Combine

class WriteProfileModel: ObservableObject {
    let profile: Profile
    var fields: [ProfileField]
    
    var profileTagWriter: ProfileTagWriter?
    
    init(profile: Profile) {
        self.profile = profile
        fields = profile.fields
        #if ITAKA
        loadFromCache()
        #endif
    }
    
    func write() {
        profileTagWriter = ProfileTagWriter(fields: fields)
        profileTagWriter?.write()
    }
    
    func saveToCache() {
        let values = fields.map { $0.value }
        UserDefaults.standard.setValue(values, forKey: "PROFILE_CACHE")
    }
    
    func loadFromCache() {
        guard let values = UserDefaults.standard.array(forKey: "PROFILE_CACHE") as? [String] else {
            return
        }
        for (i,v) in values.enumerated() {
            fields[i].value = v
        }
    }
}
