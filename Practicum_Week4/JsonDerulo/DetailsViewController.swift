//
//  DetailsViewController.swift
//  JsonDerulo
//
//  Created by Fhict on 28/03/16.
//  Copyright © 2016 Fhict. All rights reserved.
//

import UIKit


class DetailsViewController: UIViewController {
    
    var selectedPirate: Pirate?
    
    //Alle UI elementen
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var lbl_life: UILabel!
    @IBOutlet weak var lbl_time_active: UILabel!
    @IBOutlet weak var lbl_country_of_birth: UILabel!
    @IBOutlet weak var lbl_comments: UILabel!
    
    override func viewDidLoad() {
        print("Detail view is geladen")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //zet de juiste waarden in de labels wanneer de view geladen is
        self.lbl_name.text = self.selectedPirate?.name
        self.lbl_life.text = self.selectedPirate?.life
        self.lbl_time_active.text = self.selectedPirate?.years_active
        self.lbl_country_of_birth.text = self.selectedPirate?.country_of_origin
        self.lbl_comments.text = self.selectedPirate?.comments
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
