//
//  SavedGifsViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Jason Crawford on 12/23/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class SavedGifsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var savedGifs = [Gif]()
    let cellMargin:CGFloat = 12.0
    
    @IBOutlet weak var emptyView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emptyView.isHidden = (savedGifs.count != 0)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: CollectionView Delegate and Datasource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 //savedGifs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GifCell", for: indexPath) as! GifCell
//        let gif = savedGifs[indexPath.item]
//        cell.configureForGif(gif: gif)
        return cell
    }
    
    // MARK: CollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - (cellMargin * 2.0))/2.0
        return CGSize(width: width, height: width)
        
    }


}
