//
//  SearchOdjectController.swift
//  Learn Json
//
//  Created by Jonathan Burnett on 23/01/2021.
//

import Foundation
import SwiftUI

class SearchObjectController: ObservableObject {
    static let shared = SearchObjectController()
    private init() {}
    
    var token = "ZQ9Dvo1FSzbHS6DHSi2u3yDjvBk41cE-4TEaVp_8Nco"
    @Published var results = [Result]()
    @Published var searchText : String = "flowers"
    
    func search() {
        let url = URL(string: "https://api.unsplash.com/search/photos?query=\(searchText)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let res = try JSONDecoder().decode(Results.self, from: data)
                self.results.append(contentsOf: res.results)
                
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
