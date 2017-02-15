//
//  DataCoordinator.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 29.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation
import PromiseKit
import ProcedureKit

class DataCoordinator : NSObject, DataManager {
	static let shared = DataCoordinator()
//	let localStorage: LocalStorage!
//	let networking: NetworkProvider!

	override init() {
	}

	func confugure() -> () {

	}

	func configurePromiseKit() -> () {

	}

	func awakeAfter(using aDecoder: NSCoder) -> DataCoordinator? {
		return DataCoordinator.shared
	}

	func fetchComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> () {
		completion()
//		self.localStorage.fetch
	}
}
