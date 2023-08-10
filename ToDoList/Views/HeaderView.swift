//
//  HeaderView.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.indigo)
            
            VStack {
                Text(title)
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
            .padding(.vertical)
        }
        .frame(
            width: UIScreen.main.bounds.width,
            height: 132
        )
        .background(.indigo)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "title", subtitle: "subtitle")
    }
}
