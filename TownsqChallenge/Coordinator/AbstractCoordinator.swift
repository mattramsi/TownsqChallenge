//
//  AbstractCoordinator.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 07/08/21.
//

import Foundation

protocol AbstractCoordinator {
    func addChildCoordinator(_ coordinator: AbstractCoordinator)
    func removeAllChildCoordinaatorsWith<T>(type: T.Type)
    func removeAllChildCoordinators()
}
