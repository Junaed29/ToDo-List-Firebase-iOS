//
//  ContentView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 22/5/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
