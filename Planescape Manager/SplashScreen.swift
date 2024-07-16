//
//  SplashScreen.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-06-15.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive: Bool = false
    @State private var animateBackground: Bool = false
    @State private var animateText: Bool = false
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    let splashScreenDuration: Double = 2.0
    
    var body: some View {
        if isActive {
            RootView()
        } else {
            ZStack{
                Image("fantasy_forest_background2")
                    .opacity(animateBackground ? 1 : 0)
                Text("D&D\nSpellbook")
                    .padding()
                    .fontWeight(.semibold)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.3))
                    .offset(x: -100, y: -100)
                    .opacity(animateText ? 1.0 : 0)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + splashScreenDuration, execute:  {
                            withAnimation(.easeInOut(duration: 0.2)){
                                animateBackground.toggle()
                            }
                        })
                        DispatchQueue.main.asyncAfter(deadline: .now() + splashScreenDuration + 1.0, execute:  {
                            withAnimation(.easeIn(duration: 0.5)){
                                animateText.toggle()
                            }
                        })
                        DispatchQueue.main.asyncAfter(deadline: .now() + splashScreenDuration + 2.0, execute:  {
                            withAnimation(.easeIn(duration: 0.5)){
                                isActive.toggle()
                            }
                        })

                    }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
