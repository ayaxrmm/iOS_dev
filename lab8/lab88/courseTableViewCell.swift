//
//  courseTableViewCell.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//

import UIKit

class courseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 8
        iconImageView.clipsToBounds = true
    }
    
    
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        if let image = UIImage(named: item.image) {
            iconImageView.image = image
        } else {
            iconImageView.image = UIImage(systemName: "graduationcap")
        }
        
    }
    
}
