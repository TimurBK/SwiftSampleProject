//
//  RLMComic.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 31.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation
import RealmSwift

class RLMComic: Object {
	dynamic var remoteId: Int64
	dynamic var digitalId: Int64
	dynamic var title: String
	dynamic var issueNumber: Int64
	dynamic var date: Date
	dynamic var comicDescription: String?
	dynamic var isbn: String
	dynamic var pageCount: Int64
	dynamic var thumbnail: String
	override static func primaryKey() -> String? {
		return "remoteId"
	}
}
