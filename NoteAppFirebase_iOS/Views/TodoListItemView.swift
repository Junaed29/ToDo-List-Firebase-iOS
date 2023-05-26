//
//  TodoListItemView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct TodoListItemView: View {
    let item: TodoListItemModel
    var onDone: ()->()
    
    init(item: TodoListItemModel, _ onDone: @escaping () -> Void) {
        self.item = item
        self.onDone = onDone
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button {
                onDone()
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }

        }.padding(.vertical,5)
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: TodoListItemModel.MOCK_ITEM_TRUE){
            
        }
    }
}
