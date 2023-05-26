//
//  TodoListItemModel.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import Foundation

struct TodoListItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
    
    
    static let MOCK_ITEM_TRUE = TodoListItemModel(id: "886427C2-71E9-4652-8734-8DD39589D885", title:
                                                "New 1", dueDate: 1685079420.655962, createdDate: 1685079420.655962, isDone: true)
    
    
    static let MOCK_ITEM_FALSE = TodoListItemModel(id: "886427C2-71E9-4652-8734-8DD39589D885", title:
                                                "New 1", dueDate: 1685079420.655962, createdDate: 1685079420.655962, isDone: false)
    
    
}
