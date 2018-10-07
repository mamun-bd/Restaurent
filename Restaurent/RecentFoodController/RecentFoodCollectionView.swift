//
//  RecentFoodCollectionView.swift
//  Restaurant
//
//  Created by Scrupulous on 4/3/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

protocol RecentFoodCollectionViewDelegate : NSObjectProtocol {
    func didSelectedItem() -> Any
    func didDisplayableItemIndex() -> Int
}

class RecentFoodCollectionView: UICollectionView  {

    var items : NSMutableArray = []
    let reuseIdentifier = "RecentViewCell"
    
    var flowLayout : UICollectionViewFlowLayout?
    var timer : Timer?
    var isReverseEnable : Bool?
    var nextIndex : Int?
    var selectionDelegate : RecentFoodCollectionViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       self.setUpView()
    }
    
    func setUpView() {
        
        self.setUpCollectionViewLayoutForDisplay()
        self.registerXibForDisplay()
        self.dataSource = self
        self.delegate = self
        self.reloadData()
        
    }
    
    func setUpCollectionViewLayoutForDisplay() {
        
      self.flowLayout = UICollectionViewFlowLayout.init()
      self.flowLayout?.itemSize = CGSize.init(width: self.frame.size.width, height: self.frame.size.height)
        self.flowLayout?.scrollDirection = UICollectionView.ScrollDirection.horizontal
      self.collectionViewLayout = self.flowLayout!
        
    }
    
    func registerXibForDisplay() {
        
        let nibName = UINib(nibName: "RecentViewCell", bundle:nil)
        self.register(nibName, forCellWithReuseIdentifier: reuseIdentifier)
        
    }

    func resetInformation() {
        self.stopTimer()
        if self.items.count > 0 {
            
            self.items.removeAllObjects()
            self.reloadData()
            self.collectionViewLayout.invalidateLayout()
        }
    }

    
    func addItems(items:NSArray) {
        self.resetInformation()
        if items.count > 0 {
            self.items.addObjects(from:items as! [Any])
            self.reloadData()
            self.nextIndex = 0;
            self.isReverseEnable = false;
            self.showFirstItem()
            if(self.items.count > 1){
               self.startTimer()
            }
            
        }
        
    }


    func startTimer() {
        
        self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector:#selector(self.onTick), userInfo: nil, repeats: true)
        
    }
    
    func stopTimer() {
        
        if (self.timer != nil) {
            self.timer?.invalidate()
            self.timer = nil
        }

    }
  
    @objc func onTick() {
        
        if (self.isReverseEnable == true) {
            self.nextIndex = self.nextIndex! - 1
        } else {
            self.nextIndex = self.nextIndex! + 1
        }
        self.showNextItem()
        
    }
    
     func showNextItem() {
        
        let indexPath = NSIndexPath.init(item: self.nextIndex!, section: 0)
        var scrollPosition = UICollectionView.ScrollPosition.right
        if self.isReverseEnable == true {
            scrollPosition = UICollectionView.ScrollPosition.left
        }
        
        self.scrollToItem(at: indexPath as IndexPath, at: scrollPosition, animated: true)
        
        if (self.nextIndex == 0) {
            self.isReverseEnable = false;
        } else if (self.nextIndex == (self.items.count-1)) {
            self.isReverseEnable = true;
        }
       
    }
    
    @objc func showFirstItem() {
        
        let indexPath = NSIndexPath.init(item: self.nextIndex!, section: 0)
        self.scrollToItem(at: indexPath as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.stopTimer()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if self.items.count > 1 {
            self.startTimer()
        }
    }

}

extension RecentFoodCollectionView : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    
        return CGSize.init(width: self.bounds.width, height: self.bounds.height)
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    
     return 0;
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
     return 0;
    
    }
    
}

extension RecentFoodCollectionView : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
    
        return 1
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! RecentViewCell
        cell.artworkContainer.image = UIImage.init(named: self.items[indexPath.row] as! String)
        print(self.items[indexPath.row])
        return cell
    }
    
    
}

extension RecentFoodCollectionView : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
}

extension RecentFoodCollectionView : UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.stopTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let centerPoint = CGPoint.init(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y)
        let centerCellIndexPath = self.indexPathForItem(at: centerPoint)
        if decelerate == false {
            self.endDecelerating(indexpath: centerCellIndexPath! as NSIndexPath)
        }

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let centerPoint = CGPoint.init(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y)
        let centerCellIndexPath = self.indexPathForItem(at: centerPoint)
        self.endDecelerating(indexpath: centerCellIndexPath! as NSIndexPath)
    }
    
    func endDecelerating(indexpath:NSIndexPath) {
        
        if (indexpath.row == 0) {
            self.isReverseEnable = false;
        } else if (indexpath.row == (self.items.count-1)) {
            self.isReverseEnable = true;
        } else {
            if (self.nextIndex! < indexpath.row) {
                self.isReverseEnable = false;
            } else {
                self.isReverseEnable = true;
            }
        }
        self.nextIndex = indexpath.row;
        
       
   
        if(self.items.count > 1){
         self.startTimer()
        }
        
    }
    
}


