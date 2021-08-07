//
//  PostsView.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation
import SwiftUI

struct PostsView: View {
    
    @ObservedObject var viewModel: PostsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                
                NavigationLink(
                    destination: PostsRouter.destinationForTappedPost(post: post),
                    label: {
                        Text("Title: \(post.title)")
                        
                    })
                
            }.navigationTitle("Posts")
        }.onAppear {
            viewModel.onAppear()
        }
    }
    
}

