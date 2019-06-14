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

final class ImageStore: BindableObject {
    let didChange = PassthroughSubject<UIImage, Never>()
    let api: APIService
    var image: UIImage = UIImage() {
        didSet {
            didChange.send(image)
        }
    }
    
    init(api: APIService = APIService(), url: URL) {
        self.api = api
        image(for: url)
    }
    
    func image(for url: URL) {
        _ = api.image(from: url).sink(receiveValue: { data in
            guard let image = UIImage(data: data) else { return }
            self.image = image
        })
    }
}
