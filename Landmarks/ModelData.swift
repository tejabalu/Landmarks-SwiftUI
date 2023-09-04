//
//  ModelData.swift
//  Landmarks
//
//  Created by tb on 8/30/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ fileName: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Coudn't load file \(fileName) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Error trying to parse \(fileName) as \(T.self): \n\(error)")
    }
}
