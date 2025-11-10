//
//  movieTableViewCell.swift
//  lab_work7
//
//  Created by Aya on 10.11.2025.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
 
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(movie: TableItem) {
        if(movie.category != Category.movie){
            return
        }
        titleLabel.text = movie.title
        subtitleLabel.text = movie.subtitle
        reviewLabel.text = movie.review
        iconImageView.image = movie.image
    }
    
    
}
