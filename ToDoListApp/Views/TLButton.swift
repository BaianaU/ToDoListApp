import SwiftUI

struct TLButton: View {
    var title: String
    var background: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title) // Användarens titel för knappen
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 200, height: 50)
                .background(background) // Användarens bakgrundsfärg
                .cornerRadius(10)
                .padding(.top, 20)
        }
    }
}

#Preview {
    TLButton(title: "Value", background: Color(red: 211 / 255, green: 122 / 255, blue: 28 / 255)) {
        print("Log In button pressed")
    }
}
