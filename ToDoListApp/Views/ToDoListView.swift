// MARK: Sparad lokal kopia 2025-05-21
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    // NYA STATE-VARIABLER
    @State private var showDeleteAlert = false
    @State private var itemToDelete: ToDoListItem?
    @State private var showOnlyIncomplete = false // För filtrering

    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // 🔘 Toggle för filtrering
                Toggle("Visa endast oklara uppgifter", isOn: $showOnlyIncomplete)
                    .padding(.horizontal)
                    .tint(.blue)

                // Filtrering + sortering
                let filteredItems = showOnlyIncomplete ? items.filter { !$0.isDone } : items
                let sortedItems = filteredItems.sorted { $0.dueDate < $1.dueDate }

                List(sortedItems) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            // Alert innan borttagning
                            Button("Delete") {
                                itemToDelete = item
                                showDeleteAlert = true
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // Bekräftelse-alert
            .alert(isPresented: $showDeleteAlert) {
                Alert(
                    title: Text("Ta bort uppgift"),
                    message: Text("Är du säker på att du vill ta bort denna uppgift?"),
                    primaryButton: .destructive(Text("Ja")) {
                        if let item = itemToDelete {
                            viewModel.delete(id: item.id)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(
                    viewModel: NewItemViewViewModel(),
                    newItemPresented: $viewModel.showingNewItemView
                )
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "JcPXuPHr9regeCZZSau1Fhz8tk32")
}
