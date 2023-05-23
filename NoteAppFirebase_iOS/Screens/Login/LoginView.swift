//
//  LoginView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "To Do List", subTitle: "Get things done", color: .pink, rotationDegree: 15)
            
            Form {
                TextField("Email Address", text: $email)
                SecureField("Enter password", text: $password)
                    
                TLButton(title: "Log In", background: .blue) {
                    //
                }.padding()

            }
            .offset(y: -50)
            
            
            VStack {
                Text("New around here?")
                
                NavigationLink("Create An Acoount") {
                    RegisterView()
                }.foregroundColor(.blue)
            }.padding(.bottom, 50)
            
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
