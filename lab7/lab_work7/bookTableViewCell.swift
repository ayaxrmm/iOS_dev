//
//  bookTableViewCell.swift
//  lab_work7
//
//  Created by Aya on 10.11.2025.
//
import UIKit


class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(books: TableItem) {
        if(books.category != Category.book){
            return
        }
        titleLabel.text = books.title
        subtitleLabel.text = books.subtitle
        reviewLabel.text = books.review
        iconImageView.image = books.image
    }
    
    
}
