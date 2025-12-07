//
//  HeroService.swift
//  lab10
//
//  Created by Aya on 09.12.2025.
//

import Foundation
import Alamofire

protocol HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel)
}

struct HeroService {

    var delegate: HeroServiceDelegate?

    func fetchHero() {
        let randomId = Int.random(in: 1...564)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        AF.request(urlString).responseDecodable(of: HeroModel.self) { response in
            switch response.result {
            case .success(let hero):
                delegate?.onHeroDidUpdate(model: hero)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
