import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done",
                    backgroundColors: [
                                            Color(red: 38 / 255, green: 66 / 255, blue: 85 / 255),
                                            Color(red: 20 / 255, green: 45 / 255, blue: 65 / 255)
                                            
                                        ],
                    subtitleColor: Color(red: 211 / 255, green: 122 / 255, blue: 28 / 255)
                )
                
                VStack {
                    Spacer()
                    Spacer()
                    
                    VStack(spacing: 15) {
                        TextField("Email Address", text: $email)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .padding(.horizontal, 30)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 30)
                    }
                    
                    Button(action: {
                        // Login-action
                    }) {
                        Text("Log In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color(red: 211 / 255, green: 122 / 255, blue: 28 / 255))
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("New user?")
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: RegisterView()) {
                            Text("Create an account")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
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
