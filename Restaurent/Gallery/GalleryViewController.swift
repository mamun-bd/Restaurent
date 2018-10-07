//
//  GalleryViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var galleryCollectionView:UICollectionView!
    let reuseIdentifier = "GalleryViewCell"
    
    class func initWithStoryboard() -> GalleryViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "GalleryViewControllerID") as! GalleryViewController
        return controller ;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gallery"
        let nibName = UINib(nibName: "GalleryViewCell", bundle:nil)
        self.galleryCollectionView.register(nibName, forCellWithReuseIdentifier: "GalleryViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension GalleryViewController:UICollectionViewDataSource {
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! GalleryViewCell
        
       
        
        
        return cell
    }
    
    
}

extension GalleryViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 20
        let dim = (collectionView.bounds.width - spaceBetweenCells) / cellsAcross
        return CGSize.init(width: dim, height: dim)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        return 10;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return 10;
    }
    
}

extension GalleryViewController:UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        
        
        
    }
    
    
    
}
