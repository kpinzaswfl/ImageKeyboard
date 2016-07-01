//
//  KeyboardViewController.swift
//  ImageKeyboard
//
//  Created by Karen Pinzás on 30/6/16.
//  Copyright © 2016 Karen Pinzás. All rights reserved.
//

import UIKit
import MobileCoreServices

class KeyboardViewController: UIInputViewController {

    var nextKeyboardButton: UIButton!
    var imageView: UIImageView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        nextKeyboardButton = UIButton(type: .System)
    
        nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        nextKeyboardButton.sizeToFit()
        nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
    
        nextKeyboardButton.addTarget(self, action: #selector(advanceToNextInputMode), forControlEvents: .TouchUpInside)
        
        view.addSubview(self.nextKeyboardButton)
    
        nextKeyboardButton.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        nextKeyboardButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
        
        // Generate Image Button
        let generateImageButton = UIButton(type: .System)
        
        generateImageButton.setTitle(NSLocalizedString("Generate Image", comment: "Title for 'Generate Image' button"), forState: .Normal)
        generateImageButton.sizeToFit()
        generateImageButton.translatesAutoresizingMaskIntoConstraints = false
        
        generateImageButton.addTarget(self, action: #selector(generateImage), forControlEvents: .TouchUpInside)
        
        view.addSubview(generateImageButton)
        
        generateImageButton.leftAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.leftAnchor).active = true
        generateImageButton.topAnchor.constraintEqualToAnchor(view.layoutMarginsGuide.topAnchor).active = true

        // Image View
        imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        imageView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        
    }

    func generateImage() {
        
        let randomImage = ImageGenerator.random()
        
        imageView.image = randomImage
        
        if UIPasteboard.generalPasteboard().isKindOfClass(UIPasteboard) {
            
            UIPasteboard.generalPasteboard().setData(UIImagePNGRepresentation(randomImage)!, forPasteboardType:kUTTypePNG as String)
            
        }
        
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }

}
