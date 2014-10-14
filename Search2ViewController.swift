//
//  Search2ViewController.swift
//  Tumblr
//
//  Created by WilliamDevine on 10/12/14.
//  Copyright (c) 2014 WilliamDevine. All rights reserved.
//

import UIKit

class Search2ViewController: UIViewController {

    @IBOutlet weak var spinnerImage: UIImageView!
    @IBOutlet weak var searchFeedImage: UIImageView!
    
    @IBOutlet var homeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        var images = UIImage.animatedImageNamed("loading-", duration: 1)
        spinnerImage.image = images
        searchFeedImage.hidden = true
        delay(1) {
            self.spinnerImage.hidden = true
            self.searchFeedImage.hidden = false
            
        }
        
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
