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
    let commentsCount: Int
    let likesCount: Int
    let bookmarksCount: Int
    let repostsCount: Int
    let viewsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case slug = "slug"
        case commentsCount = "comments_count"
        case likesCount = "likes_count"
        case bookmarksCount = "bookmarks_count"
        case repostsCount = "reposts_count"
        case viewsCount = "views_count"
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(slug, forKey: .slug)
        try container.encode(commentsCount, forKey: .commentsCount)
        try container.encode(likesCount, forKey: .likesCount)
        try container.encode(bookmarksCount, forKey: .bookmarksCount)
        try container.encode(repostsCount, forKey: .repostsCount)
        try container.encode(viewsCount, forKey: .viewsCount)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        slug = try container.decode(String.self, forKey: .slug)
        commentsCount = try container.decode(Int.self, forKey: .commentsCount)
        likesCount = try container.decode(Int.self, forKey: .likesCount)
        bookmarksCount = try container.decode(Int.self, forKey: .bookmarksCount)
        repostsCount = try container.decode(Int.self, forKey: .repostsCount)
        viewsCount = try container.decode(Int.self, forKey: .viewsCount)
    }

}
