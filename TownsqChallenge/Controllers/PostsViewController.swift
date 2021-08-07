//
//  PostsViewController.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation
import SwiftUI
import Combine

final class PostsViewController: UIHostingController<PostsView> {
    
    var subscriptions = [AnyCancellable]()
    
    init(viewModel: PostsViewModel) {
        super.init(rootView: PostsView(viewModel: viewModel))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}

final class PostsRouter {
    
    public static func destinationForTappedPost(post: Post) -> some View {
        return PostDetailConfigurator.configurePostDetailView(with: post)
    }
}

final class PostDetailConfigurator {
    
    public static func configurePostDetailView(with post: Post) -> PostDetailView {
        
        let postDetailView = PostDetailView(
            viewModel: PostDetailViewModel(post: post)
        )
        
        return postDetailView
    }
}
