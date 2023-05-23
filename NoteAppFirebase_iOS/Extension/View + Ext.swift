//
//  UIScreen + Ext.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import SwiftUI

extension View{
    func getScreenWide() -> CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    func getScreenHeight() -> CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    func getScreenSize() -> CGSize {
        UIScreen.main.bounds.size
    }
}
