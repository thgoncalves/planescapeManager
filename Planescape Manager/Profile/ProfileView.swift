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
            VStack {
                Image("spell_book_library")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .edgesIgnoringSafeArea(.all)
                    .clipped()
                
                VStack(alignment: .center, spacing: 2) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.black)
                        .padding(15)
                        .background(Color.white.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                            
                    if let user = viewModel.user {
                        Text("User Profile: \(user.uid)")
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                            .background(Color.yellow.opacity(0.9))
                            .cornerRadius(20)
                            .shadow(radius: 10)
                        Button("Log out") {
                            Task {
                                do {
                                    try viewModel.signOut()
                                } catch {
                                    print(error)
                                }
                            }
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
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
