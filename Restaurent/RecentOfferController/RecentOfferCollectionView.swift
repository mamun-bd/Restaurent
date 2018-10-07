//
//  RecentOfferCollectionView.swift
//  Restaurant
//
//  Created by Scrupulous on 4/3/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit



class RecentOfferCollectionView: UICollectionView  {

    var items = ["food_1.jpg", "food_2.jpg", "food_3.jpg", "food_4.jpg","food_5.jpg","food_6.jpg","food_7.jpg"]
    let reuseIdentifier = "RecentOfferCell"
    
    
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       self.setUpView()
    }
    
    func setUpView() {
        
       
        let nibName = UINib(nibName: "RecentOfferCell", bundle:nil)
        self.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        self.dataSource = self
        self.delegate = self
        //self.collectionViewLayout
        self.reloadData()
        self.startTimer()
        
    }
    
    func scrollToNextCell(){

        let fullyScrolledContentOffset:CGFloat = (self.frame.size.width-100) * CGFloat(items.count)
      
        var newContentOffset:CGFloat = self.contentOffset.x+(self.bounds.size.width-100)
        
//        self.contentOffset.x = self.contentOffset.x+self.bounds.size.width
        
        if (newContentOffset == fullyScrolledContentOffset) {
            newContentOffset = 0.0
            self.contentOffset.x = newContentOffset
        } else {
        
            self.scrollRectToVisible(CGRect.init(x: newContentOffset-self.bounds.size.width, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height), animated: true)

            
        }
        
//        UIView.animate(withDuration: 0.5 , delay: 0.0, options: .curveEaseIn, animations: {
//            
//           self.contentOffset.x = newContentOffset
//        }, completion: { _ in
//            
//            
//        })
        
        
           }
 
    func startTimer() {
        
        
//        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(RecentFoodCollectionView.scrollToNextCell), userInfo: nil, repeats: true)
        
      
        
        
    }
  

}

extension RecentOfferCollectionView:UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
        return CGSize.init(width: self.bounds.width-100, height: self.bounds.height)
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
     return 0;
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
     return 0;
    
    }
    
  


}

extension RecentOfferCollectionView:UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
    
        return 1
    
    }
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! RecentOfferCell
        cell.artworkContainer.image = UIImage.init(named: self.items[indexPath.row])
       // print(self.items[indexPath.row])
        return cell
    }
    
    
}

extension RecentOfferCollectionView:UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
}


