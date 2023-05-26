//
//  NewItemView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct NewItemView: View {
    
    let todoItem: TodoListItemModel?
    @StateObject var viewModel: NewItemViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(todoItem: TodoListItemModel? = nil) {
        self.todoItem = todoItem
        _viewModel = StateObject(wrappedValue: NewItemViewModel(todoItem: todoItem))
    }
    
    var body: some View {
        VStack {
            Text(todoItem == nil ? "New Item" : "Update Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top)
            
            Form {
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Select a date:", selection: $viewModel.dueDate, in: Date()... )
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: todoItem == nil ? "Save" : "Update", background: .pink) {
                    if let todoItem{
                        viewModel.update(item: todoItem)
                    }else{
                        viewModel.save()
                    }
                }
            }
        }.overlay(alignment: .topTrailing) {
            Button {
                dismiss()
            } label: {
                XDismissButtonView()
            }.padding(.trailing)

        }.alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"), message: Text("Please give a title"))
        }.onChange(of: viewModel.dateSavedSuccess) { newValue in
            if newValue{
                dismiss()
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
