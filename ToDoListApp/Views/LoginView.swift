import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
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
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.bottom, 10)
                    }
                    
                    VStack(spacing: 15) {
                        TextField("Email Address", text: $viewModel.email)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                            .padding(.horizontal, 30)
                            .autocorrectionDisabled()
                        
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 30)
                    }
                    
                    TLButton(
                        title: "Log In",
                        background: Color(red: 211 / 255, green: 122 / 255, blue: 28 / 255),
                        action: {
                            viewModel.login()
                        }
                    )
                    
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
