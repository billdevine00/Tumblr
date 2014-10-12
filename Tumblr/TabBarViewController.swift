//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by WilliamDevine on 10/12/14.
//  Copyright (c) 2014 WilliamDevine. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var indicatorView: UIView!

    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var selectedTab: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTab(sender: AnyObject) {
        homeButton.selected = false
        searchButton.selected = false
        profileButton.selected = false
        trendingButton.selected = false
        
        switch sender.tag {
        case 0:
            println("case 0")
            containerView.addSubview(homeViewController.view)
            homeViewController.view.frame = containerView.frame

        case 1:
            println("case 1")
            containerView.addSubview(searchViewController.view)
            searchViewController.view.frame = containerView.frame
            
//        case 2:
//            println("case 2")
//            containerView.addSubview(composeViewController.view)
//            composeViewController.view.frame = containerView.frame
            
        case 3:
            println("case 3")
            containerView.addSubview(accountViewController.view)
            accountViewController.view.frame = containerView.frame
            
        case 4:
            println("case 4")
            containerView.addSubview(trendingViewController.view)
            trendingViewController.view.frame = containerView.frame
            
        default:
            println("none")
            
        }
        
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
