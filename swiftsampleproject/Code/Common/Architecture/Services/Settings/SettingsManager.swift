//
//  SettingsManager.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 29.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation

// NSObject subclass for DI from storyboard. I was just curious about this feature
class SettingsManager: NSObject {

	static let shared = SettingsManager()
	var settings: Settings {
		didSet {
			UserDefaults.standard.set(settings.toPlist(), forKey: Constants.Defaults.settings)
		}
	}

	override init() {
		let settingsDict = UserDefaults.standard.object(forKey: Constants.Defaults.settings)
		if settingsDict == nil {
			self.settings = Settings(cacheToCoreData: true, cacheToRealm: true, mainCache: .realm, asyncVariant: .procedureKit, networking: .moya)
		} else {
			self.settings = Settings.fromPlist(plist: settingsDict! as! Dictionary<String, Any>)
		}
	}

	func awakeAfter(using aDecoder: NSCoder) -> SettingsManager? {
		return SettingsManager.shared
	}
}
