//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by sgr on 15/3/11.
//  Copyright (c) 2015年 com.cnipr. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var dialogView: UIView!
    
    
    override func viewDidAppear(animated: Bool)
    {
//        UIView.animateWithDuration(0.7, delay: 0, options: nil, animations: { () -> Void in
//            
//            self.dialogView.transform = CGAffineTransformMakeScale(1.0, 1.0)
//            
//        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: { () -> Void in
            
                let scale = CGAffineTransformMakeScale(1, 1)
                let trans = CGAffineTransformMakeTranslation(0, 0)
            
                self.dialogView.transform = CGAffineTransformConcat(scale, trans)
            
            }, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)
        
        let scale = CGAffineTransformMakeScale(0, 0)
        let trans = CGAffineTransformMakeTranslation(0, 500)
        dialogView.transform = CGAffineTransformConcat(scale, trans)
        
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
