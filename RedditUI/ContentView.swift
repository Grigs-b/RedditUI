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
    @EnvironmentObject var imageStore: ImageStore
    
    init(post: Post) {
        print("Made post cell view")
        self.post = post
    }
    
    var body: some View {
        HStack {
            Image(uiImage: imageStore.image)
                .resizable()
                .frame(width: 75, height: 75)
                .clipped()
            
            Text(post.title)
        }
    }
}

struct ContentView : View {
    @EnvironmentObject var store: PostListStore
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(store.posts, id: \.title) { post in
                    PostCellView(post: post).environmentObject(ImageStore(url: post.thumbnail))
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
        return ContentView().environmentObject(store)
    }
}
#endif
