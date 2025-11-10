//
//  courseTableViewCell.swift
//  lab_work7
//
//  Created by Aya on 10.11.2025.
//

import UIKit


class CourseTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(course: TableItem) {
        if(course.category != Category.course){
            return
        }
        titleLabel.text = course.title
        subtitleLabel.text = course.subtitle
        reviewLabel.text = course.review
        iconImageView.image = course.image
    }
    
}
