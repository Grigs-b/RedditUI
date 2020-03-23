//
//  ContentView.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/10/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView : View {
    @EnvironmentObject var store: PostListStore
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.posts, id: \.title) { post in
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
        return ContentView().environmentObject(store)
    }
}
#endif
