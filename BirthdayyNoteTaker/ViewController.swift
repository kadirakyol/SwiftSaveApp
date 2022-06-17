//
//  ViewController.swift
//  BirthdayyNoteTaker
//
//  Created by Kadir Akyol on 17.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var birthDayTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        if let  name = nameTextField.text {
            if let birthDay = birthDayTextField.text {
                
                UserDefaults.standard.set(name, forKey: "name")
                UserDefaults.standard.set(birthDay, forKey: "birthDay")
                
                nameLabel.text = "Name : \(name)"
                birthDayLabel.text = "BirthDay : \(birthDay)"
                
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthDayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthDay = UserDefaults.standard.object(forKey: "birthDay")
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthDay = storedBirthDay as? String {
            birthDayLabel.text = "BirthDay: \(newBirthDay)"
        }
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthDay = UserDefaults.standard.object(forKey: "birthDay")
        
        if let newName = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (storedBirthDay as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthDay")
            birthDayLabel.text = "BirthDay: "
        }
        
    }
    
}

