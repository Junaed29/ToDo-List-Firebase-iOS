//
//  MainViewModel.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import Foundation
import FirebaseAuth


class MainViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handeler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handeler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
    
}
