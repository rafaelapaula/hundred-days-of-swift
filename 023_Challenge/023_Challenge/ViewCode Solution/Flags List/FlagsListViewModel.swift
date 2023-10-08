//
//  FlagsListViewModel.swift
//  023_Challenge
//
//  Created by rafaela.lourenco on 08/10/23.
//

import Foundation

protocol FlagsDelegate {
  func flagsDidLoad(_ flags: [String])
}

protocol FlagsListViewModelProtocol {
  func load()
}

class FlagsListViewModel: FlagsListViewModelProtocol {
  var delegate: FlagsDelegate?
  private let fileManager: FileManager
  
  init(_ delegate: FlagsDelegate? = nil, fileManager: FileManager = FileManager.default) {
    self.delegate = delegate
    self.fileManager = fileManager
  }
  
  func load() {
    guard
      let path = Bundle.main.resourcePath,
      let contents = try? fileManager.contentsOfDirectory(atPath: path)
    else { return }
    
    var flags = [String]()
    contents.forEach { item in
      if item.hasPrefix("Flag") {
        flags.append(
          item.replacing("Flag", with: "")
            .replacing(".png", with: "")
        )
      }
    }
    delegate?.flagsDidLoad(flags)
  }
}
