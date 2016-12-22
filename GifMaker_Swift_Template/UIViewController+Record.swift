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

extension UIViewController {
    
    //MARK: Select Video
    
    @IBAction func launchVideoCamera(sender: AnyObject) {
        // Create imagePicker
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = UIImagePickerControllerSourceType.camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
    }
}

// MARK: - UIViewController: UINavigationControllerDelegate

extension UIViewController: UINavigationControllerDelegate {}

// MARK: - UIViewController: UIImagePickerControllerDelegate

extension UIViewController: UIImagePickerControllerDelegate {
    
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
        
        displayGif(url: gifURL! as NSURL)
    }
    
    func  displayGif(url: NSURL) {
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gifURL = url
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
    
    
}







