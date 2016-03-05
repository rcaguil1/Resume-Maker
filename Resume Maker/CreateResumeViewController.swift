//
//  MainInputViewController.swift
//  Resume Maker
//
//  Created by Ricky Aguilar on 2/27/16.
//  Copyright © 2016 Richard Aguilar. All rights reserved.
//
//Self-current thing that you're in. The top parent that you're in. 
//

import UIKit
import Darwin

class CreateResumeViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    //Segued scrollView, contentView
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    
    //When button is pressed, use the segue with identifier "toDocument". (sender: AnyObject) is just syntax
    
    @IBAction func donePressed(sender: AnyObject) {
        self.performSegueWithIdentifier("toDocument", sender: self)
    }
    
    //TEXTFIELDS
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var educationText: UITextField!
    @IBOutlet weak var objectiveText: UITextField!
    @IBOutlet weak var experienceText: UITextField!
    @IBOutlet weak var extracurricularText: UITextField!
    @IBOutlet weak var referencesText: UITextField!
    
    
    //LABELS
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var objectiveLabel: UILabel!
    @IBOutlet weak var experienceLabel: UILabel!
    @IBOutlet weak var extracurricularLabel: UILabel!
    @IBOutlet weak var referencesLabel: UILabel!
  
    
    
    
    
    
    // var nameofvariable: [type]! (unless boolean)
    
    var textFieldArray: [UITextField]!
    var labelArray: [UILabel]!
    var interupt: Bool = false
    
    //this variable was used to define the amount of pixels the screen would animate upwards when next is pushed on the keyboard so that the next textLabel and textField appears.
    
    var MOVE_UP_HEIGHT = 171
    
    //When the view loads, (method=functon) the function, super is...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "New Resume"
    //Delegate gives you the option to decide for yourself what will happen during an event. 
        
        scrollView.delegate = self
        
    // Recognize when the view is touched so that the keyboard dissapears if needed
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "touchedView"))
        
      //Arrays for targeting
        
        textFieldArray = [
            firstNameText,
            lastNameText,
            addressText,
            phoneText,
            emailText,
            educationText,
            objectiveText,
            experienceText,
            extracurricularText,
            referencesText
            
        ]
        
        labelArray = [
            firstNameLabel,
            lastNameLabel,
            addressLabel,
            phoneLabel,
            emailLabel,
            educationLabel,
            objectiveLabel,
            experienceLabel,
            extracurricularLabel,
            referencesLabel
            
        ]
        
        //for loop that goes through the arrays of the text and label arrays, .textColor targets the color of the label array
        
        for var i = 0; i < textFieldArray.count; i++ {
            textFieldArray[i].delegate = self
            labelArray[i].textColor = UIColor.lightGrayColor()
        }
        
        
        // Do any additional setup after loading the view.
    }
    

        // the first text field in the array will be the first responder, array's are given their fontsize/color
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.navigationBar.hidden = false
        
        textFieldArray[0].becomeFirstResponder()
        labelArray[0].font = UIFont.boldSystemFontOfSize(25)
        labelArray[0].textColor = UIColor.cyanColor()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       
        
        
        for var i = 0; i < textFieldArray.count; i++ {
            if i == textFieldArray.count-1 {
                self.contentView.endEditing(true)
            }
            else{
                if textFieldArray[i].isFirstResponder() {
                
                    textFieldArray[i].resignFirstResponder()
                    labelArray[i].font = UIFont.systemFontOfSize(25, weight: UIFontWeightLight)
                    labelArray[i].textColor = UIColor.lightGrayColor()
                    
                    textFieldArray[i+1].becomeFirstResponder()
                    labelArray[i+1].font = UIFont.boldSystemFontOfSize(25)
                    labelArray[i+1].textColor = UIColor.cyanColor()
                    
                    
                    UIView.animateWithDuration(0.6) { () -> Void in
                        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.contentOffset.y + CGFloat(self.MOVE_UP_HEIGHT))
                    }
                    break
                }
            }
        }
        
        
        
       
        return true;
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        for var i = 0; i < textFieldArray.count; i++ {
            if labelArray[i].font == UIFont.boldSystemFontOfSize(25) {
                
                labelArray[i].font = UIFont.systemFontOfSize(25, weight: UIFontWeightLight)
                labelArray[i].textColor = UIColor.lightGrayColor()
                
            }
        }
        
        let indexForNewLabelBold = textFieldArray.indexOf(textField)
        labelArray[indexForNewLabelBold!].font = UIFont.boldSystemFontOfSize(25)
        labelArray[indexForNewLabelBold!].textColor = UIColor.cyanColor()

        
    }
    
    
    
    
    
//    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        
//            moveWhenDoneScrolling(scrollView)
//        
//    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
//        
//        NSObject.cancelPreviousPerformRequestsWithTarget(self)
//        //ensure that the end of scroll is fired.
//        //self.performSelector("scrollViewDidEndScrollingAnimation:", userInfo: scrollView, withObject: nil, afterDelay: 0.3)
//        self.performSelector("scrollViewDidEndScrollingAnimation:", withObject: scrollView, withObject: 0.9)
//       
        moveWhenDoneScrolling(scrollView)
        
    }
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    //
    //    -(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
    //    {
    //    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    //    ...
//    
//        NSObject.cancelPreviousPerformRequestsWithTarget(self)
//
    }
    
    
    
    
    
//    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        interupt = true
//    }
    
    func moveWhenDoneScrolling(scrollView: UIScrollView){
        let index:Int = (Int) (floor(scrollView.contentOffset.y/171))
        if index >= 0{
            
            
            UIView.animateWithDuration(0.6) { () -> Void in
                scrollView.contentOffset.y = (171*floor(scrollView.contentOffset.y/171)-30)
            }
            for var i = 0; i < textFieldArray.count-1; i++ {
                if textFieldArray[i].isFirstResponder() {
                    
                    textFieldArray[i].resignFirstResponder()
                    labelArray[i].font = UIFont.systemFontOfSize(25, weight: UIFontWeightLight)
                    labelArray[i].textColor = UIColor.lightGrayColor()
                    
                    break
                }
            }
            
            textFieldArray[(Int)(index)].becomeFirstResponder()
            labelArray[(Int)(index)].font = UIFont.boldSystemFontOfSize(25)
            labelArray[(Int)(index)].textColor = UIColor.cyanColor()
            
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDocument"{
            let controller: DocumentViewController = segue.destinationViewController as! DocumentViewController
            controller.experiences = self.experienceText.text!
            controller.firstName = self.firstNameText.text!
            
        }
    }
    
    func touchedView(){
        self.contentView.endEditing(true)

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
