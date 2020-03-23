//
//  PostCommentSubView.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 2/12/20.
//  Copyright © 2020 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct PostCommentSubView: View {
    var numComments: Int
    
    init(comments: Int) {
        self.numComments = comments
    }
    
    var body: some View {
        HStack {
            Image(systemName: "text.bubble.fill")
            Text("\(self.numComments)")
        }
    }
}

struct PostCommentSubView_Previews: PreviewProvider {
    static var previews: some View {
        PostCommentSubView(comments: 6)
    }
}
