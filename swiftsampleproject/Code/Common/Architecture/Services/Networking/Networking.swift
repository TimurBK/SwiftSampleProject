//
//  Networking.swift
//  swiftsampleproject
//
//  Created by Timur Kuchkarov on 29.01.17.
//  Copyright © 2017 Timur Kuchkarov. All rights reserved.
//

import Foundation

import Moya
import CryptoSwift
import ProcedureKit

class NetworkProvider: NetworkManager {
	let provider = MoyaProvider<MarvelEndpoints>()
	func fetchComics(offset: Int64, settings: Settings, completion: @escaping ComicsListUpdate) -> () {
		switch settings.networking {
			case .moya:
				self.provider.request(.comics(offset: offset)) { result in
					switch result {
						case let .success(moyaResponse): {
							let data = moyaResponse.data // Data, your JSON response is probably in here!
							let statusCode = moyaResponse.statusCode // Int - 200, 401, 500, etc
						}


						case let .failure(error): {
							guard let error = error as? CustomStringConvertible else {
								completion([], "Unknown error")
								break
							}
							completion([], error.description)
						}
					}
			}
			// not implemented yet
			case .urlSession:
				break
		}
	}

	func handleData(data: Data) {

	}
	
	func handleError(data: Data) {

	}
}

extension NetworkProvider {
	func comicsRequest(offset: Int64, settings: Settings) -> URLRequest {
		let path = "/v1/public/comics"
		let ts = Int64(Date().timeIntervalSince1970)
		let hash = "\(ts)\(Constants.Network.privateKey)\(Constants.Network.publicKey)".md5()
		return [
			"orderBy": "onsaleDate",
			"offset" : offset,
			"limit": Constants.Network.pageLimit,
			"apikey": Constants.Network.publicKey,
			"ts": ts,
			"hash": hash
		]
	}
}

enum MarvelEndpoints {
	case comics(offset: Int64)
}

extension MarvelEndpoints : TargetType {
	public var parameterEncoding: ParameterEncoding {
		return URLEncoding.default
	}

	var baseURL: URL { return URL(string: Constants.Network.baseAddress)! }
	var path : String {
		switch self {
		case .comics(_):
			return "/v1/public/comics"
		}
	}
	var method : Moya.Method {
		switch self {
		case .comics(_):
			return .get
		}
	}
	var parameters: [String: Any]? {
		switch self {
		case .comics(let offset):
			let ts = Int64(Date().timeIntervalSince1970)
			let hash = "\(ts)\(Constants.Network.privateKey)\(Constants.Network.publicKey)".md5()
			return [
				"orderBy": "onsaleDate",
				"offset" : offset,
				"limit": Constants.Network.pageLimit,
				"apikey": Constants.Network.publicKey,
				"ts": ts,
				"hash": hash
			]
		}
	}
	var sampleData: Data {
		switch self {
		case .comics(_):
			return "{\"code\":200,\"status\":\"Ok\",\"copyright\":\"© 2017 MARVEL\",\"attributionText\":\"Data provided by Marvel. © 2017 MARVEL\",\"attributionHTML\":\"<a href=\"http://marvel.com\">Data provided by Marvel. © 2017 MARVEL</a>\",\"etag\":\"1c065827207d8b33a0b24cbd7289ad71ed482414\",\"data\":{\"offset\":0,\"limit\":1,\"total\":38914,\"count\":1,\"results\":[{\"id\":16945,\"digitalId\":0,\"title\":\"Rawhide Kid (1960) #118\",\"issueNumber\":118,\"variantDescription\":\"\",\"description\":null,\"modified\":\"-0001-11-30T00:00:00-0500\",\"isbn\":\"\",\"upc\":\"\",\"diamondCode\":\"\",\"ean\":\"\",\"issn\":\"\",\"format\":\"Comic\",\"pageCount\":0,\"textObjects\":[],\"resourceURI\":\"http://gateway.marvel.com/v1/public/comics/16945\",\"urls\":[{\"type\":\"detail\",\"url\":\"http://marvel.com/comics/issue/16945/rawhide_kid_1960_118?utm_campaign=apiRef&utm_source=d490d789753ae8157f59b9a094c4782f\"}],\"series\":{\"resourceURI\":\"http://gateway.marvel.com/v1/public/series/2988\",\"name\":\"Rawhide Kid (1960 - 1979)\"},\"variants\":[],\"collections\":[],\"collectedIssues\":[],\"dates\":[{\"type\":\"onsaleDate\",\"date\":\"-0001-11-30T00:00:00-0500\"},{\"type\":\"focDate\",\"date\":\"-0001-11-30T00:00:00-0500\"}],\"prices\":[{\"type\":\"printPrice\",\"price\":0}],\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available\",\"extension\":\"jpg\"},\"images\":[],\"creators\":{\"available\":1,\"collectionURI\":\"http://gateway.marvel.com/v1/public/comics/16945/creators\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/creators/945\",\"name\":\"Larry Lieber\",\"role\":\"penciler\"}],\"returned\":1},\"characters\":{\"available\":1,\"collectionURI\":\"http://gateway.marvel.com/v1/public/comics/16945/characters\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/characters/1010892\",\"name\":\"Rawhide Kid\"}],\"returned\":1},\"stories\":{\"available\":1,\"collectionURI\":\"http://gateway.marvel.com/v1/public/comics/16945/stories\",\"items\":[{\"resourceURI\":\"http://gateway.marvel.com/v1/public/stories/35559\",\"name\":\"\"Guns Of The Wild North!\"\",\"type\":\"cover\"}],\"returned\":1},\"events\":{\"available\":0,\"collectionURI\":\"http://gateway.marvel.com/v1/public/comics/16945/events\",\"items\":[],\"returned\":0}}]}}".utf8Encoded
		}
	}
	var task: Task {
		switch self {
		case .comics(_):
			return .request
		}
	}
}

private extension String {
		var urlEscaped: String {
			return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
		}

		var utf8Encoded: Data {
			return self.data(using: .utf8)!
		}
}
