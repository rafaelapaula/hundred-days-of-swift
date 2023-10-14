//
//  ViewController.swift
//  030_Project6b
//
//  Created by rafaela.lourenco on 14/10/23.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var label1 = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.red
    label.text = "THESE"
    label.sizeToFit()
    return label
  }()
  
  lazy var label2 = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.cyan
    label.text = "ARE"
    label.sizeToFit()
    return label
  }()
  
  lazy var label3 = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.yellow
    label.text = "SOME"
    label.sizeToFit()
    return label
  }()
  
  lazy var label4 = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.green
    label.text = "AWESOME"
    label.sizeToFit()
    return label
  }()
  
  lazy var label5 = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = UIColor.orange
    label.text = "LABELS"
    label.sizeToFit()
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    addViews()
    addConstraints()
  }
  
  func addViews() {
    view.addSubview(label1)
    view.addSubview(label2)
    view.addSubview(label3)
    view.addSubview(label4)
    view.addSubview(label5)
  }
  
  func addConstraints() {
    let viewsDictionary = [
      "label1": label1,
      "label2": label2,
      "label3": label3,
      "label4": label4,
      "label5": label5
    ]
    
    for label in viewsDictionary.keys {
      let constraint = NSLayoutConstraint.constraints(
        withVisualFormat: "H:|[\(label)]|",
        options: [],
        metrics: nil,
        views: viewsDictionary
      )
      view.addConstraints(constraint)
    }
    
    view.addConstraints(
      NSLayoutConstraint.constraints(
        withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]",
        options: [],
        metrics: nil,
        views: viewsDictionary
      )
    )
  }
}

