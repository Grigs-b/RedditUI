//
//  SubredditQuery.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import Foundation

protocol URLQueryItemQueryable {
    var queryItems: [URLQueryItem] { get }
}

struct SubredditQuery: URLQueryItemQueryable {
    var name: String
    var count: Int
    
    static let countKey: String = "count"
    
    enum Pagination {
        case before(String)
        case after(String)
        
        var name: String {
            switch self {
            case .before: return "before"
            case .after: return "after"
            }
        }
        var link: String {
            switch self {
            case .after(let link), .before(let link): return link
            }
        }
    }
    var page: Pagination?
    
    init() {
        name = "all"
        count = 0
    }
    
    init(_ subreddit: String, count: Int = 0) {
        name = subreddit
        self.count = count
    }
    
    init(_ subreddit: String, before link: String, count: Int = 0) {
        name = subreddit
        page = Pagination.before(link)
        self.count = count
    }
    
    init(_ subreddit: String, after link: String, count: Int = 0) {
        name = subreddit
        page = Pagination.after(link)
        self.count = count
    }

    // MARK: - URLQueryItemQueryable
    var queryItems: [URLQueryItem] {
        
        let countItem = URLQueryItem(name: SubredditQuery.countKey, value: "\(count)")
        if let page = page {
            let pageItem = URLQueryItem(name: page.name, value: page.link)
            return [pageItem, countItem]
        }
        
        return [countItem]
    }
    
    var path: String {
        // added sanitization for if we add user ability to type in subreddit to visit, that way if they type it with/without the r/ prefix we can still search
        let sanitized = name.replacingOccurrences(of: "/r/", with: "").replacingOccurrences(of: "r/", with: "")
        return "/r/\(sanitized)/"
    }
}
