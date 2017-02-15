//
//  ServiceProtocols.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 30.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation

typealias ListUpdate<T> = ([T]?, String?) -> ()
typealias ComicsListUpdate = ListUpdate<Comic>

@objc protocol NetworkManager {
	func fetchComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> ()
}

@objc protocol DataManager {
	func fetchComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> ()
}

@objc protocol LocalStorageManager {
	func fetchComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> ()
	func storeComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> ()
}
