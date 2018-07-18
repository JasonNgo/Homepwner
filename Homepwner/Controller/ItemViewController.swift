//
//  ViewController.swift
//  Homepwner
//
//  Created by Jason Ngo on 2018-07-17.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class ItemViewController: UITableViewController {

    var itemStore: ItemStore!
    
    let tableSectionHeight: CGFloat = 25
    
    enum TableSection: Int {
        case over50 = 0, under50, total
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.total.rawValue
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let tableSection = TableSection(rawValue: section) {
            if tableSection == .over50 {
                return itemStore.itemsOver50.count
            } else {
                return itemStore.itemsUnder50.count + 1
            }
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableSectionHeight
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = CGFloat()
        
        // default value
        height = 60
        
        if let tableSection = TableSection(rawValue: indexPath.section) {
            if tableSection == .under50, indexPath.row == itemStore.itemsUnder50.count {
                height = 44
            }
        }
        
        return height
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableSectionHeight))
        view.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: tableSectionHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        if let tableSection = TableSection(rawValue: section) {
            switch tableSection {
            case .over50:
                label.text = "Over 50"
            case .under50:
                label.text = "Under 50"
            default:
                label.text = ""
            }
        }
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        if let tableSection = TableSection(rawValue: indexPath.section) {
            if tableSection == .over50 {
                let over50Item = itemStore.itemsOver50[indexPath.row]
                cell.textLabel?.text = over50Item.name
                cell.detailTextLabel?.text = "\(over50Item.valueInDollars)"
                cell.textLabel?.font = UIFont.init(name: "Helvetica", size: 20)
            } else {
                if indexPath.row == itemStore.itemsUnder50.count {
                    cell.textLabel?.text = "No more items!"
                    cell.detailTextLabel?.text = "0"
                } else {
                    let under50Item = itemStore.itemsUnder50[indexPath.row]
                    cell.textLabel?.text = under50Item.name
                    cell.detailTextLabel?.text = "\(under50Item.valueInDollars)"
                    cell.textLabel?.font = UIFont.init(name: "Helvetica", size: 20)
                }
            }
        }
        
        return cell
    }
    
    
}

