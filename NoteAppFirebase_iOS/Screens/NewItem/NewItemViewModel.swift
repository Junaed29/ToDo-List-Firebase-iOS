//
//  NewItemViewModel.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseAuth




class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var dateSavedSuccess = false
    
    init(todoItem: TodoListItemModel? = nil) {
        if let todoItem = todoItem {
            title = todoItem.title
            dueDate = Date(timeIntervalSince1970: todoItem.dueDate)
        }
    }
    
    func update(item: TodoListItemModel) {
        showAlert = false
        dateSavedSuccess = false
        guard canSave() else {
            showAlert = true
            return
        }
        
        //Get current user id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        //Create model
        let itemId = item.id
        let newItem = TodoListItemModel(id: itemId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: item.isDone)
        
        //Save model
        Firestore.firestore()
            .collection(USER_COLLECTION)
            .document(uid)
            .collection(TODO_COLLECTION)
            .document(itemId)
            .setData(newItem.asDictinary()) {[weak self] error in
                if error == nil{
                    self?.dateSavedSuccess = true
                }
            }
    }
    
    func save() {
        showAlert = false
        dateSavedSuccess = false
        guard canSave() else {
            showAlert = true
            return
        }
        
        //Get current user id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        //Create model
        let newId = UUID().uuidString
        let newItem = TodoListItemModel(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        //Save model
        Firestore.firestore()
            .collection(USER_COLLECTION)
            .document(uid)
            .collection(TODO_COLLECTION)
            .document(newId)
            .setData(newItem.asDictinary()) {[weak self] error in
                if error == nil{
                    self?.dateSavedSuccess = true
                }
            }
    }
    
    func canSave() -> Bool {
        if title.trimmingCharacters(in: .whitespaces).isEmpty{
            return false
        }
        
        return true
    }
    
    
}
