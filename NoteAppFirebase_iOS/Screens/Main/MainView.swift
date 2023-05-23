//
//  ContentView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 22/5/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
                TodoListView()
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
