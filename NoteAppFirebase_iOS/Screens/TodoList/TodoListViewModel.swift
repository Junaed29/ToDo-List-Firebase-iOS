//
//  TodoListViewModel.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//


import SwiftUI
import FirebaseFirestore

class TodoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete ToDo item from firebase
    /// - Parameter itemId: Item Id
    func deleteItem(itemId: String) {
        let db = Firestore.firestore()
        
        db.collection(USER_COLLECTION)
            .document(userId)
            .collection(TODO_COLLECTION)
            .document(itemId)
            .delete()
    }
    
    
    func toogleIsDone(item: TodoListItemModel) {
        
    }
}
