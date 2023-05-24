//
//  NewItemView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top)
            
            Form {
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Select a date:", selection: $viewModel.dueDate, in: Date()... )
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink) {
                    viewModel.save()
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
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
