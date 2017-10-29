//
//  ViewController.swift
//  InstagramLite
//
//  Created by Osiris Gadson on 10/28/17.
//  Copyright © 2017 Osiris Gadson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var picker: UIImagePickerController!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ShareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Ostetso.showGallery()
        picker = UIImagePickerController()
        picker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ImageView.image = pickedImage
            ShareButton.isEnabled = true
        }
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func ChooseButtonClicked(_ sender: Any) {
        present(self.picker, animated: true, completion: nil)
    }

    @IBAction func ShareButtonClicked(_ sender: Any) {
        Ostetso.share(ImageView.image)
    }
    @IBAction func GalleryClicked(_ sender: Any) {
        Ostetso.showGallery()
    }
}

