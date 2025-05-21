//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Baiana Usupbaeva on 2024-10-28.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        // Skapar en kopia av objektet och uppdatera `isDone`
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        // Hämta användarens UID
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users") // Lägg till kollektionen "users"
            .document(uid) // Användarens dokument
            .collection("todos") // Kollektionen för att-göra-punkter
            .document(itemCopy.id) // Specifika uppgiftens dokument
            .setData(itemCopy.asDictionary()) { error in
                if let error = error {
                    print("Failed to update item: \(error.localizedDescription)")
                } else {
                    print("Item status updated successfully")
                }
            }
    }
    
    
}
                        

