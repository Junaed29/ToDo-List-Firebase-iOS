//
//  Encodable+Ext.swift
//  NoteAppFirebase_iOS
//
//  Created by Junaed Muhammad Chowdhury on 23/5/23.
//

import Foundation


extension Encodable{
    func asDictinary() -> [String: Any] {
        guard let data  = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
            
        }catch{
            return [:]
        }
    }
}
