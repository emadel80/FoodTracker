//
//  ViewController.swift
//  FoodTracker
//
//  Created by Emanuel Del Castillo on 1/1/17.
//  Copyright © 2017 Del Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  // MARK: Properties
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nameMealLabel: UILabel!
  
  // MARK: UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Handle the text field's user input through delegate callbacks.
    nameTextField.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: UITextFieldDelegate
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    // Hide the keyboard
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    // Replaces the content of label with text field's value
    nameMealLabel.text = textField.text
  }
  
  // MARK: Actions
  @IBAction func setDefaultLabelText(_ sender: UIButton) {
    
    // Resets nameMealLabel's content
    nameMealLabel.text = "Meal Name"
  }
  
}

