//
//  ShareViewController.swift
//  FoodPin
//
//  Created by sgr on 15/3/11.
//  Copyright (c) 2015年 com.cnipr. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var backgroundIV: UIImageView!
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    
    override func viewDidAppear(animated: Bool)
    {
        let transUp = CGAffineTransformMakeTranslation(0, 20)
        let transDown = CGAffineTransformMakeTranslation(0, -20)
        
        
        UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            
            
            self.facebookButton.transform = transUp
            self.emailButton.transform = transDown
            
            
            
            }, completion: nil)
        
        
        UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            

            self.messageButton.transform = transUp
            self.twitterButton.transform = transDown
            
            
            
        }, completion: { (completion: Bool) -> Void in
        
            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
                
                let translate = CGAffineTransformMakeTranslation(0, 0)
                
                self.facebookButton.transform = translate
                self.emailButton.transform = translate
                self.twitterButton.transform = translate
                self.messageButton.transform = translate
                }, completion: nil)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundIV.addSubview(blurEffectView)
        
        let transUp = CGAffineTransformMakeTranslation(0, -500)
        let transDown = CGAffineTransformMakeTranslation(0, 500)
        
        facebookButton.transform = transUp
        messageButton.transform = transUp
        twitterButton.transform = transDown
        emailButton.transform = transDown
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
