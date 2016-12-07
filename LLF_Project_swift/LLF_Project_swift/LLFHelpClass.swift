//
//  LLFHelpClass.swift
//  LLF_Project_swift
//
//  Created by Apple on 16/12/7.
//  Copyright © 2016年 LLF. All rights reserved.
//

import UIKit

class LLFHelpClass: NSObject {

    /// 输出日志
    ///
    /// - Parameters:
    ///   - message: 日志消息
    ///   - function: 文件名
    ///   - file: 方法名
    ///   - line: 代码行数
    func log(message:String,
             function:String = #function,
             file:String = #file,
             line:Int = #line) -> () {
        print("Message \"\(message)\" (File: \(file), Function: \(function), Line\(line))")
    }
    
    /// RGB色值设置
    ///
    /// - Parameters:
    ///   - r: 红色色值
    ///   - g: 绿色色值
    ///   - b: 蓝色色值
    ///   - alpha: 透明度
    /// - Returns: 色值
    func RGB(r:CGFloat,
             g:CGFloat,
             b:CGFloat,
             alpha:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    
    
    /// 判断是否为iOS8
    ///
    /// - Returns: 布尔值
    func IS_IOS8() -> Bool {
        return (IOSVersion() >= 8.0 && IOSVersion() < 9.0)
    }
    
    /// 判断是否为iOS7
    ///
    /// - Returns: 布尔值
    func IS_IOS7() -> Bool {
        return (IOSVersion() >= 7.0 && IOSVersion() < 8.0)
    }
    
    /// 根据类名创建控制器
    ///
    /// - Parameter className: 类名
    /// - Returns: 控制器名称
    func ClassFromString(className:String) -> UIViewController? {
        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName")
        let name = "\(appName!).\(className)"
        if let tmpClass = NSClassFromString(name) as? UIViewController.Type {
            return tmpClass.init()
        }
        else {
            return nil
        }
    }
    
    /// 判断字符串是否为空
    ///
    /// - Parameter string: 字符串
    /// - Returns: 布尔值
    func IS_Empty(string:String) -> Bool {
        if string.isEmpty || string == "" {
            return true
        }
        else {
            return false
        }
    }

    /// 字体大小设置
    ///
    /// - Parameters:
    ///   - name: 字体名字(为空就设置默认字体)
    ///   - size: 字体大小
    /// - Returns: 字体大小
    func kFont(name:String,
               size:CGFloat) -> UIFont {
        if !IS_Empty(string: name) {
            return UIFont(name: name, size: size)!
        }
        else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    /// 屏幕宽度
    ///
    /// - Returns: 宽度
    func Screen_Width() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }

    /// 屏幕高度
    ///
    /// - Returns: 高度
    func Screen_Height() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }

}

/// 获取系统版本
///
/// - Returns: 版本号
func IOSVersion() -> Double {
    return (UIDevice.current.systemVersion as NSString).doubleValue
}
