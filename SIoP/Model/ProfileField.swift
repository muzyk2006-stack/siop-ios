//
//  ProfileField.swift
//  SIoP
//
//  Created by private on 04/11/2023.
//

import Foundation

struct ProfileField: Codable, Identifiable, Hashable {
    let id = UUID()
    let title: String
    /// you can overwrite field name on NFC tag with this property.
    let outputTitle: String?
    var value: String
}
