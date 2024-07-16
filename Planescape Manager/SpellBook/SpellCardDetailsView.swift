//
//  SpellCardView.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-05-15.
//


import SwiftUI

struct SpellCardDetailsView: View {
    let spell: Spell
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(spell.name ?? "")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.56, green: 0.18, blue: 0.13))
            
            Divider().background(Color(red: 0.56, green: 0.18, blue: 0.13))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Casting Time: \(spell.castingTime ?? "n/a")")
                Text("Range: \(spell.range ?? "n/a")")
                Text("Components: \(spell.components?.joined(separator: ", ") ?? "n/a")")
                Text("Duration: \(spell.duration ?? "n/a")")
            }
            .font(.subheadline)
            .foregroundColor(.black)
            .bold()
            
            Text(spell.desc?.joined(separator: ", ") ?? "n/a")
                .font(.body)
                .foregroundColor(.black)
                .padding(.vertical, 8)
            
            Text("Damage")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.56, green: 0.18, blue: 0.13))
            
            Divider().background(Color(red: 0.56, green: 0.18, blue: 0.13))
            HStack(alignment: .top, spacing: 4) {
                Text("@Character Level")
                if let damageAtCharacterLevel = spell.damage?.damageAtCharacterLevel {
                    let damageStrings = damageAtCharacterLevel.map { "\($0.key): \($0.value)" }
                    Text(damageStrings.joined(separator: ", "))
                        .font(.body)
                        .foregroundColor(.black)
                } else {
                    Text("n/a")
                        .font(.body)
                        .foregroundColor(.black)
                }
            }
            HStack(alignment: .top, spacing: 4) {
                Text("@Slot Level")
                if let damageAtSlotLevel = spell.damage?.damageAtSlotLevel {
                    let damageStrings = damageAtSlotLevel.map { "\($0.key): \($0.value)" }
                    Text(damageStrings.joined(separator: ", "))
                        .font(.body)
                        .foregroundColor(.black)
                } else {
                    Text("n/a")
                        .font(.body)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .frame(maxWidth: 500, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
        .shadow(radius: 5)
        .padding()
    }
}


struct SpellCardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SpellCardDetailsView(spell: DeveloperPreview.instance.spell)
    }
}
