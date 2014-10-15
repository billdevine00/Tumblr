//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by WilliamDevine on 10/12/14.
//  Copyright (c) 2014 WilliamDevine. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate {

    
    @IBOutlet var composeView: UIView!

    @IBOutlet weak var textButton: UIImageView!
    @IBOutlet weak var photoButton: UIImageView!
    @IBOutlet weak var quoteButton: UIImageView!
    @IBOutlet weak var linkButton: UIImageView!
    @IBOutlet weak var chatButton: UIImageView!
    @IBOutlet weak var videoButton: UIImageView!
    var isPresenting: Bool = true

//    let offstageTop = CGAffineTransformMakeTranslation(150, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textButton.frame.origin.y = 600
        photoButton.frame.origin.y = 600
        quoteButton.frame.origin.y = 600
        linkButton.frame.origin.y = 700
        chatButton.frame.origin.y = 700
        videoButton.frame.origin.y = 700
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    @IBAction func onNevermind(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    

    
    override func viewDidAppear(animated: Bool) {
        
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.textButton.frame.origin.y = 122
            self.photoButton.frame.origin.y = 122
            self.quoteButton.frame.origin.y = 122
            
         
        })
        
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
         
            
            self.linkButton.frame.origin.y = 238
            self.chatButton.frame.origin.y = 238
            self.videoButton.frame.origin.y = 238
        })
    }
    
    
    //thought this would animate out :(
    override func viewDidDisappear(animated: Bool) {
            
           
          
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.textButton.frame.origin.y = -600
                self.photoButton.frame.origin.y = -600
                self.quoteButton.frame.origin.y = -600
                self.linkButton.frame.origin.y = -700
                self.chatButton.frame.origin.y = -700
                self.videoButton.frame.origin.y = -700
                
                
            })
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
