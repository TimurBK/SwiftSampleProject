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
	dynamic var remoteId: Int64 = 0
	dynamic var digitalId: Int64 = 0
	dynamic var title: String = ""
	dynamic var issueNumber: Int64 = 0
	dynamic var date: Date = Date(timeIntervalSince1970: 0)
	dynamic var comicDescription: String? = nil
	dynamic var isbn: String = ""
	dynamic var pageCount: Int64 = 0
	dynamic var thumbnail: String = ""
	override static func primaryKey() -> String? {
		return "remoteId"
	}

	init(comic: Comic) {
		remoteId = comic.remoteId
		digitalId = comic.digitalId
		title = comic.title
		issueNumber = comic.issueNumber
		date = comic.date
		comicDescription = comic.comicDescription
		isbn = comic.isbn
		pageCount = comic.pageCount
		thumbnail = comic.thumbnail
	}
}
