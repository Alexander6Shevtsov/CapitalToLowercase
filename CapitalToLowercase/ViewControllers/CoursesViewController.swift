//
//  CoursesViewController.swift
//  CapitalToLowercase
//
//  Created by Alexander Shevtsov on 08.11.2024.
//

import UIKit

final class CoursesViewController: UITableViewController {
    
    private var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchCourses()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseCell
        
        let course = courses[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
}

// MARK: - Networking
extension CoursesViewController {
    private func fetchCourses() {
        guard let url = URL(string: "https://i.pinimg.com/564x/40/10/c4/4010c4d5838f0fc1ab1c662d11eb5505.jpg") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return}
            
            do {
                let decoder = JSONDecoder()
                self.courses = try decoder.decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
