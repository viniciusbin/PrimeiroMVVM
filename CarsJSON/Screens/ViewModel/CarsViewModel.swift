//
//  CarsViewModel.swift
//  CarsJSON
//
//  Created by Vinicius on 06/09/22.
//

import Foundation

enum CarsViewModelError: Error {
    case runtimeError(String)
}

class CarsViewModel {
    private var cars: Cars? {
        didSet {
            delegate?.didGetData()
        }
    }
    
    private var carService: CarsService
    public var delegate: CarsViewProtocol?
    
    init(carService: CarsService = CarsService()) {
        self.carService = carService
    }
    
    public func getCarService() {
        cars = carService.parseJSON()
    }
    
    public func getCount() -> Int {
        if let cars = cars {
            return cars.carros.count
        }
        return 0
    }
    
    public func getCars(_ index: Int) throws -> CarModel {
        guard let cars = cars else {
            throw CarsViewModelError.runtimeError("Erro ao obter dados! Tente novamente.")
        }
        return cars.carros[index]
    }
}
