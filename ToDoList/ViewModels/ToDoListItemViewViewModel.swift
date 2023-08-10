//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    func toggleCheck(item: ToDo) {
        var newItem = item
        
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
