//
//  Student.swift
//  MyCreditManager
//
//  Created by gonigon on 2022/11/16.
//

import Foundation

///학생 모델
struct Student {
    ///이름
    var name: String
    ///과목: 성적
    var gradeDic: [String: String] = [:]
    ///평점
    func printRating() {
        gradeDic.forEach {
            print("\($0.key): \($0.value)")
        }
        
        let rating = gradeDic.compactMap {
            gradeValue[$0.value]
        }.reduce(0, +) / Float(gradeDic.count)
        
        let numberFomatter = NumberFormatter()
        numberFomatter.roundingMode = .floor // 형식을 버림으로 지정
        numberFomatter.maximumSignificantDigits = 3  // 자르길 원하는 자릿수

        let ratingStr = numberFomatter.string(for: rating) ?? ""
        
        print("평점 : \(ratingStr)")
    }
}
