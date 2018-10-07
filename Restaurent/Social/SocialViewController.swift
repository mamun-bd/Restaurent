//
//  SocialViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController {

    @IBOutlet weak var socialCollectionView:UICollectionView!
    
    var items = ["Facebook", "Twitter", "Google Plus"]
    var itemsArtwork = ["facebook", "twiter", "googleplus"]
    let reuseIdentifier = "SocialViewCell"
    
    class func initWithStoryboard() -> SocialViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "SocialViewControllerID") as! SocialViewController
        return controller ;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Social"
        
        let nibName = UINib(nibName: "SocialViewCell", bundle:nil)
        self.socialCollectionView.register(nibName, forCellWithReuseIdentifier: "SocialViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension SocialViewController:UICollectionViewDataSource {
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! SocialViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.lblName.text = self.items[indexPath.item]
        cell.artworkContainer.image = UIImage.init(named: self.itemsArtwork[indexPath.item])
        
        return cell
    }
    
    
}

extension SocialViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let cellsAcross: CGFloat = 3
        let spaceBetweenCells: CGFloat = 10
        let dim = (collectionView.bounds.width - spaceBetweenCells) / cellsAcross
        return CGSize.init(width: dim, height: dim)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        return 5;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return 5;
    }
    
}

extension SocialViewController:UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        switch indexPath.row {
            
        case 0:
//            let controller = GalleryViewController.initWithStoryboard()
//            self.navigationController?.pushViewController(controller, animated: true)
            break
            
        default: break
            
        }
        
        
        
        
    }
    
    
    
}

