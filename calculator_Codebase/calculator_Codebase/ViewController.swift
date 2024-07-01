//
//  ViewController.swift
//  calculator_Codebase
//
//  Created by 단예진 on 6/25/24.
//

import UIKit
import SnapKit


#Preview {
    ViewController()
}


class ViewController: UIViewController {
    
    //숫자, 연산자, AC -> horizontalStack -> 4줄의 verticalStack
    /* [AC +/- % /] Fill Equallly
     [7, 8, 9, X] Fill Equallly
     [4, 5, 6, -] Fill Equallly
     [1, 2, 3, +] Fill Equallly
     [0, . =]     Fill Proportionally?*/
    
    //한줄의 HorizontalStack 만들기
    //네줄의 VerticalStack으로 합치기
    //네모버튼을 원으로 만들기
    
    let label = UILabel()
    let horizontalStackView = UIStackView()
    let verticalStackView = UIStackView()
    let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
            
            //label 속성
            label.text = "12345"
            label.textColor = .white
            label.textAlignment = .right
            label.font = .boldSystemFont(ofSize: 60)
            label.translatesAutoresizingMaskIntoConstraints = false
        
        
        
            //UIButton 속성
            button.setTitle("1", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40
            button.translatesAutoresizingMaskIntoConstraints = false
        
            //horizontalStackView 속성
    
            
            //verticalStackView 속성
            verticalStackView.axis = .vertical
            verticalStackView.backgroundColor = .white
            verticalStackView.spacing = 10
            verticalStackView.distribution = .fillEqually
            verticalStackView.translatesAutoresizingMaskIntoConstraints = false
            
            
            
            
            //뷰 생성
            [label, button, verticalStackView]
                .forEach { view.addSubview($0) }
            
            //label 제약조건
            label.snp.makeConstraints {
                $0.height.equalTo(100)
                $0.centerX.equalToSuperview().offset(30)
                $0.top.equalToSuperview().offset(200)
            }
            
            //button 제약조건
            button.snp.makeConstraints {
                $0.width.height.equalTo(80)
                $0.center.equalToSuperview()
            }
            
            //verticalStackView 제약조건
            verticalStackView.snp.makeConstraints {
                $0.width.equalTo(350)
                $0.top.equalTo(label.snp.bottom).offset(60)
                $0.centerX.equalToSuperview()
            }
            //        - top = label 의 bottom 으로 부터 60 떨어지도록.
            
            
            
        }
        
    }
    
    //let buttonTitles = [
    //    ["AC", "+/-", "%", "/"],
    //    ["7", "8", "9", "X"],
    //    ["4", "5", "6", "-"],
    //    ["1", "2", "3", "+"],
    //    ["0", ".", "="]
    //]
    //
    //for row in buttonTitles {
    //    let horizontalStackView = UIStackView()
    //    horizontalStackView.axis = .horizontal
    //    horizontalStackView.backgroundColor = .black
    //    horizontalStackView.spacing = 10
    //    horizontalStackView.distribution = .fillEqually
    //}

