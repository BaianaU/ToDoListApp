//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Baiana Usupbaeva on 2024-10-28.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView: Bool = false
    
    private let userId: String
    
    
    
    init(userId: String) {
        self.userId = userId
        
    }
    // Radera to do list item
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
}
                        
