//
//  HomeFlowTableViewCell.swift
//  PokemonApp
//
//  Created by Salih KIR on 8.05.2022.
//

import UIKit

class HomeFlowTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setLabel() {
        
    }
}

extension HomeFlowTableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
