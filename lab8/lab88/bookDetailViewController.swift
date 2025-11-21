//
//  bookDetailViewController.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//
import UIKit

class bookDetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    var item: FavoriteItem?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        if let item = item {
              title = item.title
              subtitleLabel.text = item.subtitle
              reviewLabel.text = item.review

              if let img = UIImage(named: item.image) {
                  detailImageView.image = img
              } else {
                  detailImageView.image = UIImage(systemName: "book")
              }
          }
    }
    
}
