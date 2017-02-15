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
import ProcedureKit
import PromiseKit

class LocalStorage: LocalStorageManager {
	let realmProcedureQueue: ProcedureQueue
	let coreDataProcedureQueue: ProcedureQueue

	let internalRealmDispatchQueue: DispatchQueue
	let internalCoreDataDispatchQueue: DispatchQueue
	let realm : Realm!
	let coreData: NSPersistentContainer

	override init() {
		internalRealmDispatchQueue = DispatchQueue(label: "me.t-91.swiftsampleproject.localstoragerealmqueue")
		internalCoreDataDispatchQueue = DispatchQueue(label: "me.t-91.swiftsampleproject.localstoragecoredataqueue")
		realmProcedureQueue = ProcedureQueue()
		coreDataProcedureQueue = ProcedureQueue()
		realmProcedureQueue.name = "me.t-91.swiftsampleproject.localstoragerealmprocedurequeue";
		realmProcedureQueue.underlyingQueue = internalRealmDispatchQueue
		coreDataProcedureQueue.name = "me.t-91.swiftsampleproject.localstoragecoredataprocedurequeue";
		coreDataProcedureQueue.underlyingQueue = internalCoreDataDispatchQueue
		internalRealmDispatchQueue.sync {
			realm = try! Realm()
		}
	}

	func fetchComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> () {
		completion()
	}

	func storeComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> () {
		completion()
	}
	
}
