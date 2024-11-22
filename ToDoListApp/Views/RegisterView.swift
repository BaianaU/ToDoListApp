import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var confirmPassword: String = ""

    var body: some View {
        ZStack {
            HeaderView(
                title: "Register",
                subtitle: "Start organizing tasks",
                backgroundColors: [Color.orange.opacity(0.8), Color.orange.opacity(1.0)],
                subtitleColor: .white
            )
            
            VStack(spacing: 20) {
                Spacer()
                
                // Registreringsformulär
                VStack(spacing: 15) {
                    // Namnfält
                    TextField("Full Name", text: $viewModel.name)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.words)
                        .padding(.horizontal, 30)
                    
                    // E-postfält
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.horizontal, 30)
                        .autocorrectionDisabled()
                    
                    // Lösenordfält
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 30)
                    
                    }
                .padding(.top, 80)
                
                TLButton(
                    title: "Create Account",
                    background: Color(red: 211 / 255, green: 122 / 255, blue: 28 / 255),
                    
                    action: {
                        viewModel.register()
                        
                        print("Attempt registration")
                        
                    }
                    
                   
                )
                
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
