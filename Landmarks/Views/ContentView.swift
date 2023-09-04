//
//  ContentView.swift
//  Landmarks
//
//  Created by tb on 8/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        LandmarksList()
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
