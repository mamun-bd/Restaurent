//
//  FavouriteViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var favouriteTableView:UITableView!
    
    var favouriteCell : FavouriteViewCell?
    var favouriteList : NSMutableArray = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourite"
        
        
        let nibName = UINib(nibName: "FavouriteViewCell", bundle:nil)
        self.favouriteTableView.register(nibName, forCellReuseIdentifier: "FavouriteViewCell");
        self.favouriteTableView.separatorStyle = .none
        
        var favourite : FavouriteModel?
        favourite = FavouriteModel.init(forName: "Title of menu category Title of menu category Title of menu category", forDetails: "Description of menu category description of menu category description of menu category description of menu category description of menu category description of menu category description of menu category description of menu category 123");
        self.favouriteList.add(favourite!)
        
        favourite = FavouriteModel.init(forName: "Title of menu category", forDetails: "Description of menu category description123");
        self.favouriteList.add(favourite!)
        
        favourite = FavouriteModel.init(forName: "Title", forDetails: "Description");
        self.favouriteList.add(favourite!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func calculateCellHeight(withItem menu:FavouriteModel) -> CGFloat {
        
        var height : CGFloat?
        
        if (menu.height == nil) {
            
            if (self.favouriteCell == nil) {
                self.favouriteCell = self.favouriteTableView.dequeueReusableCell(withIdentifier: "FavouriteViewCell") as? FavouriteViewCell;
            }
            
            self.favouriteCell?.setInformationOnView(withItem: menu)
            menu.height = self.favouriteCell?.getCalculatedHeight()
        }
        
        height = menu.height
        
        return height!;
        
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


extension FavouriteViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favouriteList.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteViewCell", for: indexPath) as! FavouriteViewCell
        let selectedMenu  = self.favouriteList[indexPath.row];
        cell.setInformationOnView(withItem: selectedMenu as! FavouriteModel)
        
        return cell
    }
    
    
    
    
}

extension FavouriteViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        let selectedMenu  = self.favouriteList[indexPath.row];
        return calculateCellHeight(withItem: selectedMenu as! FavouriteModel)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
//        let controller = ReceipeDetailsViewController.initWithStoryboard()
//        self.navigationController?.pushViewController(controller, animated: true)
//        tableView.deselectRow(at: indexPath, animated: false);
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.favouriteList.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }
    
    
    
}

