//
//  ProfileView.swift
//  firebaseTest
//
//  Created by Thiago Pinto on 2024-05-08.
//

import SwiftUI


struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Image("spell_book_library")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .edgesIgnoringSafeArea(.all)
                    .clipped()
                Form {
                    Image("userProfile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .foregroundColor(.black)
                        .background(Color.white.opacity(0.9))
                    
                    Section(header: Text("General")) {
                        if let user = viewModel.user {
                            Text("ID: \(user.uid)")
                                .font(.headline)
                                .lineLimit(1)
                                .foregroundColor(.black)
                            Text("Guest?: \(user.isAnonymous ? "Yes" : "No")")
                                .font(.headline)
                                .foregroundColor(.black)
                            Text("Email: \(user.email ?? "No Email")")
                                .font(.headline)
                                .foregroundColor(.black)
                        } else {
                            Text("No user information available")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Button("Log out") {
                        Task {
                            do {
                                try viewModel.signOut()
                            } catch {
                                print(error)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            Spacer()
                .toolbarBackground(Color.blue, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("D&D\nSpellbook")
                            .fontWeight(.black)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "person.crop.circle")
                                .font(.headline)
                        }
                    }
                }
                .onAppear {
                    try? viewModel.loadCurrentUser()
                }
        }
    }
}

#Preview {
    NavigationStack{
        ProfileView()
    }
}
