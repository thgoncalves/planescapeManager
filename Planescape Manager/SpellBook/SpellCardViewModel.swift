//
//  SpellCardViewModel.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-05-15.
//

import Foundation

// MARK: - Spell
struct Spell: Identifiable, Codable {
    let id, name: String?
    let desc, higherLevel: [String]?
    let range: String?
    let components: [String]?
    let material: String?
    let ritual: Bool?
    let duration: String?
    let concentration: Bool?
    let castingTime: String?
    let level: Int?
    let attackType: String?
    let damage: Damage?
    let school: School?
    let classes, subclasses: [School]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case id = "index"
        case name, desc
        case higherLevel = "higher_level"
        case range, components, material, ritual, duration, concentration
        case castingTime = "casting_time"
        case level
        case attackType = "attack_type"
        case damage, school, classes, subclasses, url
    }
    
    static let empty = Spell(
        id: "",
        name: "",
        desc: [],
        higherLevel: [],
        range: "",
        components: [],
        material: "",
        ritual: false,
        duration: "",
        concentration: false,
        castingTime: "",
        level: 0,
        attackType: "",
        damage: nil,
        school: nil,
        classes: [],
        subclasses: [],
        url: ""
    )
}

// MARK: - School
struct School: Codable {
    let index, name, url: String?
}

// MARK: - Damage
struct Damage: Codable {
    let damageType: School?
    let damageAtCharacterLevel: [String: String]?
    let damageAtSlotLevel: [String: String]?

    enum CodingKeys: String, CodingKey {
        case damageType = "damage_type"
        case damageAtCharacterLevel = "damage_at_character_level"
        case damageAtSlotLevel = "damage_at_slot_level"
    }
}
