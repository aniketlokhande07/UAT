//
//  ViewController.swift
//  cameraApp
//
//  Created by saiusers on 23/01/17.
//  Copyright © 2017 saiusers. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,
     UINavigationControllerDelegate{

    @IBOutlet weak var pickedImage: UIImageView!
    var str = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveImageAction(_ sender: UIButton) {
        
        let imagedata = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
        let uicompressedimage = UIImage(data:imagedata!)
        UIImageWriteToSavedPhotosAlbum(uicompressedimage!, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func openCameraAction(_ sender: UIButton) {
      
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
           let imagepicker = UIImagePickerController()
            imagepicker.delegate = self
             imagepicker.sourceType = . photoLibrary
             imagepicker.allowsEditing = true
            
            self.present(imagepicker, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func openGallaryAction(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
            let imagepicker = UIImagePickerController()
            imagepicker.delegate = self
            imagepicker.sourceType = . photoLibrary
            imagepicker.allowsEditing = true
            self.present(imagepicker, animated: true, completion: nil)
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage Image: UIImage!,editingInfo:[NSObject:AnyObject]!) {
        pickedImage.image = Image
        self.dismiss(animated: true, completion: nil)
    }
}

