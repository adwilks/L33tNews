//
//  ContentView.swift
//  L33tNews
//
//  Created by Adrien Wilkins on 2019/11/29.
//  Copyright © 2019 Adrien Wilkins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        
                        Text(post.title)
                    }
                }
                
                
            }
            .navigationBarTitle("L33t News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
