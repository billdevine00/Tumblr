//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by WilliamDevine on 10/12/14.
//  Copyright (c) 2014 WilliamDevine. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var explorePopUp: UIImageView!

    var homeViewController: UIViewController!
    var search2ViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var isPresenting: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        search2ViewController = storyboard.instantiateViewControllerWithIdentifier("Search2ViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        
        onTab(homeButton)

        
        // Do any additional setup after loading the view.
       
        self.explorePopUp.frame.origin.y = 440
        
        UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.explorePopUp.frame.origin.y = 450
            }) { (Finished: Bool) -> Void in
                //
        }

    }
    
    override func viewDidAppear(animated: Bool)
    {
        
      
        
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
            println("home")
            containerView.addSubview(homeViewController.view)
            homeViewController.view.frame = containerView.frame
            self.addChildViewController(homeViewController)
            homeViewController.didMoveToParentViewController(self)
            search2ViewController.view.removeFromSuperview()
            accountViewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            explorePopUp.hidden = false

            
        case 1:
            println("search")
            containerView.addSubview(search2ViewController.view)
            search2ViewController.view.frame = containerView.frame
            accountViewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            homeViewController.view.removeFromSuperview()
            explorePopUp.hidden = true
            
//        case 2:
//            println("case 2")
//            containerView.addSubview(composeViewController.view)
//            composeViewController.view.frame = containerView.frame
            
        case 3:
            println("profile")
            containerView.addSubview(accountViewController.view)
            accountViewController.view.frame = containerView.frame
            self.addChildViewController(accountViewController)
            accountViewController.didMoveToParentViewController(self)
            homeViewController.view.removeFromSuperview()
            search2ViewController.view.removeFromSuperview()
            trendingViewController.view.removeFromSuperview()
            explorePopUp.hidden = false

            
        case 4:
            println("trending")
            containerView.addSubview(trendingViewController.view)
            trendingViewController.view.frame = containerView.frame
            self.addChildViewController(trendingViewController)
            trendingViewController.didMoveToParentViewController(self)
            homeViewController.view.removeFromSuperview()
            search2ViewController.view.removeFromSuperview()
            accountViewController.view.removeFromSuperview()
            explorePopUp.hidden = false

            
        default:
            println("none")
            
        }
        
    }
    
    
    override func prepareForSegue(ComposeSegue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = ComposeSegue.destinationViewController as ComposeViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)

        }

        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
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
