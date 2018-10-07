//
//  TestimonialViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {

    @IBOutlet weak var testimonialTableView:UITableView!
    var testimonialCell : TestimoniaItemViewCell?
    var testimonialList : NSMutableArray = []

    class func initWithStoryboard() -> TestimonialViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "TestimonialViewControllerID") as! TestimonialViewController
        return controller ;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Testimanial"
        
        let addBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(sender:))) as UIBarButtonItem
        self.navigationItem.setRightBarButtonItems([addBarButton], animated: true)
        let nibName = UINib(nibName: "TestimoniaItemViewCell", bundle:nil)
        self.testimonialTableView.register(nibName, forCellReuseIdentifier: "TestimoniaItemViewCell");
        self.testimonialTableView.separatorStyle = .none
        
        var testimonial : TestimonialModel?
        
        testimonial = TestimonialModel.init(withName:"Md. Mamun-Ur-Rashid" , withComment: "Description of menu category description of menu category description of menu category description of menu category description of menu category description of menu category description of menu category description of menu category 123", withTime: 18294849);
        self.testimonialList.add(testimonial!)
        
        testimonial = TestimonialModel.init(withName: "Abul Hasnat", withComment: "Description of menu category description123", withTime: 18294679);
        self.testimonialList.add(testimonial!)
        
        testimonial = TestimonialModel.init(withName: "Rashid Khan", withComment: "Description of menu category description123", withTime: 18254679);
        self.testimonialList.add(testimonial!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateCellHeight(withItem menu:TestimonialModel) -> CGFloat {
        
        var height : CGFloat?
        
        if (menu.height == nil) {
            
            if (self.testimonialCell == nil) {
                self.testimonialCell = self.testimonialTableView.dequeueReusableCell(withIdentifier: "TestimoniaItemViewCell") as? TestimoniaItemViewCell;
            }
            
            self.testimonialCell?.setInformationOnView(withItem: menu)
            menu.height = self.testimonialCell?.getCalculatedHeight()
        }
        
        height = menu.height
        
        return height!;
        
    }
    
    
    @objc func addButtonTapped(sender: UIBarButtonItem) {
        
    }
    
    func cartButtonTapped(sender: UIBarButtonItem) {
        
        let controller = CartViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil)
        
    }



}


extension TestimonialViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testimonialList.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestimoniaItemViewCell", for: indexPath) as! TestimoniaItemViewCell
        let selectedMenu  = self.testimonialList[indexPath.row];
        cell.setInformationOnView(withItem: selectedMenu as! TestimonialModel)
        
        return cell
    }
    
    
    
    
}

extension TestimonialViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        let selectedMenu  = self.testimonialList[indexPath.row];
        return calculateCellHeight(withItem: selectedMenu as! TestimonialModel)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
//        let selectedMenu  = self.testimonialList[indexPath.row];
//        let controller = ReceipeViewController.initWithStoryboard(withMenu: selectedMenu as! TestimonialModel)
//        self.navigationController?.pushViewController(controller, animated: true)
//        self.testimonialTableView.deselectRow(at: indexPath, animated: false);
        
    }
    
    
    
}

