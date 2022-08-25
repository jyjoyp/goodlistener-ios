//
//  MyPageViewController.swift
//  GoodListener
//
//  Created by cheonsong on 2022/07/26.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class MyPageVC: UIViewController, SnapKitType {

    weak var coordinator: MyPageCoordinating?
    var disposeBag = DisposeBag()
    
    let navigationView = NavigationView(frame: .zero, type: .setting)
    
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "main_img_step_01")
        $0.layer.cornerRadius = 50
        $0.layer.masksToBounds = true
    }
    
    let nicknameContainer = UIView().then {
        $0.backgroundColor = .m3
        $0.layer.cornerRadius = 6
    }
    
    let nicknameTitleLbl = UILabel().then {
        $0.text = "닉네임"
        $0.font = FontManager.shared.notoSansKR(.bold, 16)
        $0.textColor = .f6
    }
    
    let nicknameLbl = UILabel().then {
        $0.font = FontManager.shared.notoSansKR(.bold, 16)
        $0.textColor = .f3
        $0.text = "굿리스너스피커"
        $0.textAlignment = .center
    }
    
    let tagView = TagView(data: ["20대","여자","직장인","차분한"], isAllSelcted: true).then {
        $0.title.text = "나의 태그"
        $0.line.isHidden = true
    }
    
    let introduceView = GLTextView(maxCount: 30).then {
        $0.title = "소개글"
        $0.contents = "일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사오육칠팔구십일이삼사"
        $0.isEditable = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        addComponents()
        setConstraints()
        bind()
    }
    
    func addComponents() {
        [navigationView, profileImage, nicknameContainer, tagView, introduceView].forEach { view.addSubview($0) }
        [nicknameTitleLbl, nicknameLbl].forEach { nicknameContainer.addSubview($0) }
    }
    
    func setConstraints() {
        navigationView.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(35)
        }
        
        profileImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.top.equalTo(navigationView.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
        }
        
        nicknameContainer.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(28)
            $0.left.right.equalToSuperview().inset(Const.padding)
            $0.height.equalTo(Const.glBtnHeight)
        }
        
        nicknameTitleLbl.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(16)
        }
        
        nicknameLbl.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(nicknameTitleLbl).offset(16)
            $0.right.equalToSuperview().inset(16)
        }
        
        tagView.snp.makeConstraints {
            $0.top.equalTo(nicknameContainer.snp.bottom).offset(26)
            $0.height.equalTo(tagView.tagCollectionViewHeight())
            $0.left.right.equalToSuperview()
        }
        
        introduceView.snp.makeConstraints {
            $0.top.equalTo(tagView.snp.bottom).offset(41)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(introduceView.glTextViewHeight(textViewHeight: 62))
        }
    }
    
    func bind() {
        navigationView.rightBtn.rx.tap
            .bind(onNext: { [weak self] in
                self?.coordinator?.moveToSetting()
            })
            .disposed(by: disposeBag)
    }

}
