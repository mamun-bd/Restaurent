//
//  MoreViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/24/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    
    @IBOutlet weak var moreCollectionView:UICollectionView!
    
     var items = ["Gallery", "Testimonial", "Reservation", "Location", "About Us", "Social"]
    let reuseIdentifier = "MoreViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "More"
        
        let nibName = UINib(nibName: "MoreViewCell", bundle:nil)
        self.moreCollectionView.register(nibName, forCellWithReuseIdentifier: "MoreViewCell")
      
        
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


extension MoreViewController:UICollectionViewDataSource {
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MoreViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.lblName.text = self.items[indexPath.item]
        
        
        return cell
    }
    
    
}

extension MoreViewController:UICollectionViewDelegateFlowLayout{

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

extension MoreViewController:UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        
        switch indexPath.row {
            
        case 0:
            let controller = GalleryViewController.initWithStoryboard()
            self.navigationController?.pushViewController(controller, animated: true)
            break
        case 1:
            let controller = TestimonialViewController.initWithStoryboard()
            self.navigationController?.pushViewController(controller, animated: true)
            break
        case 2:
            let controller = ReservationViewController.initWithStoryboard()
            self.navigationController?.pushViewController(controller, animated: true)
            break
        case 3:
            let controller = LocationViewController.initWithStoryboard()
            self.navigationController?.pushViewController(controller, animated: true)
            break
        case 4:
            let controller = AboutViewController.initWithStoryboard()
            self.navigationController?.pushViewController(controller, animated: true)
            break
        case 5:
            let controller = SocialViewController.initWithStoryboard()
            self.navigationController?.pushViewController(controller, animated: true)
            break
        default: break
            
        }
        
        
        
        
    }

 
    
}
