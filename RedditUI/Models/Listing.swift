//
//  Listing.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct Listing<T: ModelType>: ModelType {
//    var id: UUID = UUID()
    var dist: Int
    var children: [Container<T>]
    var after: String?
    var before: String?
}
