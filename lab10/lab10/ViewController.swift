//
//  ViewController.swift
//  lab10
//
//  Created by Aya on 09.12.2025.
//
import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    
    var heroService = HeroService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroService.delegate = self
        setupInitialHeroIfNeeded()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")

        coverImage.layer.cornerRadius = 16
        coverImage.clipsToBounds = true
        
        nameLabel.layer.shadowRadius = 3
        nameLabel.layer.shadowOpacity = 0.8
        infoTextView.layer.cornerRadius = 12
    }
    
    @IBAction func themeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            overrideUserInterfaceStyle = .light
        case 1:
            overrideUserInterfaceStyle = .dark
        default:
            overrideUserInterfaceStyle = .unspecified
        }
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if previousTraitCollection?.userInterfaceStyle != traitCollection.userInterfaceStyle {
            setupUI()
        }
    }
    
    
    @IBAction private func rollDidTap() {
        heroService.fetchHero()
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel) {
        configure(model: model)
        storeLocally(model: model)
    }

    private func configure(model: HeroModel) {
        
        UIView.animate(withDuration: 0.15, animations: {
            self.coverImage.alpha = 0
            self.infoTextView.alpha = 0
            self.nameLabel.alpha = 0
            self.coverImage.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        })
        
        nameLabel.text = model.name
        coverImage.kf.setImage(with: URL(string: model.images.lg)) { _ in
                UIView.animate(withDuration: 0.4,
                               delay: 0,
                               usingSpringWithDamping: 0.85,
                               initialSpringVelocity: 0.4,
                               options: .curveEaseOut,
                               animations: {
                    
                    self.coverImage.alpha = 1
                    self.nameLabel.alpha = 1
                    self.infoTextView.alpha = 1
                    
                    self.coverImage.transform = .identity
                })
            }
        infoTextView.text = """
        Full Name: \(model.biography.fullName)
        Publisher: \(model.biography.publisher)
        Alignment: \(model.biography.alignment)

        Intelligence: \(model.powerstats.intelligence ?? 0)
        Strength: \(model.powerstats.strength ?? 0)
        Speed: \(model.powerstats.speed ?? 0)
        Durability: \(model.powerstats.durability ?? 0)
        Power: \(model.powerstats.power ?? 0)
        Combat: \(model.powerstats.combat ?? 0)

        Gender: \(model.appearance.gender ?? "unknown")
        Race: \(model.appearance.race ?? "unknown")
        Height: \(model.appearance.height.joined(separator: ", "))
        Weight: \(model.appearance.weight.joined(separator: ", "))

        Place of Birth: \(model.biography.placeOfBirth)
        """
    }


    private func storeLocally(model: HeroModel) {
//        UserDefaults.standard.set(name, forKey: "heroName")
        let heroData = try? PropertyListEncoder().encode(model)
        UserDefaults.standard.set(heroData, forKey: "heroData")
    }

    private func setupInitialHeroIfNeeded() {
        guard
            let heroData = UserDefaults.standard.data(forKey: "heroData"),
            let heroModel = try? PropertyListDecoder().decode(HeroModel.self, from: heroData)
        else {
            return
        }

        configure(model: heroModel)
    }
}
