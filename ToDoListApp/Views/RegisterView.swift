import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        ZStack {
            HeaderView(
                title: "Register",
                subtitle: "Start organizing tasks",
                backgroundColors: [Color.orange.opacity(0.8), Color.orange.opacity(1.0)], subtitleColor: .white
                
            )
            
            VStack(spacing: 20) {
                Spacer()
                
                // Registreringsformulär
                VStack(spacing: 15) {
                    // Namnfält
                    TextField("Full Name", text: $name)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.words)
                        .padding(.horizontal, 30)
                    
                    // E-postfält
                    TextField("Email Address", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal, 30)
                    
                    // Lösenordfält
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 30)
                    
                    // Bekräfta lösenordfält
                    SecureField("Confirm Password", text: $confirmPassword)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 30)
                }
                .padding(.top, 80)
                // Registreringsknapp
                Button(action: {
                    
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.brown)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                
                Spacer()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
