//
//  Container.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import SwiftUI

protocol ModelType: Codable, Hashable {
    
}

struct Container<T: ModelType>: ModelType   {
    enum Kind: String, Codable {
        case more = "more"
        case listing = "Listing"
        case comment = "t1"
        case account = "t2"
        case link = "t3"
        case message = "t4"
        case subreddit = "t5"
        case award = "t6"
        case promoCampaign = "t8"
    }
    
//    var id: UUID = UUID()
    var kind: Kind
    var data: T
}
