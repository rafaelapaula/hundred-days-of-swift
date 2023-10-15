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
//    addConstraints_ViewWithFormat()
    addConstraints_Anchors()
  }
  
  func addViews() {
    view.addSubview(label1)
    view.addSubview(label2)
    view.addSubview(label3)
    view.addSubview(label4)
    view.addSubview(label5)
  }
  
  func addConstraints_Anchors() {
    var previous: UILabel?
    
    for label in [label1, label2, label3, label4, label5] {
      
      NSLayoutConstraint.activate([
        // the labels won’t go under the safe area
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10)
      ])
      
      if let previous = previous {
        // we have a previous label - create a height constraint
        label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
      } else {
        // this is the first label
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
      }

      // set the previous label to be the current one, for the next loop iteration
      previous = label
    }
  }
  
  func addConstraints_ViewWithFormat() {
    let metrics = ["labelHeight": 88]
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
    
    let verticalConstraints = "V:|"
      + "[label1(labelHeight@999)]" // Setting priority height
      + "-"
      + "[label2(label1)]" // It needs to have the same height as label1
      + "-"
      + "[label3(label1)]"
      + "-"
      + "[label4(label1)]"
      + "-"
      + "[label5(label1)]"
      + "->=10-|" // the bottom space needs to be greater or equal to 10
    
    view.addConstraints(
      NSLayoutConstraint.constraints(
        withVisualFormat:verticalConstraints,
        options: [],
        metrics: metrics,
        views: viewsDictionary
      )
    )
  }
}

