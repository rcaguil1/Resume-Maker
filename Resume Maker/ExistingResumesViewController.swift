//
//  ViewController.swift
//  Resume Maker
//
//  Created by Ricky Aguilar on 2/27/16.
//  Copyright © 2016 Richard Aguilar. All rights reserved.
//

import UIKit

class ExistingResumesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Existing Resumes"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.hidden = false
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

