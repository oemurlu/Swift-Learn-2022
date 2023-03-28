//
//  ViewController.swift
//  Snapkit-Exercise
//
//  Created by Osman Emre Ömürlü on 28.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var redSquareView = UIView(frame: .zero)
    lazy var greenSquareView = UIView(frame: .zero)
    lazy var blueSquareView = UIView(frame: .zero)
    lazy var yellowSquareView = UIView(frame: .zero)
    lazy var orangeSquareView = UIView(frame: .zero)
    let boxWidth: CGFloat = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        // colouring
        redSquareView.backgroundColor = .red
        greenSquareView.backgroundColor = .green
        blueSquareView.backgroundColor = .blue
        yellowSquareView.backgroundColor = .yellow
        orangeSquareView.backgroundColor = .orange
        
        // add subviews
        [redSquareView, greenSquareView, blueSquareView, yellowSquareView, orangeSquareView].forEach { box in
            view.addSubview(box)
        }
        
        // top-left
        redSquareView.snp.makeConstraints { make in
//            make.width.height.equalTo(boxWidth).offset(80)
//            make.top.leading.equalToSuperview()
//            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(40) // top ve left safeArea'ya hizalar istersen sonuna .offset(40) yazarak 40px padding verebilirsin.
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top) // top kismini safeArea'nin ustune hizalar.
//            make.leading.centerY.equalToSuperview()
            
//            make.width.height.equalTo(boxWidth)
//            make.top.equalToSuperview().offset(80)
//            make.leading.equalToSuperview().offset(40)
            
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(80)
            make.top.leading.equalToSuperview()
        }
        
        // ensures that all pending layout operations complete
        view.layoutIfNeeded()
        
        //update top padding to 200px with animation after 1 seconds delay
        UIView.animate(withDuration: 0.5, delay: 1.0) {
            self.redSquareView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(200)
            }
            // trigger layout update
               self.view.layoutIfNeeded()
        }
        
        // top-right
        greenSquareView.snp.makeConstraints { make in
//            make.width.height.equalTo(boxWidth)
//            make.top.trailing.equalToSuperview()
//            make.trailing.centerY.equalToSuperview()
            
//            make.top.equalToSuperview()
//            make.trailing.equalToSuperview().offset(-40)
            
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(80)
            make.top.trailing.equalToSuperview()
        }
        
        // bottom-left
        blueSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.bottom.leading.equalToSuperview()
        }
        
        // bottom-right
        yellowSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.bottom.trailing.equalToSuperview()
        }
        
        // center
        orangeSquareView.snp.makeConstraints { make in
            make.width.height.equalTo(boxWidth)
            make.center.equalToSuperview()
            
//            make.height.equalTo(boxWidth)
//            make.leading.trailing.equalToSuperview()
//            make.top.equalToSuperview()
            
            // sag ve sol icin ayri ayri .offset vermek yerine .inset vererek sag ve soldan kolayca padding verebiliriz
            make.leading.trailing.equalToSuperview().inset(40)
        }
    }


}

