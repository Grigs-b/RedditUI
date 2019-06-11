//
//  Post.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct Post: ModelType {
    var id: String
    var title: String
    var thumbnail: URL
    var url: URL
    var subreddit: String
    var selftext: String
    var ups: Int
    var author: String
}
