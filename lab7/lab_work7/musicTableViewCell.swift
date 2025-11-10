//
//  musicTableViewCell.swift
//  lab_work7
//
//  Created by Aya on 10.11.2025.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(music: TableItem) {
        if(music.category != Category.music){
            return
        }
        titleLabel.text = music.title
        subtitleLabel.text = music.subtitle
        reviewLabel.text = music.review
        iconImageView.image = music.image
    }
    
}
