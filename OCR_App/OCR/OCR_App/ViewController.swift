//
//  ViewController.swift
//  OCR_App
//
//  Created by Administrator on 30/08/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITextViewDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var RecognizedTextView: UITextView!

    var text:Text?
    var error:NSError?
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let txt = text
        {
            RecognizedTextView.text = txt.retreivedText
        }
        
    }
         @IBAction func TakePhoto(sender: AnyObject)
    {
        
        // 1
        view.endEditing(true)

        // 2
        let imagePickerActionSheet = UIAlertController(title: "click/pick Photo",
            message: nil, preferredStyle: .ActionSheet)
        // 3
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraButton = UIAlertAction(title: "Take Photo",
                style: .Default) { (alert) -> Void in
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .Camera
                    self.presentViewController(imagePicker,
                        animated: true,
                        completion: nil)
            }
            imagePickerActionSheet.addAction(cameraButton)
        }
        // 4
        let libraryButton = UIAlertAction(title: "Choose Existing",
            style: .Default) { (alert) -> Void in
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker,
                    animated: true,
                    completion: nil)
        }
        imagePickerActionSheet.addAction(libraryButton)
        // 5
        let cancelButton = UIAlertAction(title: "Cancel",
            style: .Cancel) { (alert) -> Void in
        }
        imagePickerActionSheet.addAction(cancelButton)
        // 6
        presentViewController(imagePickerActionSheet, animated: true,
            completion: nil)
        
    }
    
    //method for image scaling
    func scaleImage(image: UIImage, maxDimension: CGFloat) -> UIImage {
        
        var scaledSize = CGSize(width: maxDimension, height: maxDimension)
        var scaleFactor: CGFloat
        
        if image.size.width > image.size.height {
            scaleFactor = image.size.height / image.size.width
            scaledSize.width = maxDimension
            scaledSize.height = scaledSize.width * scaleFactor
        } else {
            scaleFactor = image.size.width / image.size.height
            scaledSize.height = maxDimension
            scaledSize.width = scaledSize.height * scaleFactor
        }
        
        UIGraphicsBeginImageContext(scaledSize)
        image.drawInRect(CGRectMake(0, 0, scaledSize.width, scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }


    @IBAction func SaveText(sender: AnyObject)
    {
    
        if text == nil
       {
        let textDescription = NSEntityDescription.entityForName("Text", inManagedObjectContext: moContext)
        
        
        // Then, We Create the Managed Object to be  inserted into the cored data
       text = Text(entity: textDescription!, insertIntoManagedObjectContext: moContext)
       }
    
    // set the attributes
    text!.retreivedText = RecognizedTextView.text
        
        var error: NSError?
        
        
        do {
            // Save The object
            
            try moContext.save()
            
        } catch var error1 as NSError {
            error = error1
        }
        
        
        //Check if there is any erros
        
        if let err = error {
            
            let a = UIAlertView(title: "Error", message: err.localizedFailureReason, delegate: nil, cancelButtonTitle: "OK")
            a.show()
            
        } else {
            
            let a = UIAlertView(title: "Success", message: "Your Text is saved", delegate: nil, cancelButtonTitle: "OK")
            print(text!.retreivedText)

            a.show()
        }
        
    
    }

}
    extension ViewController: UIImagePickerControllerDelegate
    {
        
        func imagePickerController(picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [String : AnyObject]) {
                let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
                let scaledImage = scaleImage(selectedPhoto, maxDimension: 640)
                
//                addActivityIndicator()
                
                dismissViewControllerAnimated(true, completion: {
                    self.performImageRecognition(scaledImage)
                })
        }
        
        func performImageRecognition(image: UIImage) {
            // 1
            let tesseract = G8Tesseract()
            // 2
            tesseract.language = "eng"
            // 3
            tesseract.engineMode = .TesseractCubeCombined
            // 4
            tesseract.pageSegmentationMode = .Auto
            // 5
            tesseract.maximumRecognitionTime = 60.0
            // 6
            tesseract.image = image.g8_blackAndWhite()
            tesseract.recognize()
            // 7
            RecognizedTextView.text = tesseract.recognizedText
            RecognizedTextView.editable = true
            // 8

        }
    }




