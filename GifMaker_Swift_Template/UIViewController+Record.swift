//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Jason Crawford on 12/21/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

// Regift constants
let frameCount = 16
let delayTime: Float = 0.2
let loopCount = 0  // 0 means loop forever


// MARK: - UIViewController (Record)

extension UIViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //MARK: Select Video
    
    @IBAction func presentVideoOptions() {
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
             launchPhotoLibrary()
        } else {
            let newGifActionSheet = UIAlertController(title: "Create new GIF", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let recordVideo = UIAlertAction(title: "Record a Video", style: UIAlertActionStyle.default, handler: {(UIAlertAction) in
                    self.launchVideoCamera()
                })
            let chooseFromExisting = UIAlertAction(title: "Choose from Existing", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                 self.launchPhotoLibrary()
                })
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            newGifActionSheet.addAction(recordVideo)
            newGifActionSheet.addAction(chooseFromExisting)
            newGifActionSheet.addAction(cancel)
            
            present(newGifActionSheet, animated: true, completion: nil)
            let pinkColor = UIColor(colorLiteralRed: 255.0/255.0, green: 65.0/255.0, blue: 112.0/255.0, alpha: 1.0)
            newGifActionSheet.view.tintColor = pinkColor
        }
    }
    
    func launchVideoCamera() {
        // Create imagePicker
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = UIImagePickerControllerSourceType.camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
    }
    
    func launchPhotoLibrary() {
        let pickerController = imagePicker(source: .photoLibrary)
        
        self.present(pickerController, animated: true, completion: nil)
    }
    //}

// MARK: - UIViewController: UINavigationControllerDelegate

//extension UIViewController: UINavigationControllerDelegate {}

// MARK: - UIViewController: UIImagePickerControllerDelegate

//extension UIViewController: UIImagePickerControllerDelegate {
    
    func imagePicker(source: UIImagePickerControllerSourceType) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.delegate = self
        picker.allowsEditing = true
        
        return picker
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String {
            let videoURL = info[UIImagePickerControllerMediaURL] as! NSURL
            //UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path!, nil, nil, nil)
            dismiss(animated: true, completion: nil)
            convertVideoToGif(videoURL: videoURL)
        }
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // GIF conversion methods
    func convertVideoToGif(videoURL: NSURL) {
        let regift = Regift(sourceFileURL: videoURL as URL, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        let gifURL = regift.createGif()
        let gif = Gif(url: gifURL! as NSURL, videoURL: videoURL, caption: nil)
        
        displayGif(gif: gif)
    }
    
    func  displayGif(gif: Gif) {
        let gifEditorVC = self.storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gif = gif
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
    
    
}







