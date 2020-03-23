//
//  APIService.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import Foundation
import UIKit
import Combine

class APIService: ObservableObject {
    var host: String = "api.reddit.com"
    var network: NetworkAdapter
    
    init(_ adapter: NetworkAdapter = NetworkAdapter()) {
        self.network = adapter
    }
    
    func subreddit(_ query: SubredditQuery) -> AnyPublisher<[Post], Error> {
        var components = URLComponents()
        components.host = host
        components.scheme = "https"
        components.path = query.path
        components.queryItems = query.queryItems
        guard let url = components.url else {
            return Fail(error: NetworkError.invalidURL as Error).eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        let future = network.request(request).map({ (result: Container<Listing<Post>>) -> [Post] in
            return result.data.children.map({ $0.data })
        })

        return future
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func image(from url: URL) -> AnyPublisher<Data?, URLSession.DataTaskPublisher.Failure> {
        return network.session.dataTaskPublisher(for: url)
            .map { (data, response) -> Data in
            return data
        }.eraseToAnyPublisher()
    }
}
