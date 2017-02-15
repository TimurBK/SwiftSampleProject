//
//  AppController.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 01.02.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation

typealias AppControllerCompletion = () -> ()

class AppController: NSObject {
	static let shared = AppController()
	let dataCoordinator: DataCoordinator!

	override init() {
		dataCoordinator = DataCoordinator()
	}

	func awakeAfter(using aDecoder: NSCoder) -> AppController? {
		return AppController.shared
	}
	func configure(completion: @escaping AppControllerCompletion) {
		DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 5 * 1_000_000_000)) {
			completion()
		}
	}
}
