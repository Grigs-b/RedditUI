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

final class PostListStore: ObservableObject {
    @Published var posts: [Post] = []
    let api: APIService
    
    init(api: APIService = APIService()) {
        self.api = api
    }
    
    func search(text: String) {
        let query = SubredditQuery(text)
        _ = api.subreddit(query)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (error) in
                // something?
                print(error)
        }, receiveValue: { (posts) in
            self.posts = posts
        })
    }
    
    var query: AnyCancellable?
    
    func load() {
        let query = api.subreddit(SubredditQuery())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (result) in
                // something?
                switch result {
                case .finished:
                    print("successful fetch")
                case .failure(let error):
                    print("Error fetching subreddits: \(error)")
                }
            }, receiveValue: { (posts) in
                self.posts = posts
            })
        self.query = query
    }
}
