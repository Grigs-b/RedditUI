//
//  PostListStore.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/11/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class PostListStore: BindableObject  {
    let didChange = PassthroughSubject<PostListStore, Never>()
    let api: APIService
    
    init(api: APIService = APIService()) {
        self.api = api
    }
    
    var posts: [Post] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    func search(text: String) {
        let query = SubredditQuery(text)
        api.subreddit(query).sink(receiveValue: { posts in
            // shouldn't have to dispatch here but apis dont appear to be available yet 6/13
            DispatchQueue.main.async {
                self.posts = posts
            }
        })
        
    }
    
    func load() {
        api.subreddit(SubredditQuery()).sink { (posts) in
            // shouldn't have to dispatch here but apis dont appear to be available yet 6/13
            DispatchQueue.main.async {
                print("Settings posts count: \(posts.count)")
                self.posts = posts
            }
        }
    }
}
