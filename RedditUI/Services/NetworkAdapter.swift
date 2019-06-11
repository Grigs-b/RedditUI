//
//  NetworkAdapter.swift
//  RedditUI
//
//  Created by Ryan Grigsby on 6/11/19.
//  Copyright © 2019 Ryan Grigsby. All rights reserved.
//

import Foundation
import Combine

enum NetworkError: Error {
    case noData
    case invalidURL
}

class NetworkAdapter: NSObject, URLSessionDelegate {
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    func request<T: Decodable>(_ request: URLRequest) -> Publishers.Future<T, Error> {
        /*
         soon:
         return session.dataTaskPublisher(with: request)
         .decode(T.self, JSONDecoder())
         */
        let publisher = Publishers.Future<T, Error>({ fulfill in
            
            self.session.dataTask(with: request, completionHandler: { (data, response, error) in
                guard error == nil else {
                    fulfill(.failure(error!))
                    return
                }
                guard let data = data else {
                    fulfill(.failure(NetworkError.noData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    fulfill(.success(result))
                } catch {
                    fulfill(.failure(error))
                }
            }).resume()
        })
        
        return publisher
    }
}
