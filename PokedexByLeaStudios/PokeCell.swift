//
//  PokeCell.swift
//  PokedexByLeaStudios
//
//  Created by Carolyn Lea on 8/27/16.
//  Copyright © 2016 Carolyn Lea. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell
{
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon)
    {
        self.pokemon = pokemon
        
        nameLabel.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
