//
//  PictureViewController.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/3/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit
import Firebase

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var theSubmitButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var listDescriptionField: UITextField!
 
    var imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as!
        UIImage
        
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        
        imagePicker.dismiss(animated: true, completion: nil)
    }


    @IBAction func cameraTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        theSubmitButton.isEnabled = false
        let imagesFolder = Storage.storage().reference().child("images")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)
        NSUUID().uuidString
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData!, metadata: nil, completion: {(metadata, error) in
            if error != nil {
                print("We had an error:\(String(describing: error))")
            } else {
                print(metadata?.downloadURL()!)
                self.performSegue(withIdentifier: "selectListSegue", sender: nil)
            }
        })
        
      
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

   

}
