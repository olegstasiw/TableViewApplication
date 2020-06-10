//
//  MainTableViewController.swift
//  TableViewApp
//
//  Created by mac on 10.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit


class MainTableViewController: UITableViewController{


   private var contacts = Person.getAllData()

    override func viewDidLoad() {
        super.viewDidLoad()
        Contacts.contact.person = contacts
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row].name) \(contacts[indexPath.row].surname)"
        cell.textLabel?.font = UIFont(name: "American Typewriter", size: 18)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let mainDetailVC = segue.destination as! MainDetailViewController
        mainDetailVC.values = contacts[indexPath.row]
    }
}
