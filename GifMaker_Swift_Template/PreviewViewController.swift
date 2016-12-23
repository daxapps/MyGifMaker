//
//  PreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Jason Crawford on 12/21/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

protocol PreviewViewControllerDelegate {
    func previewVC(preview: PreviewViewController, didSaveGif gif: Gif)
}

class PreviewViewController: UIViewController {

    var gif:Gif?
    var delegate: PreviewViewControllerDelegate! = nil
    
    @IBOutlet weak var gifImagePreview: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let img = gif?.gifImage {
            gifImagePreview.image = img
        }
        self.title = "Preview"
        //self.applyTheme(theme: .Dark)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.gifImagePreview.image = self.gif?.gifImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Share Gif
    
    @IBAction func shareGif(_ sender: AnyObject) {
        let url: NSURL = (self.gif?.url)!
        let animatedGIF = NSData(contentsOf: url as URL)!
        let itemsToShare = [animatedGIF]
        
        let activityVC = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        activityVC.completionWithItemsHandler = {(activity, completed, items, error) in
            if completed {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        navigationController?.present(activityVC, animated: true, completion: nil)
    }

}
