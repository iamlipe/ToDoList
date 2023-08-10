//
//  User.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
