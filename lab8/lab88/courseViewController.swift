//
//  courseViewController.swift
//  lab88
//
//  Created by Aya on 21.11.2025.
//

import UIKit

class CourseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let courses: [FavoriteItem] = [
        FavoriteItem(
            title: "Web Development",
            image: "laptopcomputer",
            subtitle: "Teacher: Izbassar A.",
            review: "Very interesting classes. We learnt front-end and back-end creation, blending HTML, CSS, JavaScript, and server technologies to teach how dynamic, responsive websites come to life from scratch.",
            category: .course
        ),
        FavoriteItem(
            title: "Calculus 1",
            image: "function",
            subtitle: "teacher: Askarbekkyzy A.",
            review: "Сложный, но фундаментальный курс, который формирует базу.",
            category: .course
        ),
        FavoriteItem(
            title: "iOS - dev",
            image: "checkerboard",
            subtitle: "Teacher: Myrzakanurov A.",
            review: "Choose this decipline, beacouse I want to be a iOS developer. On this course we will learn how to build mobile apps using Storyboards.",
            category: .course
        ),
        FavoriteItem(
            title: "Computer Architecture",
            image: "book",
            subtitle: "Teacher: Yoldash S.",
            review: "Помогает лучше писать академические тексты и работать с источниками.",
            category: .course
        ),
        FavoriteItem(
            title: "Software Engineering",
            image: "list.bullet.rectangle",
            subtitle: "KBTU · CS",
            review: "This decipline about a structured study of building reliable, scalable systems, focusing on design patterns. And we learn how important to plan all steps of a project by using use-case, class and other diagrams.",
            category: .course
        )
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Course"
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourseDetail",
           let detailVC = segue.destination as? courseDetailViewController,
           let item = sender as? FavoriteItem {
            detailVC.item = item
        }
    }
    
    
}

extension CourseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as! courseTableViewCell
        cell.configure(with: courses[indexPath.row])
        return cell
    }
}


extension CourseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let item = courses[indexPath.row]
        performSegue(withIdentifier: "showCourseDetail", sender: item)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
