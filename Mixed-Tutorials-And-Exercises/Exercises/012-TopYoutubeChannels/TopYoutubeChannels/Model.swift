//
//  Model.swift
//  TopYoutubeChannels
//
//  Created by Osman Emre Ömürlü on 25.02.2024.
//

import Foundation

struct UserResponse: Codable {
    let data: [PersonResponse]
}

struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
