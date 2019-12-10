//
//  NetworkManager.swift
//  L33tNews
//
//  Created by Adrien Wilkins on 2019/11/29.
//  Copyright © 2019 Adrien Wilkins. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
   /*
     fetchData() creates a URLSession and uses a datatask with the given url to 
     */
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // Anytime you have a listener updates must be "posted" to the main thread
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
}
