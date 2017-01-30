//
//  Comic.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 29.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation

struct Comic {
	let remoteId: Int64
	let digitalId: Int64
	let title: String
	let issueNumber: Int64
	let date: Date
	let comicDescription: String
	let isbn: String
	let pageCount: Int64
	let thumbnail: String
}
//{
//	"id": 16945,
//	"digitalId": 0,
//	"title": "Rawhide Kid (1960) #118",
//	"issueNumber": 118,
//	"variantDescription": "",
//	"description": null,
//	"modified": "-0001-11-30T00:00:00-0500",
//	"isbn": "",
//	"upc": "",
//	"diamondCode": "",
//	"ean": "",
//	"issn": "",
//	"format": "Comic",
//	"pageCount": 0,
//	"textObjects": [],
//	"resourceURI": "http://gateway.marvel.com/v1/public/comics/16945",
//	"urls": [
//	{
//	"type": "detail",
//	"url": "http://marvel.com/comics/issue/16945/rawhide_kid_1960_118?utm_campaign=apiRef&utm_source=d490d789753ae8157f59b9a094c4782f"
//	}
//	],
//	"series": {
//		"resourceURI": "http://gateway.marvel.com/v1/public/series/2988",
//		"name": "Rawhide Kid (1960 - 1979)"
//	},
//	"variants": [],
//	"collections": [],
//	"collectedIssues": [],
//	"dates": [
//	{
//	"type": "onsaleDate",
//	"date": "-0001-11-30T00:00:00-0500"
//	},
//	{
//	"type": "focDate",
//	"date": "-0001-11-30T00:00:00-0500"
//	}
//	],
//	"prices": [
//	{
//	"type": "printPrice",
//	"price": 0
//	}
//	],
//	"thumbnail": {
//		"path": "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
//		"extension": "jpg"
//	},
//	"images": [],
//	"creators": {
//		"available": 1,
//		"collectionURI": "http://gateway.marvel.com/v1/public/comics/16945/creators",
//		"items": [
//		{
//		"resourceURI": "http://gateway.marvel.com/v1/public/creators/945",
//		"name": "Larry Lieber",
//		"role": "penciler"
//		}
//		],
//		"returned": 1
//	},
//	"characters": {
//		"available": 1,
//		"collectionURI": "http://gateway.marvel.com/v1/public/comics/16945/characters",
//		"items": [
//		{
//		"resourceURI": "http://gateway.marvel.com/v1/public/characters/1010892",
//		"name": "Rawhide Kid"
//		}
//		],
//		"returned": 1
//	},
//	"stories": {
//		"available": 1,
//		"collectionURI": "http://gateway.marvel.com/v1/public/comics/16945/stories",
//		"items": [
//		{
//		"resourceURI": "http://gateway.marvel.com/v1/public/stories/35559",
//		"name": "\"Guns Of The Wild North!\"",
//		"type": "cover"
//		}
//		],
//		"returned": 1
//	},
//	"events": {
//		"available": 0,
//		"collectionURI": "http://gateway.marvel.com/v1/public/comics/16945/events",
//		"items": [],
//		"returned": 0
//	}
//}
