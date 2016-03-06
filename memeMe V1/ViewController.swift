//
//  ViewController.swift
//  memeMe V1
//
//  Created by Wassim Seifeddine on 3/6/16.
//  Copyright © 2016 Wassim Seifeddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var imageView: UIImageView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takeAPhoto(){
     

        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            print("Camera not  Available")
            showImagePicker()
            return
            
        }
        let controller = UIImagePickerController()
        controller.sourceType = UIImagePickerControllerSourceType.Camera
        controller.delegate = self
        self.presentViewController(controller, animated: true) { () -> Void in
            print("Camera Controller Viewed")
        }
        
    }
    @IBAction func showImagePicker (){
        let controller = UIImagePickerController()
        
        //The Default is PhotoLibrary. Not Necessary step
        controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        controller.delegate = self
        self.presentViewController(controller, animated: true) { () -> Void in
            print("Image controller viewed")
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}

