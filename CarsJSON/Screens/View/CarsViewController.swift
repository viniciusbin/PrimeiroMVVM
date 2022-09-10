//
//  ViewController.swift
//  CarsJSON
//
//  Created by Vinicius on 31/08/22.
//

import UIKit

protocol CarsViewProtocol {
    func didGetData()
}

class CarsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel = CarsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableview()
    }
    
    private func configTableview() {
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarsTableViewCell.nib(), forCellReuseIdentifier: CarsTableViewCell.identifier)
        viewModel.getCarService()
    }
    
    private func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension CarsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.identifier, for: indexPath) as? CarsTableViewCell else {
            return UITableViewCell()
        }
        
        do {
            let car = try viewModel.getCars(indexPath.row)
            cell.setupCell(with: car)
        } catch {
            alert(title: "Opa!", message: error.localizedDescription)
        }
        
        return cell
    }
}

extension CarsViewController: CarsViewProtocol {
    func didGetData() {
        tableView.reloadData()
    }
}
