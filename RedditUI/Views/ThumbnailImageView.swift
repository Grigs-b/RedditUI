//
//  ThumbnailImageView.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 2/10/20.
//  Copyright © 2020 Ryan Grigsby. All rights reserved.
//

import SwiftUI

struct ThumbnailImageView: View {
    @ObservedObject var imageStore: ImageStore
    
    init(url: URL) {
        imageStore = ImageStore(url: url)
    }

    var body: some View {
        HStack {
            Image(uiImage: imageStore.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
                
        }.onAppear(perform: {
            self.imageStore.fetch()
        })
    }
}

#if DEBUG
struct ThumbnailImageView_Previews : PreviewProvider {
    static var previews: some View {
        
        return ThumbnailImageView(url: URL(string: "https://external-preview.redd.it/bYRDz2v4kFaJlLgUUyEAHR46AbH9tSO0aYDQPjZgfzQ.jpg")!)
    }
}
#endif
