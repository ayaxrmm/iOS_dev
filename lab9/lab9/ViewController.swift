//
//  ViewController.swift
//  lab9
//
//  Created by Aya on 02.12.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    var service = HeroService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
        fetchRandomHero()
    }
    
    
    @IBAction func randomizeButtonTapped(_ sender: UIButton) {
        fetchRandomHero()
    }
    
    func fetchRandomHero() {
        let randomId = Int.random(in: 1...731)
        service.fetchHero(randomId: randomId)
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel, imageData: Data) {
        nameLabel.text = model.name
        fullNameLabel.text = model.biography.fullName ?? "Unknown"
        intelligenceLabel.text = "\(model.powerstats.intelligence ?? 0)"
        strengthLabel.text = "\(model.powerstats.strength ?? 0)"
        speedLabel.text = "\(model.powerstats.speed ?? 0)"
        powerLabel.text = "\(model.powerstats.power ?? 0)"
        raceLabel.text = model.appearance.race ?? "Unknown"
        occupationLabel.text = model.work.occupation ?? "Unknown"
        placeOfBirthLabel.text = model.biography.placeOfBirth ?? "Unknown"
        publisherLabel.text = model.biography.publisher ?? "Unknown"
        heroImageView.image = UIImage(data: imageData)
    }
}
