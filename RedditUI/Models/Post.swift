//
//  Post.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct Post: ModelType {
    var name: String
    var title: String
    var thumbnail: URL
    var url: URL
    var subreddit: String
    var selftext: String
    var ups: Int
    var author: String
    var numComments: Int
    
    public enum CodingKeys: String, CodingKey {
        case name
        case title
        case thumbnail
        case url
        case subreddit
        case selftext
        case ups
        case author
        case numComments = "num_comments"
    }
}

struct Preview: ModelType {
    var images: [ImageContainer]
    var enabled: Bool
}

struct ImageContainer: ModelType {
    var source: RedditImage
    var resolutions: [RedditImage]
}

struct RedditImage: ModelType {
    var url: URL
    var width: Double
    var height: Double
}
