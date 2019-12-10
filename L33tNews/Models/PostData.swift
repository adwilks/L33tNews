//
//  PostData.swift
//  L33tNews
//
//  Created by Adrien Wilkins on 2019/11/29.
//  Copyright © 2019 Adrien Wilkins. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
