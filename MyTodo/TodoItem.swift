//
//  TodoItem.swift
//  MyTodo
//
//  Created by yuanhang tangle on 2021/10/27.
//  Copyright © 2021 yuanhang. All rights reserved.
//

import UIKit

class TodoItem: NSObject,Encodable, Decodable{
    var title: String
    var isChecked: Bool
    
    init(title: String, isChecked: Bool){
        self.title = title
        self.isChecked = isChecked
    }
}
