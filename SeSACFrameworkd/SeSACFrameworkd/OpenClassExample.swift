//
//  OpenClassExample.swift
//  SeSACFrameworkd
//
//  Created by 권현석 on 2023/08/29.
//

import Foundation

open class ClassOpenExample {
    
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
}

public class ClassPublicExample {
    
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
}

//접근 제한의 디폴트 값은 internal임
class ClassExample {
    
    private static func privateExample() {
        print(#function)
    }
    
    fileprivate static func fileprivateExample() {
        print(#function)
    }
    
    internal static func internalExample() {
        print(#function)
    }
    
    public static func publicExample() {
        print(#function)
    }
}
