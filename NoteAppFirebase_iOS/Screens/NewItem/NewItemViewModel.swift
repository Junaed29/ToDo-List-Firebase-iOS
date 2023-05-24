//
//  NewItemViewModel.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import Foundation
import SwiftUI




class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    
    func save() {
        showAlert = false
        guard canSave() else {
            showAlert = true
            return
        }
        
        
        
    }
    
    func canSave() -> Bool {
        if title.trimmingCharacters(in: .whitespaces).isEmpty{
            return false
        }
        
        return true
    }
    
    
}
