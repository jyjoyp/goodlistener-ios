//
//  GLTextField.swift
//  GoodListener
//
//  Created by cheonsong on 2022/08/26.
//

import Foundation
import UIKit

class GLTextField: UIView, SnapKitType {
    
    let titleLbl = UILabel().then {
        $0.text = "닉네임"
        $0.font = FontManager.shared.notoSansKR(.bold, 16)
        $0.textColor = .f3
    }
    
    let tfContainer = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let inputTf = UITextField().then {
        $0.borderStyle = .none
        $0.font = FontManager.shared.notoSansKR(.regular, 16)
    }
    
    let checkBtn = UIButton().then {
        $0.title = "중복확인"
        $0.titleColor = .f4
        $0.font = FontManager.shared.notoSansKR(.regular, 14)
        $0.backgroundColor = .clear
        $0.isUserInteractionEnabled = false
    }
    
    let tfUnderLine = UIView().then {
        $0.backgroundColor = .black
    }
    
    let limitLbl = UILabel().then {
        $0.text = "*한글/영문 + 숫자로 10글자까지 가능합니다."
        $0.textColor = .f4
        $0.font = FontManager.shared.notoSansKR(.regular, 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addComponents() {
        [titleLbl, tfContainer].forEach { addSubview($0) }
        [inputTf, checkBtn, tfUnderLine, limitLbl].forEach { tfContainer.addSubview($0) }
    }
    
    func setConstraints() {
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().inset(Const.padding)
        }
        
        tfContainer.snp.makeConstraints {
            $0.top.equalTo(titleLbl.snp.bottom).offset(35)
            $0.left.right.equalToSuperview().inset(Const.padding)
        }
        
        inputTf.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        
        checkBtn.snp.makeConstraints {
            $0.right.top.equalToSuperview()
            $0.left.equalTo(inputTf.snp.right).offset(10)
            $0.width.equalTo(52)
            $0.height.equalTo(20)
        }
        
        tfUnderLine.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview()
            $0.top.equalTo(inputTf.snp.bottom).offset(5)
        }
        
        limitLbl.snp.makeConstraints {
            $0.top.equalTo(tfUnderLine.snp.bottom).offset(10)
            $0.left.bottom.equalToSuperview()
        }
        
    }
}
