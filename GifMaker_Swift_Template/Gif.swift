//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Jason Crawford on 12/22/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif: NSObject {
    
    let url: NSURL?
    let videoURL: NSURL?
    let caption: String?
    let gifImage: UIImage?
    var gifData: NSData?
    
    init(url: NSURL, videoURL: NSURL, caption: String?) {
        
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gif(url: url.absoluteString!)
        self.gifData = nil
    }
    
//    init(name: String) {
//        self.gifImage = UIImage.gif(name: name)
//    }
}
