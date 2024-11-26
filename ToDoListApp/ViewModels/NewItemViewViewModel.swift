import FirebaseFirestore
import FirebaseAuth
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    func save() {
        // Kontrollera om sparningen är möjlig
        guard canSave else {
            showAlert = true
            return
        }
        
        // Hämta användarens UID
        guard let uId = Auth.auth().currentUser?.uid else {
            showAlert = true
            return
        }
        
        // Skapa ett nytt unikt ID för uppgiften
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Spara uppgiften i Firestore
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)  // Använd det nya unika ID:t
            .setData(newItem.asDictionary()) { error in
                if let error = error {
                    print("Failed to save item: \(error.localizedDescription)")
                    self.showAlert = true
                } else {
                    print("Item successfully saved")
                }
            }
    }
    
    // Kontroll för om sparningen är möjlig
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {  // Kontrollera att datumet inte är i det förflutna
            return false
        }
        return true
    }
}
