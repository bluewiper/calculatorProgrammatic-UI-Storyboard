//
//  ViewController.swift
//  calculator_Codebase
//
//  Created by 단예진 on 6/25/24.


import UIKit
import SnapKit

//코드베이스 과제용

/*
 버튼 생성: 버튼들을 배열로 만들어서 반복적으로 생성할 수 있도록 합니다.
 스택뷰 생성: 각 행의 버튼들을 담을 수 있는 UIStackView를 생성합니다.
 스택뷰를 수직으로 배치: 계산기의 버튼 배열을 수직으로 쌓을 수 있는 UIStackView를 생성합니다.
 버튼 액션 설정: 각 버튼에 대한 액션 메서드를 정의하고 버튼에 연결
 */


#Preview {
    ViewController()
}



class ViewController: UIViewController {
    
    //label
    var label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        //Label Configuration
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.translatesAutoresizingMaskIntoConstraints = false
        //label view 생성
        view.addSubview(label)
        
        //label Constraints
        label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.centerY.equalTo(200)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            
        }
        
        
        // Button titles
        let buttonTitles = [
            ["AC", "+/-", "%", "/"],
            ["7", "8", "9", "x"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "+"],
            ["0", ".", "="]
        ]
        
        
        //VerticalStackView Configuration
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fill
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //VerticalStackView view 생성
        view.addSubview(verticalStackView)
        
        //verticalStackView Constraints
        
        verticalStackView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
        }
        
        // 버튼 생성 및 배치
        for rowTitles in buttonTitles {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fill
            rowStackView.translatesAutoresizingMaskIntoConstraints = false
            
            for title in rowTitles {
                let button = UIButton(type: .system)
                if let titleLabel = button.titleLabel {
                    titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
                }
                if ["AC", "+/-", "%", "+", "-", "x", "/", "-", ".", "="].contains(title) {
                    button.backgroundColor = .orange
                } else {
                    button.backgroundColor = .gray
                }
                button.setTitle(title, for: .normal)
                button.setTitleColor(.white, for: .normal)
                
                button.layer.cornerRadius = 40
                rowStackView.addArrangedSubview(button)
                button.snp.makeConstraints {
                    $0.width.height.equalTo(80)
                    
                    rowStackView.addArrangedSubview(button)
                }
                
                verticalStackView.addArrangedSubview(rowStackView)
            }
        }
    }
}
