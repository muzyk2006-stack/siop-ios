//
//  Profile.swift
//  IceNFCTool
//
//  Created by private on 04/11/2023.
//

import Foundation
import UIKit

struct Profile: Codable, Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let fields: [ProfileField]
    var icon: UIImage {
        return UIImage(named: iconName) ?? UIImage(named: "child")!
    }
}

extension Profile {
    static func loadFromJson() -> [Profile] {
        guard let url = Bundle.main.url(forResource: "profiles", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        do {
            return try JSONDecoder().decode([Profile].self, from: data)
        } catch {
            debugPrint(error.localizedDescription)
            return []
        }
    }
}
