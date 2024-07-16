//
//  HomeView.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-05-15.
//

import SwiftUI

struct HomeView: View {
    
    let iconSize: Double = 150
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("fantasy_library")
                VStack{
                    HStack{
                        VStack{
                            NavigationLink(destination: SpellBookView()) {
                                Image("spell_book_icon")
                                    .resizable()
                                    .scaleEffect(1.1)
                                    .frame(maxWidth: iconSize, maxHeight: iconSize)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                            }
                            Text("Spells")
                        }
                        .padding(15)
                        .frame(width: .infinity)
                        .background(Color.orange.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack{
                            Image("character_group_icon")
                                .resizable()
                                .scaleEffect(1.4)
                                .frame(maxWidth: iconSize, maxHeight: iconSize)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                            Text("Characters")
                        }
                        .padding(15)
                        .frame(width: .infinity)
                        .background(Color.orange.opacity(0.6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .offset(y: -100)
                Spacer()
            }
            .padding()
            .navigationTitle("Test")
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                Text("D&D\nSpellbook")
                        .fontWeight(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink{
                        ProfileView()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
