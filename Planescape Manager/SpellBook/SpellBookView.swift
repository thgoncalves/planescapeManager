//
//  SpellBookView.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-06-15.
//

import SwiftUI

struct SpellBookView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    
    let columns = Array(repeating: GridItem(.flexible()), count: 1)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(vm.isSearching ? vm.filteredSpells :vm.allSpells) { spell in
                        NavigationLink(destination: SpellCardDetailsView(spell: spell)) {
                            SpellCardList(spellInfo: spell)
                        }
                    }
                }
                .padding(.vertical,10)
                .padding(.horizontal,5)
                .navigationTitle("Spells")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $vm.searchText, placement: .automatic, prompt: Text("Search"))
            }
        }
        
    }
}



#Preview {
    SpellBookView()
        .environmentObject(HomeViewModel())
}

