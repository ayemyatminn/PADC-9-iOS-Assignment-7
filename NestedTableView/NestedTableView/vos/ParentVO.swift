//
//  ParentVO.swift
//  NestedTableView
//
//  Created by Aye Myat Minn on 9/15/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import Foundation

struct ParentVO: Codable {
    var id: Int?
    var parentName: String?
    var childs: [ChildVO]?
}
