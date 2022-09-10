//
//  CarsTableViewCell.swift
//  CarsJSON
//
//  Created by Vinicius on 31/08/22.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    @IBOutlet weak var carIdLabel: UILabel!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carYearLabel: UILabel!
    @IBOutlet weak var carColorLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    static let identifier = "CarsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setupCell(with modelData: CarModel) {
        carIdLabel.text = "ID - " + modelData.id
        carModelLabel.text = "Modelo - " + modelData.modelo
        carYearLabel.text = "Ano - " + String(modelData.ano)
        carColorLabel.text = "Cor - " + modelData.cor
        carImage.image = UIImage(named: modelData.imagem)
    }
}
