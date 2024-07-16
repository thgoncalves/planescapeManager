//
//  SpellCardList.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-06-15.
//

import SwiftUI

import SwiftUI

struct SpellCardList: View {
    let spellInfo: Spell
    
    var body: some View {
        HStack{
            VStack{
                Text(spellInfo.name ?? "")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(red: 0.56, green: 0.18, blue: 0.13))
                Text(spellInfo.desc?.joined(separator: ", ") ?? "n/a")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.black)
                    .lineLimit(3)
                Divider()
            }
        }
//        .padding(.vertical,10)
//        .padding(.horizontal,5)
        .frame(maxWidth: 500, alignment: .leading)
        .background(Color.white)
//        .overlay(
//            Rectangle()
//                .stroke(Color.gray, lineWidth: 1)
//        )
    }
}


struct SpellCardList_Previews: PreviewProvider {
    static var previews: some View {
        SpellCardList(spellInfo: DeveloperPreview.instance.spell)
    }
}
