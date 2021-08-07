//
//  PostDetailViewModel.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation
import Combine

final class PostDetailViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    var post: Post!
    @Published public var author : User?
    @Published public var comment : Comment?
    
    init(post: Post) {
        self.post = post
    }
    
    func onAppear() {
        fetchAuthorName()
        fetchComment()
    }
    
    private func fetchAuthorName() {

        let url = URL(string:"http://jsonplaceholder.typicode.com/users/\(post.userId)")!
        URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: User.self, decoder: JSONDecoder())
        .replaceError(with: User(name: "none"))
        .eraseToAnyPublisher()
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self] author in
            self?.author = author
        })
       .store(in: &cancellables)
    }

    private func fetchComment() {

        let url = URL(string: "http://jsonplaceholder.typicode.com/comments/\(post.id)")!
        URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: Comment.self, decoder: JSONDecoder())
        .replaceError(with: Comment(postId: 0, id: 0, name: "", email: "", body: ""))
        .eraseToAnyPublisher()
        .receive(on: DispatchQueue.main)
        .sink(receiveValue: { [weak self] comment in
            self?.comment = comment
        })
       .store(in: &cancellables)
    }
}
