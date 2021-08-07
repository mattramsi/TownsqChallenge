//
//  Post.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation

struct Post: Codable, Identifiable {

    let id: Int
    let title: String
    let body: String
    let userId: Int

}
