//
//  ToDo.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import Foundation

struct ToDo: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        self.isDone = state
    }
}
