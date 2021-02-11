//
//  Post.swift
//  InRatingGroup
//
//  Created by Robert on 09.02.2021.
//

import Foundation

class Post: Codable {
    let id: Int
    let slug: String
//    let author: Author
    let commentsCount: Int
    let likesCount: Int
    let bookmarksCount: Int
    let repostsCount: Int
    let viewsCount: Int
//    let attachments: Attachments
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
//        case author = "author"
        case commentsCount = "comments_count"
        case likesCount = "likes_count"
        case bookmarksCount = "bookmarks_count"
        case repostsCount = "reposts_count"
        case viewsCount = "views_count"
//        case attachments = "attachments"
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(slug, forKey: .slug)
//        try container.encode(author, forKey: .author)
        try container.encode(commentsCount, forKey: .commentsCount)
        try container.encode(likesCount, forKey: .likesCount)
        try container.encode(bookmarksCount, forKey: .bookmarksCount)
        try container.encode(repostsCount, forKey: .repostsCount)
        try container.encode(viewsCount, forKey: .viewsCount)
//        try container.encode(attachments, forKey: .attachments)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        slug = try container.decode(String.self, forKey: .slug)
//        author = try container.decode(Author.self, forKey: .author)
        commentsCount = try container.decode(Int.self, forKey: .commentsCount)
        likesCount = try container.decode(Int.self, forKey: .likesCount)
        bookmarksCount = try container.decode(Int.self, forKey: .bookmarksCount)
        repostsCount = try container.decode(Int.self, forKey: .repostsCount)
        viewsCount = try container.decode(Int.self, forKey: .viewsCount)
//        attachments = try container.decode(Attachments.self, forKey: .attachments)
    }

}

//class Author: Codable {
//    let nickname: String
//    let avatarImage: AvatarImage
//
//    enum CodingKeys: String, CodingKey {
//        case nickname = "nickname"
//        case avatarImage = "avatar_image"
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(nickname, forKey: .nickname)
//        try container.encode(avatarImage, forKey: .avatarImage)
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        nickname = try container.decode(String.self, forKey: .nickname)
//        avatarImage = try container.decode(AvatarImage.self, forKey: .avatarImage)
//    }
//}

//class AvatarImage: Codable {
//    let urlOrigin: String
//
//    enum CodingKeys: String, CodingKey {
//        case urlOrigin = "url_origin"
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(urlOrigin, forKey: .urlOrigin)
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        urlOrigin = try container.decode(String.self, forKey: .urlOrigin)
//    }
//}


//class Attachments: Codable {
//    let images: [Images]
//}
//
//class Images: Codable {
//    let mentionedUsersCount: Int
//
//    enum CodingKeys: String, CodingKey {
//        case mentionedUsersCount = "mentioned_users_count"
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(mentionedUsersCount, forKey: .mentionedUsersCount)
//    }
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        mentionedUsersCount = try container.decode(Int.self, forKey: .mentionedUsersCount)
//    }
//}
