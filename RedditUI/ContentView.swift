//
//  ContentView.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import SwiftUI
import Combine


struct PostCellView: View {
    var post: Post
    var imageStore: ImageStore
//    @EnvironmentObject var api: APIService
    
    init(post: Post) {
        self.post = post
        // todo: @EnvironmentObject api service?
        imageStore = ImageStore(api: APIService(), url: post.thumbnail)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: imageStore.image)
                .resizable()
                .frame(width: 200, height: 200)
                .clipped()
                
            Text(post.title)
        }
    }
}

struct ContentView : View {
    @State var store: PostListStore = PostListStore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.posts.identified(by: \.title)) { post in
                    PostCellView(post: post)
                }
            }.navigationBarTitle(Text("Reddit"))
        }
        .onAppear(perform: {
            self.store.load()
        })
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        
        let store = PostListStore()
        return ContentView(store: store)
    }
}
#endif
