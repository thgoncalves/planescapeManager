//
//  PreviewProvider.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-05-15.
//

import Foundation
import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}


class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init () {}
    
    let homeVM = HomeViewModel()

    let spell = Spell(
        id: "acid-arrow",
        name: "Acid Arrow",
        desc: [
            "A shimmering green arrow streaks toward a target within range and bursts in a spray of acid. Make a ranged spell attack against the target. On a hit, the target takes 4d4 acid damage immediately and 2d4 acid damage at the end of its next turn. On a miss, the arrow splashes the target with acid for half as much of the initial damage and no damage at the end of its next turn."
          ],
        higherLevel: [
            "When you cast this spell using a spell slot of 3rd level or higher, the damage (both initial and later) increases by 1d4 for each slot level above 2nd."
          ],
        range: "90 feet",
        components: [
            "V",
            "S",
            "M"
          ],
        material: "Powdered rhubarb leaf and an adder's stomach.",
        ritual: false,
        duration: "Instantaneous",
        concentration: false,
        castingTime:  "1 action",
        level: 2,
        attackType: "ranged",
        damage: Damage(
            damageType:
                School(index: "acid", name: "Acid", url: "/api/damage-types/acid"),
            damageAtCharacterLevel: [
                "2": "4d4",
                "3": "5d4",
                "4": "6d4",
                "5": "7d4",
                "6": "8d4",
                "7": "9d4",
                "8": "10d4",
                "9": "11d4"],
            damageAtSlotLevel: [
                "1": "1d4 + 1",
                "2": "1d4 + 1",
                "3": "1d4 + 1",
                "4": "1d4 + 1",
                "5": "1d4 + 1",
                "6": "1d4 + 1",
                "7": "1d4 + 1",
                "8": "1d4 + 1",
                "9": "1d4 + 1"]),
        school: nil,
        classes: nil,
        subclasses: nil,
        url: "/api/spells/acid-arrow")
    }


