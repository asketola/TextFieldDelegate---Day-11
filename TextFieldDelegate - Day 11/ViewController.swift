//
//  ViewController.swift
//  TextFieldDelegate - Day 11
//
//  Created by Annemarie Ketola on 12/11/14.
//  Copyright (c) 2014 Up Early, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var data: String?   // <- sets up the var data as a string

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    textField.delegate = self  // <- no idea what this does, called the delegate thing (?)
        
        textField.addTarget(self, action: Selector("textFieldDidChange:"), forControlEvents: UIControlEvents.EditingChanged) // <- used to dynamically gather data (another way, same as from adding it by hand from the storyboard) can use for things like sliders so they don't have to push a button

    }
    
    func saveLogic() {  // method that saves the data you type into a variable called data
        data = textField.text
        println("Data: \(data)")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool { // <- method that hooks the keyboard going away and saving the data with the return button on the keyboard
        saveLogic()
        dismissKeyboard()
        return true
    }
    
    func dismissKeyboard() {    // <- method that makes the keyboard go away
        view.endEditing(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        saveLogic()                     // <- used method to save the logic you typed
        dismissKeyboard()               // <- used method to makes the keyboard go down
        println("Data: \(data)")        // <- prints the data out

    }

    @IBAction func textFieldDidChange(sender: AnyObject) {  // <- this code will dynamically save what the user types as they type it, one character at a time
        saveLogic()
    
    }
}

