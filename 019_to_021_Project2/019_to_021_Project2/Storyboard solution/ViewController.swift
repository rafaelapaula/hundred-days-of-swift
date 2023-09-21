//
//  ViewController.swift
//  019_to_021_Project2
//
//  Created by rafaela.lourenco on 21/09/23.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var button1: UIButton!
  @IBOutlet weak var button2: UIButton!
  @IBOutlet weak var button3: UIButton!
  
  var countries = [String]()
  var score = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadImages()
  }
  
  func loadImages() {
    countries.append("estonia")
    countries.append("france")
    countries.append("germany")
    countries.append("ireland")
    countries.append("italy")
    countries.append("monaco")
    countries.append("nigeria")
    countries.append("poland")
    countries.append("russia")
    countries.append("spain")
    countries.append("uk")
    countries.append("us")
    
    // countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    /*
     One of the many powerful things about views in iOS is that they are backed by what's called a CALayer, which is a Core Animation data type responsible for managing the way your view looks.
     
     Conceptually, CALayer sits beneath all your UIViews (that's the parent of UIButton, UITableView, and so on), so it's like an exposed underbelly giving you lots of options for modifying the appearance of views, as long as you don't mind dealing with a little more complexity. We're going to use one of these appearance options now: borderWidth.
     */
    
    button1.layer.borderWidth = 1
    button2.layer.borderWidth = 1
    button3.layer.borderWidth = 1
    
    /*
     By default, the border of CALayer is black, but you can change that if you want by using the UIColor data type. I said that CALayer brings with it a little more complexity, and here's where it starts to be visible: CALayer sits at a lower technical level than UIButton, which means it doesn't understand what a UIColor is. UIButton knows what a UIColor is because they are both at the same technical level, but CALayer is below UIButton, so UIColor is a mystery.
     
     Don't despair, though: CALayer has its own way of setting colors called CGColor, which comes from Apple's Core Graphics framework. This, like CALayer, is at a lower level than UIButton, so the two can talk happily – again, as long as you're happy with the extra complexity.
     
     Even better, UIColor (which sits above CGColor) is able to convert to and from CGColor easily, which means you don't need to worry about the complexity – hurray!
     */
    
    button1.layer.borderColor = UIColor.lightGray.cgColor
    button2.layer.borderColor = UIColor(red: 0.4, green: 0.6, blue: 0.0, alpha: 0.5).cgColor
    button3.layer.borderColor = UIColor.lightGray.cgColor
    
    askQuestion()

  }

  func askQuestion() {
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
  }

}

