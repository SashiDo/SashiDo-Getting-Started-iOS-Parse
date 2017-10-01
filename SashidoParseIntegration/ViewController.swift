//
//  ViewController.swift
//  SashidoParseIntegration
//
//  Created by Sami Ali on 9/30/17.
//  Copyright © 2017 Sashido.co. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func writeToTable(_ sender: UIButton) {
        
        let gameScore = PFObject(className:"GameScore")
        gameScore["score"] = 1337
        gameScore["playerName"] = "Sean Plott"
        gameScore["cheatMode"] = false
        gameScore.saveInBackground {
            (success: Bool, error: Error?) in
            if (success) {
                // The object has been saved.
                print("SUCESS")
            } else {
                // There was a problem, check error.description
                print("ERROR", error?.localizedDescription ?? "")
            }
        }
        
    }
    
    @IBAction func retriveFromTable(_ sender: UIButton) {
        
        let query = PFQuery(className: "GameScore")
        query.findObjectsInBackground { (objects, error) in
            if let err = error {
                print("ERROR ", err)
                return
            }
            
            print("SUCCESS", objects ?? [Any].self)
        }
        
    }


}

