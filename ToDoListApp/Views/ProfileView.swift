//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Baiana Usupbaeva on 2024-10-28.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewmodel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewmodel.user{
                    profile(user: user)
                    
                } else {
                    Text("Loading...")
                }
                    
                }
               
            .navigationTitle("Profile")
        }
        .onAppear {
            viewmodel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View{
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .bold()
            .padding()
        
        // Name, Email, Member since
        
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
                
            }
            .padding()
            
            HStack {
                Text("Member since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }

            .padding()
        }
        .padding()
        
        // Sing out
        Button("Log Out") {
            viewmodel.logOut()
        }
        .tint(.red)
        .padding()
        
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
