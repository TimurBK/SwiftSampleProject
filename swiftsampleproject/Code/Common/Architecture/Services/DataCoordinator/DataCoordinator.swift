//
//  DataCoordinator.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 29.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation
import Moya
import Unbox


class DataCoordinator : NSObject, DataManager {
	static let shared = DataCoordinator()
	let localStorage: LocalStorageManager
	let networking: NetworkManager

	override init() {

	}

	func awakeAfter(using aDecoder: NSCoder) -> DataCoordinator? {
		return DataCoordinator.shared
	}

	func fetchComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> () {
		self.localStorage.fetch
	}
}
