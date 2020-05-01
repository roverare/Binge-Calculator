//
//  TVShowAPI.swift
//  Binge Calculator
//
//  Created by Rebecca Overare on 4/30/20.
//  Copyright © 2020 Rebecca Overare. All rights reserved.
//

import Foundation

enum TvShowError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct TvShowRequest {
    let resourceURL: URL
    
    init(tvName: String) {
        
        let resourceString = "https://www.episodate.com/api/show-details?q=\(tvName)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
        print(resourceURL)
    }
    
    func getTvShows(completion:  @escaping(Result<[TvShowEpisode], TvShowError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
             let decoder = JSONDecoder()
                let tvShowResponse = try decoder.decode(TvShow.self, from: jsonData)
                print("TvShowRespo: \(tvShowResponse)")
                let seasonDetails = tvShowResponse.tvShow.episodes
                completion(.success(seasonDetails))
                
            } catch {
                completion(.failure(.canNotProcessData))
            }
    
    }
        dataTask.resume()
        
}
    
    
}
