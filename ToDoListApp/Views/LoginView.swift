import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            // Header bakgrund
            HeaderView()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Spacer()
                
                VStack(spacing: 15) {
                    // E-postfält
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                        .padding(.horizontal, 30)
                    
                    // Lösenordfält
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 30)
                }
                
                // Login-knapp
                Button(action: {
                    // Login-action
                }) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                
                Spacer() // Mellanrum som centrerar textfält och knappen
                
                // Registreringslänk för nya användare
                VStack {
                    Text("New user?")
                        .foregroundColor(.white)
                    
                    Button(action: {
                        // Register-action
                    }) {
                        Text("Create an account")
                            .foregroundColor(.blue)
                            .font(.headline)
                    }
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
