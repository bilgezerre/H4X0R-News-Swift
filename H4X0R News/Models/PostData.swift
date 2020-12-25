//
//  PostData.swift
//  H4X0R News
//
//  Created by Macbook on 23.12.2020.
//

import Foundation

//create a model with exactly same name in api url
struct Result: Decodable {
    let hits: [Post]
}
//you will differentiate them with id so you have to use Identifiable
struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
