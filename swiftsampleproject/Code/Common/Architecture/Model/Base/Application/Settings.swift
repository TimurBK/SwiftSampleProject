//
//  Settings.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 26.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation

enum CacheToFetch: Int {
	case coreData = 1
	case realm = 2
}

enum AsyncVariant: Int {
	case procedureKit = 1
	case promiseKit = 2
}

enum Networking: Int {
	case moya = 1
	case urlSession = 2
}

struct Settings {
	var cacheToCoreData: Bool
	var cacheToRealm: Bool
	var mainCache: CacheToFetch
	var asyncVariant: AsyncVariant
	var networking: Networking


	func toPlist() -> Dictionary<String, Any> {
		return [
			"cacheToCoreData": cacheToCoreData,
			"cacheToRealm": cacheToRealm,
			"mainCache": mainCache.rawValue,
			"asyncVariant": asyncVariant.rawValue,
			"networking": networking.rawValue
		]
	}

	static func fromPlist(plist: Dictionary<String, Any>) -> Settings {
		return Settings(cacheToCoreData: plist["cacheToCoreData"]! as! Bool, cacheToRealm: plist["cacheToRealm"]! as! Bool, mainCache: CacheToFetch(rawValue: plist["mainCache"]! as! Int)!, asyncVariant: AsyncVariant(rawValue: plist["asyncVariant"]! as! Int)!, networking: Networking(rawValue: plist["networking"]! as! Int)!)
	}
}
