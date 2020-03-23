//
//  ImageStore.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/13/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

final class ImageStore: ObservableObject {
    
    let api: APIService
    let url: URL
    @Published var image: UIImage = UIImage()
    var request: AnyCancellable?
    
    init(api: APIService = APIService(), url: URL) {
        self.api = api
        self.url = url
    }
    
    func fetch() {
        let request = api.image(from: url)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (error) in
                print(error)
            }, receiveValue: { data in
                guard let data = data,
                    let image = UIImage(data: data) else {
                        return
                }
                self.image = image
            })
        self.request = request
    }
}
