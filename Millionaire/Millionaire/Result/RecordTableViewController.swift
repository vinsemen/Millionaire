//
//  RecordTableViewController.swift
//  Millionaire
//
//  Created by Семён Винников on 20.02.2023.
//

import UIKit

class RecordTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.results.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordCell1", for: indexPath)
        let record = Game.shared.results[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        cell.textLabel?.text = dateFormatter.string(from: record.started)
        cell.detailTextLabel?.text = "Score: \(record.score) / \(QuestionData.loadQuestions().count)"
        return cell
    }

}
