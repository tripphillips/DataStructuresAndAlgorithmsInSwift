//
//  StackChallenge.swift
//  Stack
//
//  Created by Trip Phillips on 4/26/22.
//

import Foundation
import Stack

class StackChallenge_1_ReverseAnArray<Element> {
    
    private var stack: Stack<Element>

    init(_ array: [Element]) {
        self.stack = Stack<Element>(array)
    }
    
    func reverseArray() -> [Element] {
        var reversedArray = [Element]()
        
        while !stack.isEmpty() {
            guard let element = stack.pop() else { return reversedArray }
            reversedArray.append(element)
        }
        
        return reversedArray
    }
}

class StackChallenge_2_BalanceParentheses {
    
    private var strWithParentheses: String
    
    init(_ strWithParentheses: String) {
        self.strWithParentheses = strWithParentheses
    }
    
    func isStrWithParenthesesBalanced() -> Bool {
        
        var stack = Stack<Character>()
        
        var pairDict: [Character: Character] = [")": "(",
                                                "]": "[",
                                                "}": "{"]
        
        for char in strWithParentheses {
            
            print(stack.debugDescription)
            switch char {
            case "(", "[", "{":
                stack.push(char)
            case ")", "]", "}":
                if stack.isEmpty() {
                    return false
                } else {
                    if stack.peek() == pairDict[char] {
                        stack.pop()
                    }
                }
            default: break
            }
        }
        return stack.isEmpty()
    }
}
