//
//  ViewController.swift
//  FoodTracker
//
//  Created by Emanuel Del Castillo on 1/1/17.
//  Copyright © 2017 Del Castillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate
{

  // MARK: Properties
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nameMealLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
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
  
  // MARK: UIImagePickerControllerDelegate
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    
    // Dismiss the picker if the user canceled
    dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    // The info dictionary may contain multiple representations of the image
    // You want to use the original
    guard let selectedImage =
        info[UIImagePickerControllerOriginalImage] as? UIImage
      else {
        fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
      }
    
    // Set photoImageView to display the selected image
    photoImageView.image = selectedImage
    
    // Dismiss the picker
    dismiss(animated: true, completion: nil)
  }
  
  // MARK: Actions
  @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
    
    // Hide the keyboard
    nameTextField.resignFirstResponder()
    
    // UIImagePickController is a view controller that lets a user pick media
    // from their photo library
    let imagePickerController = UIImagePickerController()
    
    // Only allow photos to be picked, not taken
    imagePickerController.sourceType = .photoLibrary
    
    // Make sure ViewController is notified when the user picks an image
    imagePickerController.delegate = self
    present(imagePickerController, animated: true, completion: nil)
  }
}

