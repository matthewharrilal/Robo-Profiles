//
//  DecodingFile.swift
//  AppBundleReader
//
//  Created by Matthew Harrilal on 10/27/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import Foundation
import UIKit

struct DecodingRobots {
    var name: String?
    var personality: String?
    var image: String?
    var phrase: String?
    init(name: String?, personality: String?, image: String?, phrase: String?) {
        self.name = name
        self.personality = personality
        self.image = image
        self.phrase = phrase
    }
}



extension DecodingRobots: Decodable {
    enum Keys: String, CodingKey {
        case name
        case personality
        case image
        case phrase
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let name = try container.decodeIfPresent(String.self, forKey: .name)
        let personality = try container.decodeIfPresent(String.self, forKey: .personality)
        let image = try container.decodeIfPresent(String.self, forKey: .image)
        let phrase = try container.decodeIfPresent(String.self, forKey: .phrase)
        self.init(name: name, personality: personality, image: image, phrase: phrase)
    }
}



