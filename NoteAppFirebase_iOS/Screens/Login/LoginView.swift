//
//  LoginView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "To Do List", subTitle: "Get things done", color: .pink, rotationDegree: 15)
            
            Form {
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TextField("Email Address", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                SecureField("Enter password", text: $viewModel.password)
                    
                TLButton(title: "Log In", background: .blue) {
                    //
                }

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
