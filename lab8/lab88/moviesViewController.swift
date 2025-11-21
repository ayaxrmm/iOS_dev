//
//  moviesViewController.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//

import UIKit

class MoviesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let movies: [FavoriteItem] = [
        FavoriteItem(title: "Divergent", image: "divergent", subtitle: "Neil Burger · 2014", review: "ОMy fav movie. One of the most emotional and inspiring sci-fi films that leaves a mark. I rewatch this movie each year.", category: .movie),
        FavoriteItem(title: "La La Land", image: "lalaland", subtitle: "Damien Chazelle · 2016", review: "American musical romantic comedy-drama film. Very cozy movie for me. I like watching such films with my friend and having an interesting time", category: .movie),
        FavoriteItem(title: "Big Mouth", image: "bigmouth", subtitle: "Jung Kyung-soon · 2022", review: "I really like watching k-dramas like this.This is a thriller about an unsuccessful lawyer who gets involved in a murder case and is somehow fingered as genius swindler Big Mouse.", category: .movie),
        FavoriteItem(title: "Avatar", image: "budapest", subtitle: "by James Cameron · 2014", review: "On Pandora, a green moon, a wounded Marine has to pick between what he's told to do and a different life.  Remember how I watch this on cinema with my friends, left incredible emotions.", category: .movie),
        FavoriteItem(title: "Money Heist", image: "movie5", subtitle: "Kim Hong-sun · 2022", review: "Korean version of Spanish series. I liked k version more than Spanish. A genius strategist and people with different personalities engaging in an unprecedented hostage play.", category: .movie)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMoviesDetail",
           let detailVC = segue.destination as? moviesDetailViewController,
           let item = sender as? FavoriteItem {
            detailVC.item = item
        }
    }
    
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let item = movies[indexPath.row]
        performSegue(withIdentifier: "showMoviesDetail", sender: item)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}


