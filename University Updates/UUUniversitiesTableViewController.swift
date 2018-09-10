//
//  ViewController.swift
//  University Updates
//
//  Created by Vasu Yarasu on 05/09/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class UUUniversitiesTableViewController: UITableViewController {
    
    var xvalue = 8
    var yvalue = 8
    let cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        createDoneAction()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return universities.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = tableView.frame
        
        let closeButton = UIButton()
        closeButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
        closeButton.frame = CGRect(x: frame.size.width - 36, y: 10, width: 20, height: 20)
        closeButton.addTarget(self, action: #selector(headerCloseExpand(button:)), for: .touchUpInside)
        closeButton.tag = section
        
        let headerLbl = UILabel(frame: CGRect(x: 8, y: 10, width: 250, height: 30))
        headerLbl.text = universities[section].name
        headerLbl.textColor = .lightGray
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        headerView.backgroundColor = .white
        headerView.addSubview(closeButton)
        headerView.addSubview(headerLbl)
        return headerView
    }
    
    @objc func headerCloseExpand(button: UIButton){
        
        let section = button.tag
        var indexPaths = [IndexPath]()
        
        for row in universities[section].course.indices{
            
            let indexpath = IndexPath(row: row, section: section)
            indexPaths.append(indexpath)
        }
        
        
        let isExpanded = universities[section].expanded
        universities[section].expanded = !isExpanded
        
            button.setImage(isExpanded ? #imageLiteral(resourceName: "up") : #imageLiteral(resourceName: "down"), for: .normal)
        
        
        if !isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        
            
        }else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if universities[section].expanded{
            return 0
        }
        return universities[section].course.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = universities[indexPath.section].course[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(red: 237/255, green: 239/255, blue: 255/255, alpha: 1.0)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return universities[section].name
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func createDoneAction(){
        
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        doneButton.setTitle("DONE", for: .normal)
        doneButton.setTitleColor(UIColor.white, for: .normal)
        doneButton.backgroundColor = UIColor(red: 0/255, green: 190/255, blue: 0/255, alpha: 1.0)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        doneButton.layer.cornerRadius = doneButton.frame.size.height/2
        doneButton.layer.masksToBounds = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: doneButton)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

