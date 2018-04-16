//
//  Datasevirce.swift
//  FoodTrackerCoreData
//
//  Created by Huy on 3/30/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit
import CoreData
class Dataservice {
    static let shared: Dataservice = Dataservice()
    private var _array: [Entity]?
    
    var array: [Entity] {
        set {
            _array = newValue
        }
        get{
            if _array == nil {
                getData()
            }
            return _array ?? []
            
        }
    }
    
    func getData(){
//          _array = []
            _array =  try? AppDelegate.context.fetch(Entity.fetchRequest())
    }
    func removeData(IndexPath: IndexPath) {
        AppDelegate.context.delete(_array![IndexPath.row])
        _array?.remove(at: IndexPath.row)
    }
    
}
