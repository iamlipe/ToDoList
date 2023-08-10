//
//  LoginView.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get things done")
                           
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField(text: $viewModel.email) {
                        Text("Email")
                    }
                        .autocapitalization(.none)
                    
                    SecureField(text: $viewModel.password) {
                        Text("Password")
                    }
                    
                    TLButton(title: "Log in",
                             action: {
                        viewModel.login()
                    })
                    .padding(.vertical)
                }
                .padding(.vertical)
                
                HStack {
                    Text("Don't have an account ?")
                    
                    NavigationLink("Sign in", destination: RegisterView())
                        .foregroundColor(.indigo)
                }
                .padding()
            }
        }
        .accentColor(.white)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
