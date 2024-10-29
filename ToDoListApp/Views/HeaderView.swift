//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Baiana Usupbaeva on 2024-10-28.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Titel och undertext
                VStack(spacing: 10) {
                    Text("To Do List")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    Text("Get things done")
                        .font(.system(size: 30, weight: .light))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.top, 40)
                .offset(y: -350)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
