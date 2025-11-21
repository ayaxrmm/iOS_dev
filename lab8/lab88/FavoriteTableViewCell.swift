//
//  FavoriteTableViewCell.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var item: FavoriteItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        iconImageView.layer.cornerRadius = 8
        iconImageView.clipsToBounds = true
    }
    
    
    @IBAction func detailButtonTapped(_ sender: UIButton) {
        if let controller = self.findViewController() as? MoviesViewController {
            controller.performSegue(withIdentifier: "showMoviesDetail", sender: item)
        }
    }
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            responder = nextResponder
        }
        return nil
    }
    
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        self.item = item
        
        if let image = UIImage(named: item.image) {
            iconImageView.image = image
        } else {
            iconImageView.image = UIImage(systemName: "film")
        }
    }
}
