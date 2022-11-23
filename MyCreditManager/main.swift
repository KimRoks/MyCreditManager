//
//  main.swift
//  MyCreditManager
//
//  Created by 김경록 on 2022/11/23.
//

import Foundation



var studentList : [String] = [] //학생 리스트

var subjectGrade: [Substring:Substring] = [:]//학생 과목점수

var control : Bool = true
while (control) {
    print("원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X:종료")
    let userInput = readLine()
    switch userInput{
    case "1"://학생추가
        print("추가할 학생의 이름을 입력해주세요")
        let studentName = readLine()!
        if (studentName.isEmpty) {
            print("입력이 잘못되었습니다. 다시 확인해주세요")
        }else if (studentList.contains(studentName) == false){
            studentList.append(studentName)
            print("\(studentName) 학생을 추가했습니다")
            print(studentList)
        }else if (studentList.contains(studentName) == true){
            print("\(studentName)은 이미 존재하는 학생입니다 추가하지 않습니다")
        }
        break
    case "2"://삭제
        print("삭제할 학생의 이름을 입력해주세요")
        let studentName = readLine()!
        if (studentList.contains(studentName) == false){
            print("\(studentName) 학생을 찾지못했습니다")
        }else if (studentList.contains(studentName) == true){
            if let index = studentList.firstIndex(of: "\(studentName)") {
                studentList.remove(at: index)
                print("\(studentName) 학생을 삭제했습니다")
                print(studentList)
            }
            
        }
        break
    case "3"://성적추가 및 변경
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey swfit A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다")
        
        
        
        let inputScore = readLine()!.split(separator: " ")
        
        
        if(inputScore.isEmpty){
            print("입력이 잘못되었습니다. 다시 확인해주세요")
        }else{
            let userName = inputScore[0]
            let userSubject = inputScore[1]
            let userGrade = inputScore[2]
            if (studentList.contains(String(userName)) == true){
                subjectGrade.updateValue(userGrade, forKey: userName + " " + userSubject)
                print(subjectGrade)
            } else if (studentList.contains(String(userName)) == false){
                print("입력x")
                
            }
        }
        
        break
    case "4"://성적 삭제
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요\n입력예) Mickey Swift")
        let userInput = readLine()!.split(separator: " ")
        print(userInput)
        if(userInput.isEmpty){
            print("입력이 잘못되었습니다. 다시 확인해주세요")
            
        }else{
            
            if (subjectGrade.keys.contains(userInput[0]+" "+userInput[1]) == true ) {
                
                subjectGrade[userInput[0]+" "+userInput[1]] = nil
                print("\(userInput[0])학생의 \(userInput[1])과목의 성적이 삭제됐습니다")
            }else if(subjectGrade.keys.contains(userInput[0]+" "+userInput[1]) == false) {
                print("\(userInput[0])학생을 찾지 못했습니다")
                print(subjectGrade)
                //            }else if (subjectGrade.keys.contains(userInput[0]) == false){
                //                print("입력이 잘못됐습니다. 다시 확인해주세요")
                //            }
            }
        }
        //
        
                   
                   
                   
                   
                   
                   
            break
        case "5"://평정보기
        
      
        
        
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        
        
        
        let userInput = readLine()!
        if userInput.isEmpty{
            print("입력이 잘못되었습니다 다시 확인해주세요")
        }else if studentList.contains(userInput) == false{
            print("\(userInput)힉생을 찾지 못했습니다")
        }else if studentList.contains(userInput) == true {
            print(subjectGrade["userInput"]!)
        }
        
            break
    
        case "X":
            control = false
            break
        default:
            print("뭔가 입력이 잘못됐습니다. 1~5사이의 숫자 혹은 X를 입력해주세요.")
            break
    
        
    }
    
    
    
    
    
    
    
    
}
//
