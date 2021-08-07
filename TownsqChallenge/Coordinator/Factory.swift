//
//  Factory.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation

protocol Factory {
    func makeInitialViewController() -> PostsViewController
    func makeInitialViewModel() -> PostsViewModel
}

