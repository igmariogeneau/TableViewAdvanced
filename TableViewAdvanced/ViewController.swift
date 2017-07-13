//
//  ViewController.swift
//  TableViewAdvanced
//
//  Created by eleves on 17-07-13.
//  Copyright © 2017 eleves. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var tableView: UITableView!
    var images: [String] = []
    let aDict = [
        "SECTION 1" : ["img1.png", "img2.png"],
        "SECTION 2" : ["img3.png", "img4.png"],
        "SECTION 3" : ["img5.png"]]
    var sections: [String] = []
    var buttonNames: [String] = []
    var counter = 0
    
    func parseDict() {
        let d = aDict.sorted { $0.0 < $1.0}
        
        for (key, value) in d {
            let a = "\(key)"
            sections.append(key)
            for index in 0..<value.count {
                let b = "BOUTON \(index + 1)"
                buttonNames.append("\(a) - \(b)")
                images.append(value[index])
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        parseDict()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //---------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        return aDict.count
    }

    //---------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundColor = UIColor.clear
        return aDict[sections[section]]!.count
    }
    //---------------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if counter == images.count {
            counter = 0
        }
        
        let cell:CellClass = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CellClass
        cell.textLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.clear
        
        if let aLabel = cell.viewWithTag(200) as? UILabel {
            aLabel.text = "This is cell \(counter)"
        }
        
        if let anImageView = cell.viewWithTag(100) as? UIImageView {
            let anImage = UIImage(named: images[counter])
            anImageView.image = anImage
        }
        
        if let aButton = cell.viewWithTag(300) as? UIButton {
            aButton.setTitle(buttonNames[counter], for: .normal)
        }
        
        counter += 1
        
        return cell
    }
    //---------------------
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath as IndexPath)!
        selectedCell.contentView.backgroundColor = UIColor.darkGray
    }
    //---------------------
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    //---------------------
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < sections.count {
            return sections[section]
        }
        return nil
    }
    //---------------------
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            let title = UILabel()
            title.font = UIFont(name: "Chalkduster", size: 20)
            title.textColor = UIColor.white
            let header = view as! UITableViewHeaderFooterView
            header.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            header.textLabel?.font = title.font
            header.textLabel?.textColor = title.textColor
    }

}












