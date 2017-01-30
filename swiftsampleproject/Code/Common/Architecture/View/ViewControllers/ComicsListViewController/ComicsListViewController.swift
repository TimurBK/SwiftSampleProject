//
//  ComicsListViewController.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 29.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import UIKit

class ComicsListViewController: UIViewController {

	@IBOutlet var settingsManager: SettingsManager!
	@IBOutlet var dataCoordinator: DataCoordinator!

    override func viewDidLoad() {
        super.viewDidLoad()

		self.dataCoordinator.fetchComics(offset: 0) { (comics, string) in
			print("error = \(string)")
			print("comics = \(comics)")
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
