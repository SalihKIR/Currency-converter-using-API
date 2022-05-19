//
//  ViewController.swift
//  PokemonApp
//
//  Created by Salih KIR on 8.05.2022.
//

import UIKit

class HomeFlowVC: UIViewController {

    var viewModel: HomeFlowVM!
    var data: [PokemonResult] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel.delegate = self
        viewModel.getServiceData()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeFlowTableViewCell.nibName, forCellReuseIdentifier: HomeFlowTableViewCell.identifier)
    }
}


extension HomeFlowVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeFlowTableViewCell.identifier, for: indexPath) as! HomeFlowTableViewCell
        cell.pokemonLabel.text = self.data[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension HomeFlowVC: HomeFlowVMDelegateOutputs {
    func handleViewModelOutputs(_ viewModelOutputs: HomeFlowVMOutputs) {
        switch viewModelOutputs {
        case .Succes(let array):
            self.data = array
        case .error(let string):
            break
        }
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    
}
