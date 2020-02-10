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
    @Published var image: UIImage = UIImage()
    
    init(api: APIService = APIService(), url: URL) {
        self.api = api
        print("imagestore init")
        image(for: url)
    }
    
    func image(for url: URL) {
        _ = api.image(from: url)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { (error) in
                print(error)
            }, receiveValue: { data in
                guard let data = data,
                    let image = UIImage(data: data) else {
                        return
                }
                print("got image")
                self.image = image
            })
    }
}
