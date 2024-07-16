//
//  HomeViewModel.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-05-15.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allSpells: [Spell] = []
    @Published var filteredSpells: [Spell] = []
    @Published var searchText: String = ""
    
    private let dataService = SpellDataService()
    private var cancellables = Set<AnyCancellable>()
    
    var isSearching: Bool{
        !searchText.isEmpty
    }
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$spellsInfo
            .receive(on: DispatchQueue.main)
            .sink { [weak self] spells in
                self?.allSpells = spells
            }
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                self?.filterSpells(searchText: searchText)}
            .store(in: &cancellables)
    }
    
    private func filterSpells(searchText: String){
        print(searchText)
        guard !searchText.isEmpty else{
            filteredSpells = []
            return
        }
        
        let search = searchText.lowercased()
        filteredSpells = allSpells.filter({ spell in
            let titleContainsSearch = spell.name?.lowercased().contains(search) ?? false
            print(titleContainsSearch)
            let descContainsSearch = spell.desc?.first?.lowercased().contains(search) ?? false
            return titleContainsSearch || descContainsSearch
        })
    }
    
    
}
