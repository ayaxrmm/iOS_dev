//
//  bookViewController.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//

import UIKit

class BookViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let books: [FavoriteItem] = [
        FavoriteItem(
            title: "The Little Prince",
            image: "littleprince",
            subtitle: "Antoine de Saint-Exupéry",
            review: "An incredibly wise and kind book that you can read at any age.",
            category: .book
        ),
        FavoriteItem(
            title: "1984",
            image: "1984",
            subtitle: "George Orwell",
            review: "Interesting book for me. A chilling exploration of totalitarian control and the suppression of individuality, where Orwell exposes the fragility of truth and the terrifying power of surveillance woven into everyday life.",
            category: .book
        ),
        FavoriteItem(
            title: "Norwegian Wood",
            image:"norwegianwood",
            subtitle: "Haruki Murakami",
            review: "Read this book in this summer. A very atmospheric and emotional story about growing up and love.",
            category: .book
        ),
        FavoriteItem(
            title: "Sapiens",
            image: "sapiens",
            subtitle: "Yuval Noah Harari",
            review: "Maybe, I'll read this again. Human history in simple terms. Very broadening of horizons.",
            category: .book
        ),
        FavoriteItem(
            title: "The Fault in Our Stars",
            image:"fault",
            subtitle: "John Green",
            review: "I like books such FAult, because easy to read and a touching story with deep emotions.",
            category: .book
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Book"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookDetail",
           let detailVC = segue.destination as? bookDetailViewController,
           let item = sender as? FavoriteItem {
            detailVC.item = item
        }
    }
    
}

extension BookViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        cell.configure(with: books[indexPath.row])
        return cell
    }
}


extension BookViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let item = books[indexPath.row]
        performSegue(withIdentifier: "showBookDetail", sender: item)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
