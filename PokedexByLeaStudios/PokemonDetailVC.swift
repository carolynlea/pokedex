//
//  PokemonDetailVC.swift
//  PokedexByLeaStudios
//
//  Created by Carolyn Lea on 8/27/16.
//  Copyright © 2016 Carolyn Lea. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLable: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvoImage.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called when download is done
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        descriptionLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defenseLable.text = pokemon.defense
        attackLabel.text = pokemon.attack
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        pokedexLabel.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == ""
        {
            evoLabel.text = "No Evolutions"
            nextEvoImage.hidden = true
        }
        else
        {
            nextEvoImage.hidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
            
            if pokemon.nextEvolutionLevel != ""
            {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
        }
    }
    
    @IBAction func backButtonTapped(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
