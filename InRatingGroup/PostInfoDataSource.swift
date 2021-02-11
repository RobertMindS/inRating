//
//  PostInfoDataSource.swift
//  InRatingGroup
//
//  Created by Robert on 10.02.2021.
//

import Foundation

protocol PostInfoDataSourceProtocol {
    var postData: Post? { get }
    var likersData: Data? { get }
    var repostersData: Data? { get }
    var commentatorsData: Data? { get }
    var mentionsData: Data? { get }
    
    func loadData(complition: @escaping()->())
}


class PostInfoDataSource: PostInfoDataSourceProtocol {
    
    var postData: Post?
    var likersData: Data?
    var repostersData: Data?
    var commentatorsData: Data?
    var mentionsData: Data?
    
    let networkLayer = NetworkLayer()
    let dispatchGroup = DispatchGroup()
    
    func loadData(complition: @escaping() -> ()) {
        loadPostData()
        loadLikersData()
        loadRepostersData()
        loadCommentatorsData()
        loadMentionsData()

        dispatchGroup.notify(queue: .main) {
            complition()
        }
    }
    
    func loadPostData() {
        dispatchGroup.enter()
        networkLayer.startRequest(endpoint: .getPost, body: ["id" : 2720], response: Post.self) { [weak self] (post, error) in
            self?.postData = post
            self?.dispatchGroup.leave()
        }
    }
    
    func loadLikersData() {
        dispatchGroup.enter()
        networkLayer.startRequest(endpoint: .getLikers, body: ["id" : 2720], response: Data.self) { [weak self] (data, error) in
            self?.likersData = data
            self?.dispatchGroup.leave()
        }
    }
    
    func loadRepostersData() {
        dispatchGroup.enter()
        networkLayer.startRequest(endpoint: .getReposters, body: ["id" : 2720], response: Data.self) { [weak self] (data, error) in
            self?.repostersData = data
            self?.dispatchGroup.leave()
        }
    }
    
    func loadCommentatorsData() {
        dispatchGroup.enter()
        networkLayer.startRequest(endpoint: .getCommentators, body: ["id" : 2720], response: Data.self) { [weak self] (data, error) in
            self?.commentatorsData = data
            self?.dispatchGroup.leave()
        }
    }
    
    func loadMentionsData() {
        dispatchGroup.enter()
        networkLayer.startRequest(endpoint: .getMentions, body: ["id" : 2720], response: Data.self) { [weak self] (data, error) in
            self?.mentionsData = data
            self?.dispatchGroup.leave()
        }
    }
    
}
