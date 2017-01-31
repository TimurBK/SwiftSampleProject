//
//  StartingViewController.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 01.02.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {

	@IBOutlet var activityIndicator: UIActivityIndicatorView!
	@IBOutlet var helpLabel: UILabel!
	@IBOutlet var appController: AppController!

    override func viewDidLoad() {
        super.viewDidLoad()
		self.appController.configure {
			self.performSegue(withIdentifier: Constants.Segues.startingControllerToTabController, sender: self)
		}
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
