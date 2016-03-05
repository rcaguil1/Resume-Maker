//
//  DocumentViewController.swift
//  Resume Maker
//
//  Created by Ricky Aguilar on 2/28/16.
//  Copyright © 2016 Richard Aguilar. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController {

    @IBOutlet weak var experiencesText: UITextView!
    
    @IBOutlet weak var firstNameText: UILabel!
    
    var experiences:String = ""
    var firstName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        experiencesText.text = experiences
        firstNameText.text = firstName
        // Do any additional setup after loading the view.
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
