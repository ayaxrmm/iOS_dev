//
//  ViewController.swift
//  lab_work7
//
//  Created by Aya on 10.11.2025.
//

import UIKit

enum Category : String, CaseIterable {
    case movie = "Movie"
    case music = "Music"
    case book = "Book"
    case course = "Course"
}
struct TableItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
    let category : Category
}

class ViewController: UIViewController, UITableViewDelegate {
    
    let movies: [TableItem] = [
        TableItem(title: "Divergent",
                  subtitle: " Neil Burger · 2014",
                  review: "My fav movie. One of the most emotional and inspiring sci-fi films that leaves a mark. I rewatch this movie each year.",
                  image: UIImage(named: "divergent") ?? UIImage(),
                  category: .movie),
        
        TableItem(title: "La La Land",
                  subtitle: "Damien Chazelle · 2016",
                  review: "American musical romantic comedy-drama film. Very cozy movie for me. I like watching such films with my friend and having an interesting time",
                  image: UIImage(named: "lalaland") ?? UIImage(),
                  category: .movie),
        
        TableItem(title: "Avatar",
                  subtitle: "by James Cameron",
                  review: "On Pandora, a green moon, a wounded Marine has to pick between what he's told to do and a different life.  Remember how I watch this on cinema with my friends, left incredible emotions.",
                  image: UIImage(named: "budapest") ?? UIImage(),
                  category: .movie),
        
        TableItem(title: "Big Mouth",
                  subtitle: "Jung Kyung-soon · 2022",
                  review: "I really like watching k-dramas like this.This is a thriller about an unsuccessful lawyer who gets involved in a murder case and is somehow fingered as genius swindler Big Mouse.",
                  image: UIImage(named: "bigmouth") ?? UIImage(),
                  category: .movie),
        
        TableItem(title: "Money Heist",
                  subtitle: "Kim Hong-sun · 2022",
                  review: "Korean version of Spanish series. I liked k version more than Spanish. A genius strategist and people with different personalities engaging in an unprecedented hostage play.",
                  image: UIImage(named: "movie5") ?? UIImage(),
                  category: .movie)
    ]
    
    let music: [TableItem] = [
        TableItem(title: "love song",
                  subtitle: "Rihanna",
                  review: "I love Rihanna's work and have been listening to her for a very long time, one of my favorite songs",
                  image: UIImage(named: "rihanna") ?? UIImage(),
                  category: .music),
        
        TableItem(title: "diet mountain dew",
                  subtitle: "Lana Del Rey",
                  review: "Lana's one of the best and very beauty track for me, listen to this track from 2019",
                  image: UIImage(named: "lana") ?? UIImage(),
                  category: .music),
        
        TableItem(title: "нужна",
                  subtitle: "M'dee",
                  review: "very cozy and cute music, with very interesting lyrics and story",
                  image: UIImage(named: "mdee") ?? UIImage(),
                  category: .music),
        
        TableItem(title: "diamonds",
                  subtitle: "Rihanna",
                  review: "my favorite song ever. It's so catchy and fun!",
                  image: UIImage(named: "rihanna") ?? UIImage(),
                  category: .music),
        
        TableItem(title: "senorita",
                  subtitle: "91",
                  review: "listen to it, it's so good. Also love all works of Ninety one and listen from 2019.",
                  image: UIImage(named: "91") ?? UIImage(),
                  category: .music)
    ]

    let books: [TableItem] = [
        TableItem(title: "1984",
                  subtitle: "by George Orwell",
                  review: "Interesting book for me. A chilling exploration of totalitarian control and the suppression of individuality, where Orwell exposes the fragility of truth and the terrifying power of surveillance woven into everyday life.",
                  image: UIImage(named: "1984") ?? UIImage(),
                  category: .book),
        
        TableItem(title: "The Little Prince",
                  subtitle: "Antoine de Saint-Exupéry",
                  review: "An incredibly wise and kind book that you can read at any age.",
                  image: UIImage(named: "littleprince") ?? UIImage(),
                  category: .book),
        
        TableItem(title: "Norwegian Wood",
                  subtitle: "Haruki Murakami",
                  review: "Read this book in this summer. A very atmospheric and emotional story about growing up and love.",
                  image: UIImage(named: "norwegianwood") ?? UIImage(),
                  category: .book),
        
        TableItem(title: "Sapiens",
                  subtitle: "Yuval Noah Harari",
                  review: "Maybe, I'll read this again. Human history in simple terms. Very broadening of horizons.",
                  image: UIImage(named: "sapiens") ?? UIImage(),
                  category: .book),
        
        TableItem(title: "The Fault in Our Stars",
                  subtitle: "John Green",
                  review: "I like books such FAult, because easy to read and a touching story with deep emotions.",
                  image: UIImage(named: "fault") ?? UIImage(),
                  category: .book)
    ]
    
    let courses: [TableItem] = [
        TableItem(title: "iOS Development",
                  subtitle: "Teacher: Myrzakanurov A.",
                  review: "Choose this decipline, beacouse I want to be a iOS developer. On this course we will learn how to build mobile apps using Storyboards.",
                  image: UIImage(named: "laptopcomputer") ?? UIImage(),
                  category: .course),
        
        TableItem(title: "Calculus",
                  subtitle: "Teacher: Askarbekkyzy A.",
                  review: "One of the my favorite courses. Like calculus from school.",
                  image: UIImage(named: "function") ?? UIImage(),
                  category: .course),
        
        TableItem(title: "Web Development",
                  subtitle: "Teacher: Izbassar A.",
                  review: "Very interesting classes. We learnt front-end and back-end creation, blending HTML, CSS, JavaScript, and server technologies to teach how dynamic, responsive websites come to life from scratch.",
                  image: UIImage(named: "checkerboard") ?? UIImage(),
                  category: .course),
        
        TableItem(title: "Computer Architecture",
                  subtitle: "Teacher: Yoldash S.",
                  review: "Course with very interesting syllabus, and teacher who loves tell us about a detailed look under the hood of computing machines.",
                  image: UIImage(named: "book") ?? UIImage(),
                  category: .course),
        
        TableItem(title: "Software Engineering",
                  subtitle: "Teacher: Aldamuratov Z.",
                  review: "This decipline about a structured study of building reliable, scalable systems, focusing on design patterns. And we learn how important to plan all steps of a project by using use-case, class and other diagrams.",
                  image: UIImage(named: "list.bullet.rectangle") ?? UIImage(),
                  category: .course)
    ]

    

    

    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = Category.allCases[section]
        switch currentSection {
            case .movie: return movies.count
            case .music: return music.count
            case .book: return books.count
            case .course: return courses.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let category = Category.allCases[section]
        return category.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentSection = Category.allCases[indexPath.section]
        
        switch(currentSection){
        case .movie:
            let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieTableViewCell
            let currentMovie = movies[indexPath.row]
            cell.configure(movie: currentMovie)
            return cell
        case .music:
            let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! MusicTableViewCell
            let currentAudio = music[indexPath.row]
            cell.configure(music: currentAudio)
            return cell
        case .book:
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
            let currentBook = books[indexPath.row]
            cell.configure(books: currentBook)
            return cell
        case .course:
            let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
            let currentCourse = courses[indexPath.row]
            cell.configure(course: currentCourse)
            return cell
        }
    }

}
