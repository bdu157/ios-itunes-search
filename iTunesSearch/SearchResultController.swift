//
//  SearchResultController.swift
//  iTunesSearch
//
//  Created by Dongwoo Pae on 5/25/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

class SearchResultController {
    
    let basicURL = URL(string: "https://itunes.apple.com/search")!
    
    var searchResults: [SearchResult] = []
    
    // 1. Base URL
    // 2. Set up URL Components and Query Items
    // 3. Add query items to URL Components
    // 4. Get final URL from URL Components
    // 5. Create URL Request with URL
    // 6. Set HTTP method
    // 7. Create data task with URL Request
    //  a. handle error
    //  b. safley unwrap data
    //  c. decod dtat(set stragtegy if neccesary)
    //  d. set self.people = decodedData
    
    func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping (Error?) -> Void ) {
        
        //https://itunes.apple.com/search?term=jack+johnson&entity=software, musicTrack, movie
        var urlComponents = URLComponents(url: basicURL, resolvingAgainstBaseURL: true)
        
        let searchTermQueryItem = URLQueryItem(name: "term", value: searchTerm+"&entity=\(resultType)")
        
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {NSLog("requestURL is nil"); completion(NSError()); return}
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data \(error)")
                completion(NSError())
                
            } else {
                
                guard let data = data else {
                    NSLog("No data returned from data task")
                    completion(nil)  //since there is no error and we only have Error? in closure
                    return
                }
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let searchResults = try jsonDecoder.decode(SearchResults.self, from: data)
                    self.searchResults = searchResults.results
                    completion(nil)
                } catch {
                    NSLog("unable to decode \(error)")
                    completion(error)
                }
            }
        }
    }
    
    
    
    
    
    
}
