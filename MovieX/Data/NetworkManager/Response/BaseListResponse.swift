//
//  BaseListResponse.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

class BaseListResponse: Codable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?

    private enum CodingKeys: String, CodingKey {
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case page
    }
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        page = try container.decode(Int.self, forKey: .page)
        totalResults = try container.decode(Int.self, forKey: .totalResults)
        totalPages = try container.decode(Int.self, forKey: .totalPages)
    }
}

class BaseListResponseWithBody<T: Codable>: BaseListResponse {
    
    var results: [T]?

    private enum CodingKeys: String, CodingKey {
        case results
    }
    override init() { super.init() }

    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([T].self, forKey: .results)
    }
}
