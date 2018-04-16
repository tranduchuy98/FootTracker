//
//  DetailViewcontroller.swift
//  FoodTrackerCoreData
//
//  Created by Huy on 3/30/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class Datasource: NSObject , UITableViewDataSource {
    var arr: [Entity] = Dataservice.shared.array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.iamgeView.image = arr[indexPath.row].image as? UIImage
        cell.labelTxt.text = arr[indexPath.row].name

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        Dataservice.shared.removeData(IndexPath: indexPath)
            arr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

