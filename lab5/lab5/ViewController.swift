//
//  ViewController.swift
//  lab5
//

import UIKit

struct jewelryItem{
    let imageName: String
    let title: String
    let description: String
}

class ViewController: UIViewController {

    @IBOutlet weak var ImageView1: UIImageView!
    
    @IBOutlet weak var NameView1: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    
    private var items: [jewelryItem] = []
    private var lastIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupJewelryItems()
        showRandomJewelry()
        styleUI()
    }
        
    private func setupJewelryItems() {
        items = [
            jewelryItem(imageName: "jw1", title: "Swan pendant", description: " With exquisite beauty in every detail, this meaningful pendant celebrates the graceful qualities of the iconic Swarovski swan. Suspended from a delicate chain, the central motif is adorned in clear Swarovski Zirconia and features a single pear cut that hangs from a pavé hoop of Swarovski Crystal Pearls. Wear it alongside the matching earrings for a look of pure sophistication." ),
            jewelryItem(imageName: "jw2", title: "Swan necklace", description: "Shine brightly this season in this romantic rose gold-plated pendant. The legendary swan motif takes center stage, crafted with a full-cut crystal body in cool millennial pink and crisp clear pavé lines. A stunning and romantic creation, which is unmistakably Swarovski, it will blend easily into your existing collection. Layer with other styles in similar platings for an on-trend aesthetic. Matching items are available."),
            jewelryItem(imageName: "jw3", title: "Swan bracelet", description: "Opt for subtle glamour, and touches of cool romance, with this dainty rose gold-plated bracelet. Featuring a swan motif with a full-cut crystal body in cool millennial pink and crisp clear pavé lines, it's a Swarovski design through and through. It also features our innovative magnetic closure, which will allow you to blend in strands from our Swan Collection to create a bespoke look - be it double-wrap bracelet, necklace, or choker. Perfect for versatile styling, it will take pride of place in your collection. Matching items are available."),
            jewelryItem(imageName: "jw4", title: "Matrix 3-link watch", description: "nspired by Swarovski’s Matrix jewelry, this 30mm timepiece captures the same sense of contemporary and expressive styling. The design in stainless steel and rose gold-tone finishing features a pavé bezel set with 42 crystals. The beautifully round dial is given a glitter effect and includes slender hour markers and hands, as well as a swan logo at 12 o’clock. Along with an additional crystal set within the crown, this watch is notable for its three-link bracelet, which glides elegantly around the wrist. The Swiss Made timepiece is water resistant to 50m and is the perfect companion for any occasion."),
            jewelryItem(imageName: "jw5", title: "Stilla Attract stud earrings", description: "Shine all day long with this delicate pair of stud earrings, each featuring a blue Swarovski Zirconia in rhodium plating. A perfect gift, they shimmer with timeless elegance. Mix and match with other Swarovski jewelry pieces to express your unique style."),
            jewelryItem(imageName: "jw6", title: "Dextera octagon watch", description: "ЭInspired by the timeless elegance of the Dextera family, this 18 x 23 mm watch is uniquely crafted in Swarovski’s iconic octagon shape. Made in stainless steel with a rose gold-tone finish, the design features a pavé bezel set with 46 crystals, and an additional crystal set within the crown. The sunray dial also includes delicate crystal indexes, along with slender hands and a swan logo at 12 o’clock. To complete this radiant creation, the five-link bracelet is adorned with 108 round-cut crystals, giving you endless shimmer at every hour. This Swiss Made watch is water resistant to 50 metres."),
            jewelryItem(imageName: "jw7", title: "Dextera bangle watch", description: "ИThis light-catching Dextera bangle watch is crafted in Swarovski’s renowned octagon shape. The 12.4 x 20.8 mm case features a rose gold-tone finish and is adorned with a pavé of 92 pink crystals on the bezel. This provides a perfect frame for the pink sunray dial, which includes a swan logo at 12 o’clock and three crystallised index markers. Along with a single crystal set in the crown, the watch is also brought to life by a gradient of 197 pink crystals set along the adjustable bracelet, providing exceptional beauty at every hour. This Swiss Made watch is water resistant to 50m and combines joyful extravagance with signature Swarovski savoir-faire."),
            jewelryItem(imageName: "jw8", title: "Ariana Grande x Swarovski choker", description: "This radiant choker was made for an intense expression of love. The rhodium plated design is partly decorated with luxurious Swarovski Crystal Pearls, while at the front, there is a row of heart-shaped crystals, each surrounded by a glittering halo of clear pavé. A sliding closure at the back means you can adjust the jewelry to your perfect fit. Pair this bold necklace with other matching jewelry to create your own romantic combinations."),
            jewelryItem(imageName: "jw9", title: "Swan bracelet", description: "Opt for subtle glamour, and touches of cool romance, with this dainty rose gold-plated bracelet. Featuring a swan motif with a full-cut crystal body in cool millennial pink and crisp clear pavé lines, it's a Swarovski design through and through. It also features our innovative magnetic closure, which will allow you to blend in strands from our Swan Collection to create a bespoke look - be it double-wrap bracelet, necklace, or choker. Perfect for versatile styling, it will take pride of place in your collection. Matching items are available.")
        ]
    }
    private func styleUI() {
        ImageView1.layer.cornerRadius = 20
        ImageView1.clipsToBounds = true
        NameView1.textAlignment = .center
        DescriptionLabel.textAlignment = .center
        DescriptionLabel.numberOfLines = 0
        DescriptionLabel.lineBreakMode = .byWordWrapping
    }
    
    
    @IBAction func RandomButtonTapped(_ sender: UIButton) {
        showRandomJewelry()
    }
    
    
    private func showRandomJewelry() {
        guard let item = items.randomElement() else { return }

        UIView.transition(with: ImageView1, duration: 0.4, options: .transitionCrossDissolve, animations: {
            self.ImageView1.image = UIImage(named: item.imageName)
        })

        UIView.transition(with: NameView1, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.NameView1.text = item.title
        })

        UIView.transition(with: DescriptionLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.DescriptionLabel.text = item.description
        })
    }
}

