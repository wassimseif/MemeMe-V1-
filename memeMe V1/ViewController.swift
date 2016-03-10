//
//  ViewController.swift
//  memeMe V1
//
//  Created by Wassim Seifeddine on 3/6/16.
//  Copyright © 2016 Wassim Seifeddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var navigationBar: UIToolbar!
    @IBOutlet weak var upperTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lowerTextField: UITextField!
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.subscribeToKeyboardNotifications()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.blackColor()
        
        setTextField(upperTextField)
        upperTextField.text = "Top"
        setTextField(lowerTextField)
        lowerTextField.text = "Bottom"
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        self.unsubscribeToKeyboardNotifications()
    }
    
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        
        imageView.image = image
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
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
    
    
    
    
    //MARK:- Keybaord Functions
    /**
    This function will set all the needed attributes for the textField in this app
    
    - parameter textField: The textfield that this function will operate on
    */
    func setTextField(textField : UITextField){
        textField.delegate = self
        textField.defaultTextAttributes = Meme.memeTextAttributes
        textField.textAlignment = NSTextAlignment.Center;
        textField.borderStyle = UITextBorderStyle.None
        textField.backgroundColor = UIColor.clearColor()
    }
    /**
     Subscribes on NSNotication and listens on the keyboardWillShow notification
     */
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "KeyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    /**
     Subscribes on NSNotication and listens on the keyboardWillHide notification

     */
    func unsubscribeToKeyboardNotifications(){
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    /**
     This function will do the necessary view changed when the keybaord will appear
     
     - parameter notification: the notification that informs that the keyboard will show
     */
    func keyboardWillShow(notification: NSNotification) {
        if lowerTextField.isFirstResponder(){
            self.view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    /**
     This function will do the necessary view changed when the keybaord will hide

     
     - parameter notification: the notification that informs that the keyboard will show
     */
    func KeyboardWillHide (notification : NSNotification){
        
        self.view.frame.origin.y = 0
    }
    /**
     This function will return the keyboard height
     
     - parameter notification: the notification that informs that the keyboard will show

     - returns: The keyboard height
     */
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo!
        let keyboardSize = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.CGRectValue().height
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        
        
        
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string.uppercaseString)
        textField.text = String(newText)
        return false
    }
    
    
    /**
     Triggers the activity view that will share a meme
     
     - parameter sender: The AnyObject that triggered this function
     */
    @IBAction func shareMeme(sender: AnyObject) {
        let memedImage = generateMemedImage()
        let activityViewController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        // setting up dismissal of the activity view once the meme is successfully shared:
        activityViewController.completionWithItemsHandler = {
            (activity, success, items, error) in
            if (success) {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    /**
     This function will generate a meme by combining the image with the 2 UITextFields
     
     - returns: The generated images
     */
    func generateMemedImage() -> UIImage {
        
        // Hide toolbar and navbar
        toolBar.hidden = true
        navigationBar.hidden = true
        
        // Render view to an image
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawViewHierarchyInRect(view.frame,
            afterScreenUpdates: true)
        let memedImage : UIImage =
        UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        // Show toolbar and navbar
        toolBar.hidden = false
        navigationBar.hidden = false
        
        return memedImage
        
    }
    
   
    
}


