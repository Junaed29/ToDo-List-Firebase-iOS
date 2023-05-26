//
//  TodoListView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI
import FirebaseFirestoreSwift


struct TodoListView: View {
    @StateObject var viewModel : TodoListViewModel
    private let userId: String
    
    @FirestoreQuery var items: [TodoListItemModel]
    
    init(userId: String) {
        self.userId = userId
        
        //Collection Path: users/<userId>/todos/<Entities>
        self._items = FirestoreQuery(collectionPath: "\(USER_COLLECTION)/\(userId)/\(TODO_COLLECTION)")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item) {
                        viewModel.toogleIsDone(item: item)
                    }.swipeActions {
                        Button("Delete") {
                            viewModel.deleteItem(itemId: item.id)
                        }.tint(.red)
                    }
                    
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }

            }
            .fullScreenCover(isPresented: $viewModel.showingNewItemView) {
                NewItemView()
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "GO5GOmJovqMKFwtBTH4251A2jZa2")
    }
}
