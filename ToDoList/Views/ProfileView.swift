//
//  ProfileView.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear { viewModel.fecthUser() }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.indigo)
            .frame(width: 125, height: 125)
            .padding(.vertical)
        
        VStack(spacing: 8) {
            HStack {
                Text("Name:")
                    .bold()
                
                Text(user.name)
            }
            
            HStack {
                Text("Email:")
                    .bold()
                
                Text(user.email)
            }
            
            HStack {
                Text("Member since:")
                    .bold()
                
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding(.bottom, 32)
        
        Button("Log out", action: { viewModel.logOut() })
            .tint(.indigo)
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
