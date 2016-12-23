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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
