//
//  ViewController.swift
//  048_to_049_Project12
//
//  Created by Rafaela Lourenço de Paula on 04/03/24.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let defaults = UserDefaults.standard
    
    defaults.set(25, forKey: "Age")
    defaults.set(true, forKey: "UseFaceID")
    defaults.set(CGFloat.pi, forKey: "Pi")
    
    defaults.set("Paul Hudson", forKey: "Name")
    defaults.set(Date(), forKey: "LastRun")
    
    let array = ["Hello", "World"]
    defaults.set(array, forKey: "SavedAray")
    
    let dict = ["Name": "Paul", "Country": "UK"]
    defaults.set(array, forKey: "SavedDict")
    
    let savedBoolean = defaults.bool(forKey: "UseFaceID")
    let savedInteger = defaults.integer(forKey: "Age")

    
    let savedArray = defaults.object(forKey: "SavedAray") as? [String] ?? [String]()
    let savedDict = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()

  }


}

