//
//  HeroService.swift
//  lab9
//
//  Created by Aya on 02.12.2025.
//

import Foundation

protocol HeroServiceDelegate: AnyObject {
    func onHeroDidUpdate(model: HeroModel, imageData: Data)
}

struct HeroService{
    var delegate: HeroServiceDelegate?
    
    func fetchHero(randomId: Int){
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                print("Network error: \(error)")
                return
            }
            guard let data = data else {return}
            do {
                let model = try JSONDecoder().decode(HeroModel.self, from: data)
                
                guard let imageUrl = URL(string: model.images.md) else {return}
                let imageData = try Data(contentsOf: imageUrl)
                
                DispatchQueue.main.async {
                    self.delegate?.onHeroDidUpdate(model: model, imageData: imageData)
                }
            } catch {
                print("parsing error: \(error)")
            }
        }.resume()
        
    }
}
