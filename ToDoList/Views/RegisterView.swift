//
//  RegisterView.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Register", subtitle: "Start organizing todos")
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField(text: $viewModel.name) {
                        Text("Name")
                    }
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    
                    TextField(text: $viewModel.email) {
                        Text("Email")
                    }
                    .autocapitalization(.none)
                    
                    SecureField(text: $viewModel.password) {
                        Text("Password")
                    }.onSubmit {
                        viewModel.register()
                    }
                    
                    TLButton(title: "Create Account",
                             action: {
                        viewModel.register()
                    })
                    .padding(.vertical)
                }
                .padding(.vertical)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
