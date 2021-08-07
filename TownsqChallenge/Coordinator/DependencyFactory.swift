//
//  DependencyFactory.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation

class DependencyFactory: Factory {
    
    func makeInitialViewController() -> PostsViewController {
        let viewModel = makeInitialViewModel()
        let initialViewController = PostsViewController(viewModel: viewModel)
        return initialViewController
    }
    
    func makeInitialCoordinator() -> ProjectCoordinator {
        let coordinator = ProjectCoordinator(factory: self)
        return coordinator
    }
    
    func makeInitialViewModel() -> PostsViewModel {
        let viewModel = PostsViewModel()
       return viewModel
    }

  
}
