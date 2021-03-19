//
//  ViewController.swift
//  TableSimpleExample
//
//  Created by Mike I on 19.03.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
       let cellReuseIdentifier = "cell"
       var tableView = UITableView()
    var refreshControl = UIRefreshControl()
    let addview = AddViewController()
    var footbolistiDictionary = [String: [String]]()
    var footbolistSectionTitles = [String]()
    var footbolisti:[String] = ["Ronaldo","Messi","Mbappe","Reus","Pogba","Ibragimovich","Salah","Firmino","Felix"]
       override func viewDidLoad() {
           super.viewDidLoad()
        updateTable(footbolshiki: footbolisti)
           // 2
           
           title="FOOTBALLERS"
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "edit", style: .done, target: self, action: #selector(editField))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addField))
            let  barHeight:CGFloat=UIApplication.shared.statusBarFrame.size.height
           let displayWidth: CGFloat = self.view.frame.width
           let displayHeight: CGFloat = self.view.frame.height
        
           tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
           view.addSubview(tableView)
           self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
           tableView.delegate = self
           tableView.dataSource = self
        
        refreshControl.addTarget(self, action:  #selector(refresh), for: .valueChanged)
        tableView.refreshControl=refreshControl
        
       }
    func updateTable(footbolshiki: [String]){
        for footbolshiki in footbolshiki {
               let footballKey = String(footbolshiki.prefix(1))
                   if var footballValues = footbolistiDictionary[footballKey] {
                    if !footballValues.contains(footbolshiki){
                        footballValues.append(footbolshiki)
                    }
                       footbolistiDictionary[footballKey] = footballValues
                   } else {
                       footbolistiDictionary[footballKey] = [footbolshiki]
                   }
           }
        footbolistSectionTitles = [String](footbolistiDictionary.keys)
        footbolistSectionTitles = footbolistSectionTitles.sorted(by: { $0 < $1 })
    }
    func deleteTable(){
        footbolistSectionTitles.removeAll()
        footbolistiDictionary.removeAll()
        
    }
    @objc func editField(){
        
            if (navigationItem.leftBarButtonItem?.title == "edit"){
            navigationItem.leftBarButtonItem?.title = "done"
                tableView.setEditing(true, animated: true)
        }
            else{
        if (navigationItem.leftBarButtonItem?.title == "done"){
        navigationItem.leftBarButtonItem?.title = "edit"
            tableView.setEditing(false, animated: false)
        }
            }
        
    }
    @objc func addField(){
        
        self.navigationController?.pushViewController(addview, animated: true)
        print(1)
    }
    @objc func refresh() {
        deleteTable()
        footbolisti.append("Fernandes")
        updateTable(footbolshiki: footbolisti)
            tableView.reloadData()
        refreshControl.endRefreshing()
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        return footbolistSectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        let carKey = footbolistSectionTitles[section]
        if let carValues = footbolistiDictionary[carKey] {
            print(carValues.count)
            return carValues.count
        }
    
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
           

              
            // Configure the cell...
            let carKey = footbolistSectionTitles[indexPath.section]
            if let carValues = footbolistiDictionary[carKey] {
                cell.textLabel?.text = carValues[indexPath.row]
            }
        
        cell.accessoryType = .disclosureIndicator
        
        
           return cell
       }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return footbolistSectionTitles[section]
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
       return footbolistSectionTitles
   }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if (navigationItem.leftBarButtonItem?.title == "done"){
                if (editingStyle == .delete) {
                  
                   
                    deleteTable()
                    footbolisti.sort()
                    footbolisti.remove(at: indexPath.row)
                   
                    updateTable(footbolshiki: footbolisti)
                    
                    
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    
            }
            
    }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
        return footbolistSectionTitles.count
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("You tapped cell number \(indexPath.row).")
       }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = footbolisti[sourceIndexPath.row]
        footbolisti.remove(at: sourceIndexPath.row)
        footbolisti.insert(itemToMove, at: destinationIndexPath.row)
    }
}

