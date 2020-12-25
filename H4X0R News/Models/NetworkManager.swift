//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Macbook on 23.12.2020.
//

import Foundation

class NetworkManager: ObservableObject{
    
//    create a published posts variable from PostData, Post struct
    @Published var posts = [Post]()
    
    func fetchData(){
//        create url
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
//            create url session
            let session = URLSession(configuration: .default)
//            give url session a task and click again the the second part to implement a closure
            let task = session.dataTask(with: url) { (data, response, error) in
//                decode the json if there is no error
                if  error == nil {
                    let decoder = JSONDecoder()
//                    you need to optional bindint to the data use do/catch statement
                    if let safeData = data {
                        do {
//                            decode the data from safeData in closure and the data will be decoded to Result in PostData
                            let result = try decoder.decode(Result.self, from: safeData )
//                            the result includes the hits, put them to Published posts in the beginning of the code
                            DispatchQueue.main.async {
                                self.posts = result.hits
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
