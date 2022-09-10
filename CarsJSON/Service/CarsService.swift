//
//  CarsService.swift
//  CarsJSON
//
//  Created by Vinicius on 06/09/22.
//

import Foundation

struct CarsService {
    
    func parseJSON() -> Cars? {
        guard let path = Bundle.main.path(forResource: "carros", ofType: "json") else {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            let cars = try JSONDecoder().decode(Cars.self, from: jsonData)
            
            return cars
        }
        catch {
            print("error: \(error)")
            return nil
        }
    }
}
