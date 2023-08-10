//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
        
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
