//
//  UserModel.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import Foundation


struct UserModel: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
