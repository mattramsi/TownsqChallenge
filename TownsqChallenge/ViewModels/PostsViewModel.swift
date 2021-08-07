//
//  PostsViewModel.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation
import Combine

final class PostsViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published public var posts : [Post] = []
   
    func onAppear() {
        fetchPosts()
    }
    
    private func fetchPosts() {
        
        let url = URL(string:"http://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .replaceError(with: [])
        .eraseToAnyPublisher()
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self] posts in
            self?.posts = posts
        })
       .store(in: &cancellables)
        
    }
    
}
