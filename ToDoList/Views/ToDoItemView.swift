//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(size: 24))
                    .bold()
                    .padding(.bottom, 4)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            
            Spacer()
            
            Button(action: {
                viewModel.toggleCheck(item: item)
            }) {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.indigo)
                    .font(.system(size: 24))
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(item: ToDo(id: "1",
                                title: "title",
                                dueDate: Date().timeIntervalSince1970,
                                createdDate: Date().timeIntervalSince1970,
                                isDone: true))
    }
}
