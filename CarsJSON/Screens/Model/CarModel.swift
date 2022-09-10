//
//  CarModel.swift
//  CarsJSON
//
//  Created by Vinicius on 31/08/22.
//

import UIKit

struct Cars: Codable {
    let carros: [CarModel]
}

struct CarModel: Codable {
    let id: String
    let modelo: String
    let ano: Int
    let cor: String
    let imagem: String
}
