import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel: NewItemViewViewModel
    @Binding var newItemPresented: Bool

    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                // Titel
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Förfallodatum
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Spara-knapp
                TLButton(title: "Save", background: .green) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                        
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date that is today or newer.")
                )
            }
        }
    }
}

#Preview {
    NewItemView(
        viewModel: NewItemViewViewModel(),
        newItemPresented: .constant(true)
    )
}




