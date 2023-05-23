//
//  RegisterView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "Start organizing todos", color: .orange, rotationDegree: -15)
          
            Form {
                TextField("Full Name", text: $name)
                TextField("Email address", text: $email)
                SecureField("Password", text: $password)
                
                TLButton(title: "Create Account", background: .green) {
                    //
                }.padding()
            }.offset(y: -50)
            
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
