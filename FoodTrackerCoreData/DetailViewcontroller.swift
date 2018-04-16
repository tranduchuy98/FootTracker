//
//  DetailViewcontroller.swift
//  FoodTrackerCoreData
//
//  Created by Huy on 3/30/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit
import CoreData

class DetailVC: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTxt: UILabel!
    
    
    var imageData: UIImage?
    var nameData: String?

    var datasource = Datasource()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageData
        txtName.text = nameData
    }
    @IBAction func tapPickPhoto(_ sender: UITapGestureRecognizer) {
        txtName.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
        labelTxt.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        imageData = imageView.image
        nameData = txtName.text
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // labelTxt.text = "Tap Select Image"
        imageView.layer.cornerRadius = 150
        imageView.layer.masksToBounds = true
        if nameData != nil {
            labelTxt.text = ""
            
        }
        
    }
    
}



