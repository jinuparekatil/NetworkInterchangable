//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Jinu on 17/11/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userListViewmodel : UserListViewModel
    
    init() {
        self.userListViewmodel = UserListViewModel(service: LocalService())
    }
    var body: some View {
       
        List(userListViewmodel.userList,id: \.id){ user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(user.userName)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Text(user.email)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
        }.task {
            await userListViewmodel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
