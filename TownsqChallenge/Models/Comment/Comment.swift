//
//  Comment.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation

struct Comment: Codable {
    
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
}
