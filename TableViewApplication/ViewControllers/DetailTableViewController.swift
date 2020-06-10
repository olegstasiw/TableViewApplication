//
//  DetailTableViewController.swift
//  TableViewApplication
//
//  Created by mac on 10.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit


class DetailTableViewController: UITableViewController {
    
    
    private var contacts = Contacts.contact
    private var tableWithSelections = [TableSections]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<contacts.person.count{
            tableWithSelections.append(TableSections(
                title: "\(contacts.person[i].name) \(contacts.person[i].surname)",
                detailInfo: ["\(contacts.person[i].number)", "\(contacts.person[i].email)"]
                )
            )
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableWithSelections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableWithSelections[section].detailInfo?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactDetail", for: indexPath)
        cell.textLabel?.text = tableWithSelections[indexPath.section].detailInfo?[indexPath.row]
        cell.textLabel?.font = UIFont(name: "American Typewriter", size: 18)
        if tableWithSelections[indexPath.section].detailInfo?[indexPath.row]
            == contacts.person[indexPath.section].number {
            cell.imageView?.image = UIImage(systemName: "phone")
        } else {
            cell.imageView?.image = UIImage(systemName: "folder")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableWithSelections[section].title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: tableView.frame.width,
                                        height: 40))
        view.backgroundColor  = UIColor(red: 118/255,
                                        green: 177/255,
                                        blue: 177/255,
                                        alpha: 1)
        let txt = UILabel(frame: CGRect(x: 15,
                                         y: 0,
                                         width: view.frame.width - 15,
                                         height: 40))
        txt.text = tableWithSelections[section].title
        txt.font = UIFont(name: "American Typewriter", size: 24)
        view.addSubview(txt)
        return view
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
