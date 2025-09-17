//
//  CreateNew.swift
//  Cocktail-Library
//
//  Created by Sola Lhim on 9/10/25.
//

import SwiftUI

struct CreateNew: View {
    
    var body: some View {
        TabView{
            VStack {
                Text("Cocktail Library")
            }
            .tabItem{
                Label("Home", systemImage: "house.fill")
            }

        }
    }
}
