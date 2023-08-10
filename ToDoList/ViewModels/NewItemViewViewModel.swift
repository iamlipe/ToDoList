//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
        
    func save() {
        guard canSave else {
            return
        }
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
                
        let newId = UUID().uuidString
        let newItem = ToDo(id: newId,
                           title: title,
                           dueDate: dueDate.timeIntervalSince1970,
                           createdDate: Date().timeIntervalSince1970,
                           isDone: false)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
