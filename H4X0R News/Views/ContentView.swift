//
//  ContentView.swift
//  H4X0R News
//
//  Created by Macbook on 23.12.2020.
//

import SwiftUI

struct ContentView: View {
    
//    to take the observed object from netwworkManager class
    @ObservedObject var networkManager = NetworkManager()
    
//    onAppear is like viewDidLoad, we need to trigger the fetchData() from that part
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }.navigationBarTitle("H4X0R News")
        }.onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
