//
//  TargetType+Extensions.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Moya

extension TargetType {
    
    func checkIfEquals(target: TargetType) -> Bool {
        let methodEquals = self.method == target.method
        let pathEquals = self.path == target.path
        let task1 = "\(self.task)"
        let task2 = "\(target.task)"
        let taskEquals = task1.sorted() == task2.sorted()
        
        if methodEquals && pathEquals && taskEquals {
            return true
        } else {
            print("target do not match")
            print("methodEquals: \(methodEquals)")
            print("pathEquals: \(pathEquals)")
            print("taskEquals: \(taskEquals)")
            print(task1)
            print(task2)
            return false
        }
    }
}
