//
//  ViewController.swift
//  FoodTrackerCoreData
//
//  Created by Huy on 3/30/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seachBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var datasource = Datasource()
    var delegate = Delegate()
    var bool: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = datasource
        tableView.delegate = delegate
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailVC {
            if (segue.identifier ?? "") == "edit" {
                if let index = tableView.indexPathForSelectedRow{
                    detailViewController.nameData = Dataservice.shared.array[index.row].name
                    detailViewController.imageData = Dataservice.shared.array[index.row].image as? UIImage
                    bool = true
                }
            }
            else{
                bool = false
            }
        }
    }
   
    
    @IBAction func un(sender: UIStoryboardSegue){
        let sender = sender.source as? DetailVC

        let entity = Entity(context: AppDelegate.context)
       if bool == false{

        if let dataString = sender?.txtName.text {
            entity.name = dataString
            entity.image = sender?.imageView.image
            datasource.arr.append(entity)
            AppDelegate.saveContext()
            tableView.reloadData()
            }

        }
        else{
        if let index = tableView.indexPathForSelectedRow{
            Dataservice.shared.array[index.row].name = sender?.nameData
            Dataservice.shared.array[index.row].image = sender?.imageData
            AppDelegate.saveContext()
            tableView.reloadData()

        }}

    }

}

