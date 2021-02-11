//
//  Users.swift
//  InRatingGroup
//
//  Created by Robert on 10.02.2021.
//

import Foundation

class Data: Codable {
    let data: [Users]
}

class Users: Codable {
    let nickname: String?
    let avatarImage: AvatarImage
    
    enum CodingKeys: String, CodingKey {
        case nickname = "nickname"
        case avatarImage = "avatar_image"
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(nickname, forKey: .nickname)
        try container.encode(avatarImage, forKey: .avatarImage)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nickname = try container.decode(String.self, forKey: .nickname)
        avatarImage = try container.decode(AvatarImage.self, forKey: .avatarImage)
    }
}

class AvatarImage: Codable {
    let urlOrigin: String?
    
    enum CodingKeys: String, CodingKey {
        case urlOrigin = "url_origin"
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(urlOrigin, forKey: .urlOrigin)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        urlOrigin = try container.decode(String.self, forKey: .urlOrigin)
    }
}

