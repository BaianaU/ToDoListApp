//
//  Extensions.swift
//  ToDoListApp
//
//  Created by Baiana Usupbaeva on 2024-11-19.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        // Skapa en instans av JSONEncoder
        let encoder = JSONEncoder()
        
        
        guard let data = try? encoder.encode(self) else {
            return [:]
        }
        
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            
            return [:]
        }
    }
}
