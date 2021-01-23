//
//  ContentView.swift
//  Learn Json
//
//  Created by Jonathan Burnett on 23/01/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var searchObjectController = SearchObjectController.shared
    var body: some View {
        List{
            ForEach(searchObjectController.results, id: \.id, content: {
                result in
                Text(result.description ?? "Empty")
        })
        }.onAppear() {
            searchObjectController.search()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
