//
//  ColorViewController.swift
//  BullingtongColorNav
//
//  Created by Graeson Bullington on 4/5/19.
//  Copyright © 2019 Graeson Bullington. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //var colors = ["red", "orange", "yellow", "green", "blue", "purple", "brown"]
    
    
   
    
    var colors = [Colors(name: "red", uiColor: UIColor.red),
                  Colors(name: "orange", uiColor: UIColor.orange),
                  Colors(name: "yellow", uiColor: UIColor.yellow),
                  Colors(name: "green", uiColor: UIColor.green),
                  Colors(name: "blue", uiColor: UIColor.blue),
                  Colors(name: "purple", uiColor: UIColor.purple),
                  Colors(name: "brown", uiColor: UIColor.brown)
    ]
    
    
    @IBOutlet weak var colorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        cell.textLabel?.text = colors[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row].uiColor
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
            let row = colorTableView.indexPathForSelectedRow?.row {
            destination.color = colors[row]
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
