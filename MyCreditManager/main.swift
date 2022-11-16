//
//  main.swift
//  MyCreditManager
//
//  Created by sgsim on 2022/11/16.
//

import Foundation

///학생 배열
var studentArr: [Student] = []

///처음 질문
func ask0() {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평정보기, X: 종료")
    
    let input = readLine()
    
    switch input {
    case "1":
        ask1()
    case "2":
        ask2()
    case "3":
        ask3()
    case "4":
        ask4()
    case "5":
        ask5()
    case "X":
        ask6()
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        if input != nil { //컨트롤 D 눌러서 입력 종료할 경우 무한 반복되기 때문에 조건 추가
            ask0()
        }
    }
    
}

///학생 추가
func ask1() {
    print("추가할 학생의 이름을 입력해주세요")
    
    if let input = readLine(),
       input.trimmingCharacters(in: .whitespaces).count > 0 {
        
        if studentArr.contains(where: { $0.name == input }) {
            print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        } else {
            studentArr.append(.init(name: input))
            print("\(input) 학생을 추가했습니다.")
        }
    } else {
        print(failMsg)
    }
    
    ask0()
}

///학생 삭제
func ask2() {
    print("삭제할 학생의 이름을 입력해주세요")
    
    let input = readLine() ?? ""
    
    if let idx = studentArr.firstIndex(where: { $0.name == input }) {
        studentArr.remove(at: idx)
        print("\(input) 학생을 삭제하였습니다.")
    } else {
        print("\(input) 학생을 찾지 못했습니다.")
    }
    
    ask0()
}

///성적 추가
func ask3() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    if let inputArr = readLine()?.split(separator: " "),
       inputArr.count == 3,
       let name = inputArr.first,
       let score = inputArr.last,
       let idx = studentArr.firstIndex(where: { $0.name == name }),
       gradeValue.contains(where: { $0.key == score }) {
        
        let subject = String(inputArr[1])
        studentArr[idx].gradeDic[subject] = String(score)
        
        print("\(name) 학생의 \(subject) 과목이 \(score)로 추가(변경)되었습니다.")
    } else {
        print(failMsg)
    }
    
    ask0()
}

///성적 삭제
func ask4() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift")
    
    if let inputArr = readLine()?.split(separator: " "),
       inputArr.count == 2,
       let name = inputArr.first,
       let subject = inputArr.last {
        
        if let idx = studentArr.firstIndex(where: { $0.name == name }) {
            
            studentArr[idx].gradeDic.removeValue(forKey: String(subject))
            print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
        } else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    } else {
        print(failMsg)
    }
    
    ask0()
}

///평점 보기
func ask5() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    
    let input = readLine() ?? ""
    
    if let student = studentArr.first(where: { $0.name == input }) {
        student.printRating()
    } else {
        print("\(input) 학생을 찾지 못했습니다.")
    }
    
    ask0()
}

///종료
func ask6() {
    print("프로그램을 종료합니다...")
}

ask0()
