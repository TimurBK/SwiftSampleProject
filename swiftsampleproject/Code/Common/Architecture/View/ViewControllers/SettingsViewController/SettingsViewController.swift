//
//  SettingsViewController.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 29.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import UIKit

// We don't check if settings make sense here in this demo. Probably we should check if at least one cache is enabled
class SettingsViewController: UIViewController {

	// MARK: - Properties

	@IBOutlet private var settingsManager: SettingsManager!
	@IBOutlet private var dataCoordinator: DataCoordinator!

	@IBOutlet private var saveToCoreData: UILabel!
	@IBOutlet private var saveToRealm: UILabel!
	@IBOutlet private var mainCache: UILabel!
	@IBOutlet private var mainCacheSwitcher: UISegmentedControl!
	@IBOutlet private var coreDataSwitch: UISwitch!
	@IBOutlet private var realmSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.localize()
		self.updateSettings()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Private

	private func localize() {
		// Use localized strings in prod apps etc
		self.saveToRealm.text = "Сохранять в Realm"
		self.saveToCoreData.text = "Сохранять в Core Data"
		self.mainCache.text = "Использовать как основной кэш\nЗагружает из него при отсутствии сети"
		self.mainCacheSwitcher.setTitle("Core Data", forSegmentAt: 0)
		self.mainCacheSwitcher.setTitle("Realm", forSegmentAt: 1)
	}

	private func updateSettings() {
		self.coreDataSwitch.isOn = self.settingsManager.settings.cacheToCoreData
		self.realmSwitch.isOn = self.settingsManager.settings.cacheToRealm
		self.mainCacheSwitcher.selectedSegmentIndex = self.settingsManager.settings.mainCache.rawValue - 1
	}

	// MARK: - Actions

	@IBAction func coreDataSwitchChanged(_ sender: UISwitch) {
		// could be closure or smth like that if more actions needed
		self.settingsManager.settings.cacheToCoreData = sender.isOn
	}

	@IBAction func realmSwitchChanged(_ sender: UISwitch) {
		// could be closure or smth like that if more actions needed
		self.settingsManager.settings.cacheToRealm = sender.isOn
	}
	
	@IBAction func mainCacheSelectionChanged(_ sender: UISegmentedControl) {
		// "bang" here as wrong index will be programmer error
		self.settingsManager.settings.mainCache = CacheToFetch(rawValue:sender.selectedSegmentIndex + 1)!
	}
}
