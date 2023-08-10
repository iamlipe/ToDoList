//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDo]
        
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoItemView(item: item)
                        .swipeActions {
                            Button("Delete", action: {
                                viewModel.delete(id: item.id)
                            })
                            .tint(.indigo.opacity(0.4))
                        }
                }
                .listStyle(PlainListStyle())
                .padding(.vertical, 32)
                
                
                Button(action: { viewModel.showingNewItemView = true }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(.indigo)
                        
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                                        
                            Text("Add")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .frame(height: 44)
                    .padding()
                                    
                }
            }
            .navigationTitle("To Do List")
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "x9Mq6pp1eDSGJzGzgVx5h5xJiYA3")
    }
}
