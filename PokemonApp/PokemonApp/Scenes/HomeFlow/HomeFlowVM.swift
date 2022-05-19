//
//  HomeFlowVM.swift
//  PokemonApp
//
//  Created by Salih KIR on 8.05.2022.
//

import Foundation


protocol HomeFlowVMProtocol: AnyObject {
    
}

protocol HomeFlowVMDelegate: HomeFlowVMProtocol {
    func getServiceData()
    var delegate: HomeFlowVMDelegateOutputs? { get set }
    var data: [PokemonResult] { get set }
}

protocol HomeFlowVMDelegateOutputs: AnyObject {
    func handleViewModelOutputs(_ viewModelOutputs: HomeFlowVMOutputs )
    func reloadTableView()
}

enum HomeFlowVMOutputs {
    case Succes([PokemonResult])
    case error(String)
}


class HomeFlowVM: HomeFlowVMDelegate {
    var data: [PokemonResult] = []
    var delegate: HomeFlowVMDelegateOutputs?
    var nextPage: String = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"
    var network: Network = Api()
    var serviceIsCalled: Bool = false
    
    
    func getServiceData() {
        if serviceIsCalled {
            return
        }
        serviceIsCalled = true
        
        network.getDownloadPokemon(url: nextPage) {[weak self] (response, err) in
            guard let self = self else{return}
            if let response = response {
                self.data = response.results
                self.delegate?.handleViewModelOutputs(.Succes(response.results))
                self.delegate?.reloadTableView()
            }
        }
    }
    
    private func handleViewModelOutputs(_ type: HomeFlowVMOutputs) {
           self.delegate?.handleViewModelOutputs(type)
       }
    
}
