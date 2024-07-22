//
//  SpellCardService.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-05-15.
//

import Foundation
import Combine


class SpellDataService: ObservableObject {
    @Published var spellsInfo: [Spell] = []
    private var spellSubscription = Set<AnyCancellable>()
    
    init() {
        // Ideally this would be another call to get all spells according to some other criteria
        let mySpells = ["mending", "prestidigitation", "alarm", "detect-magic", "jump", "magic-missile", "thunderwave"]
        mySpells.forEach { spellid in
             getSpell(spellId: spellid)
         }
    }
    
    private func getSpell(spellId: String) {
        guard let url = URL(string: "https://www.dnd5eapi.co/api/spells/\(spellId)") else { return }
    
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                            guard let response = output.response as? HTTPURLResponse else {
                                print("Failed to get HTTP response")
                                throw URLError(.badServerResponse)
                            }
                            print("HTTP Response Status Code: \(response.statusCode)")
                            guard response.statusCode >= 200 && response.statusCode < 300 else {
                                print("Bad server response: \(response.statusCode)")
                                throw URLError(.badServerResponse)
                            }
                            print("Received data: \(output.data)")
                            return output.data
                        }
            .receive(on: DispatchQueue.main)
            .decode(type: Spell.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    print("Data fetch completed successfully.")
                case .failure(let error):
                    print("Data fetch failed with error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedSpell in
                self?.spellsInfo.append(returnedSpell)
                print("Fetched Spell: \(returnedSpell)")
            }
            .store(in: &spellSubscription)
    }
}
