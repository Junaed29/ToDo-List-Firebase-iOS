//
//  XDismissButtonView.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 24/5/23.
//

import SwiftUI

struct XDismissButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
                .opacity(0.7)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
        }
    }
}

struct XDismissButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButtonView()
    }
}
