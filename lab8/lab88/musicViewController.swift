//
//  musicViewController.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//

import UIKit

class MusicViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let music: [FavoriteItem] = [
        FavoriteItem(title: "love song", image:"rihanna", subtitle: "Rihanna", review: "I love Rihanna's work and have been listening to her for a very long time, one of my favorite songs",category: .music),
        FavoriteItem(title: "diet mountain dew", image:"lana", subtitle: "Lana Del Rey", review: "Lana's one of the best and very beauty track for me, listen to this track from 2019",category: .music),
        FavoriteItem(title: "нужна", image: "mdee", subtitle: "M'dee", review: "very cozy and cute music, with very interesting lyrics and story",category: .music),
        FavoriteItem(title: "diamonds",  image: "rihanna", subtitle: "Rihanna", review: "my favorite song ever. It's so catchy and fun!",category: .music),
        FavoriteItem(title: "senorita", image:"91", subtitle: "91", review: "listen to it, it's so good. Also love all works of Ninety one and listen from 2019.",category: .music)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMusicDetail",
           let detailVC = segue.destination as? musicDetailViewController,
           let item = sender as? FavoriteItem {
            detailVC.item = item
        }
    }

}

extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as! musicTableViewCell
        cell.configure(with: music[indexPath.row])
        return cell
    }
}

extension MusicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let item = music[indexPath.row]
        performSegue(withIdentifier: "showMusicDetail", sender: item)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

