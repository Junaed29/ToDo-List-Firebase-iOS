//
//  SwiftUIView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user{
                    profile(user: user)
                }else{
                    Text("Loading Profile...")
                }
                    
            }.navigationTitle("Profile")
        }.onAppear{
            viewModel.fetchUser()
        }
    }
    
    
    @ViewBuilder
    func profile(user: UserModel) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 125, height: 125)
            .foregroundColor(.blue)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ").bold()
                Text(user.name)
            }.padding()
            
            HStack {
                Text("Email: ").bold()
                Text(user.email)
            }.padding()
            
            HStack {
                Text("Member Since: ").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }.padding()
        
        Button("Logout") {
            viewModel.logout()
        }.buttonStyle(.borderedProminent)
        
        Spacer()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
