//
//  PostCellView.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 2/11/20.
//  Copyright © 2020 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct PostCellView: View {
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var body: some View {
        VStack {
            HStack {
                ThumbnailImageView(url: post.thumbnail)
                Text(post.title)
                Spacer()
            }.onTapGesture {
                self.didTapPost()
            }
            HStack {
                PostCommentSubView(comments: post.numComments).onTapGesture {
                    self.didTapComments()
                }
                Spacer()
            }
        }
    }
    
    func didTapComments() {
        print("comments tapped")
    }
    
    func didTapPost() {
        print("post tapped")
    }
}
