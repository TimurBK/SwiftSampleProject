//
//  LocalStorage.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 31.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation
import RealmSwift
import CoreData

class LocalStorage: LocalStorageManager {
	let internalRealmDispatchQueue: DispatchQueue
	let internalCoreDataDispatchQueue: DispatchQueue
	let realm : Realm!
	let coreData: NSPersistentContainer

	override init() {
		internalRealmDispatchQueue = DispatchQueue(label: "me.t-91.swiftsampleproject.localstoragerealmqueue")
		internalCoreDataDispatchQueue = DispatchQueue(label: "me.t-91.swiftsampleproject.localstoragecoredataqueue")
		internalRealmDispatchQueue.sync {
			realm = try! Realm()
		}
	}

	
}
