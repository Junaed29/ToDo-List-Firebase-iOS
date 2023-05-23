//
//  RegisterViewModel.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register(){
        
        guard validate() else { return }
        
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else{
                self?.errorMessage = "Registration faild"
                return
            }
            
            self?.insertedUserRecord(id: userId)
        }
    }
    
    private func insertedUserRecord(id: String){
        let newUser = UserModel(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictinary())
    }
    
    func validate() -> Bool{
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.isValidEmail else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 6 else{
            errorMessage = "Please at least 6 charecter"
            return false
        }
        
        return true
    }
    
}
