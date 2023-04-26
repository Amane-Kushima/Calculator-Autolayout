//
//  styleProgramatically.swift
//  Calculator Layout iOS13
//
//  Created by Kushima Amane on 2023/04/21.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class styleProgramatically: UIViewController {
    private var btnPressed: Bool = false
    private var label: UILabel = UILabel()
    private var numberText: String = "0"
    private var laterComer: String = ""
    private var isNumberTapped: Bool = false
    private var isOperandTapped: Bool = false
    private var calcResult: String = ""
    private var tappedBtnArr: Array<UIButton> = []
    private var isNegative: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        let parentStackView = stackViewGenarator(stackDirection: .vertical) // 最上位のstackView
        parentStackView.distribution = .fillEqually
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(parentStackView)
        NSLayoutConstraint.activate([
            parentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            parentStackView.topAnchor.constraint(equalTo: view.topAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            parentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        // 一段目 =========================================
        let padding: CGFloat = 20
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        label.text = numberText
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.textAlignment = NSTextAlignment.right
        label.font = label.font.withSize(50)
        label.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(label) // viewにlabelの追加
        parentStackView.addArrangedSubview(baseView) // parentStackViewにviewの追加
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -padding),
            label.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
        ])
        // ======================================================
        // 2段目 =================================================
        let stackView2 = stackViewGenarator(stackDirection: .horizontal)
        let acBtn = buttonGenerator(color: UIColor.buttonColor.darkGray, buttonName: K.operands().AC)
        if #available(iOS 14.0, *) {
            acBtn.addAction(UIAction { _ in
                self.buttonRecognizer(acBtn)
            }, for: .touchUpInside)
        }
        let plusMinusBtn = buttonGenerator(color: UIColor.buttonColor.darkGray, buttonName: K.operands().negative)
        if #available(iOS 14.0, *) {
            plusMinusBtn.addAction(UIAction { _ in
                self.buttonRecognizer(plusMinusBtn)
            }, for: .touchUpInside)
        }
        let percentBtn = buttonGenerator(color: UIColor.buttonColor.darkGray, buttonName: K.operands().percent)
        if #available(iOS 14.0, *) {
            percentBtn.addAction(UIAction { _ in
                self.buttonRecognizer(percentBtn)
            }, for: .touchUpInside)
        }
        let devideBtn = buttonGenerator(color: UIColor.buttonColor.orange, buttonName: K.operands().devision)
        if #available(iOS 14.0, *) {
            devideBtn.addAction(UIAction { _ in
                self.buttonRecognizer(devideBtn)
            }, for: .touchUpInside)
        }
        stackView2.addArrangedSubview(acBtn)
        stackView2.addArrangedSubview(plusMinusBtn)
        stackView2.addArrangedSubview(percentBtn)
        stackView2.addArrangedSubview(devideBtn)
        parentStackView.addArrangedSubview(stackView2)
        // ======================================================
        
        // 3段目 =================================================
        let stackView3 = stackViewGenarator(stackDirection: .horizontal)
        let btn7 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().seven)
        if #available(iOS 14.0, *) {
            btn7.addAction(UIAction { _ in
                self.buttonRecognizer(btn7)
            }, for: .touchUpInside)
        }
        let btn8 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().eight)
        if #available(iOS 14.0, *) {
            btn8.addAction(UIAction { _ in
                self.buttonRecognizer(btn8)
            }, for: .touchUpInside)
        }
        let btn9 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().nine)
        if #available(iOS 14.0, *) {
            btn9.addAction(UIAction { _ in
                self.buttonRecognizer(btn9)
            }, for: .touchUpInside)
        }
        let multiplyBtn = buttonGenerator(color: UIColor.buttonColor.orange, buttonName: K.operands().multiply)
        if #available(iOS 14.0, *) {
            multiplyBtn.addAction(UIAction { _ in
                self.buttonRecognizer(multiplyBtn)
            }, for: .touchUpInside)
        }
        stackView3.addArrangedSubview(btn7)
        stackView3.addArrangedSubview(btn8)
        stackView3.addArrangedSubview(btn9)
        stackView3.addArrangedSubview(multiplyBtn)
        parentStackView.addArrangedSubview(stackView3)
        // ======================================================
        
        // 4段目 =================================================
        let stackView4 = stackViewGenarator(stackDirection: .horizontal)
        let btn4 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().four)
        if #available(iOS 14.0, *) {
            btn4.addAction(UIAction { _ in
                self.buttonRecognizer(btn4)
            }, for: .touchUpInside)
        }
        let btn5 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().five)
        if #available(iOS 14.0, *) {
            btn5.addAction(UIAction { _ in
                self.buttonRecognizer(btn5)
            }, for: .touchUpInside)
        }
        let btn6 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().six)
        if #available(iOS 14.0, *) {
            btn6.addAction(UIAction { _ in
                self.buttonRecognizer(btn6)
            }, for: .touchUpInside)
        }
        let substructBtn = buttonGenerator(color: UIColor.buttonColor.orange, buttonName: K.operands().minus)
        if #available(iOS 14.0, *) {
            substructBtn.addAction(UIAction { _ in
                self.buttonRecognizer(substructBtn)
            }, for: .touchUpInside)
        }
        stackView4.addArrangedSubview(btn4)
        stackView4.addArrangedSubview(btn5)
        stackView4.addArrangedSubview(btn6)
        stackView4.addArrangedSubview(substructBtn)
        parentStackView.addArrangedSubview(stackView4)
        // ======================================================
        
        // 5段目 =================================================
        let stackView5 = stackViewGenarator(stackDirection: .horizontal)
        let btn1 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().one)
        if #available(iOS 14.0, *) {
            btn1.addAction(UIAction { _ in
                self.buttonRecognizer(btn1)
            }, for: .touchUpInside)
        }
        let btn2 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().two)
        if #available(iOS 14.0, *) {
            btn2.addAction(UIAction { _ in
                self.buttonRecognizer(btn2)
            }, for: .touchUpInside)
        }
        let btn3 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().three)
        if #available(iOS 14.0, *) {
            btn3.addAction(UIAction { _ in
                self.buttonRecognizer(btn3)
            }, for: .touchUpInside)
        }
        let addBtn = buttonGenerator(color: UIColor.buttonColor.orange, buttonName: K.operands().add)
        if #available(iOS 14.0, *) {
            addBtn.addAction(UIAction { _ in
                self.buttonRecognizer(addBtn)
            }, for: .touchUpInside)
        }
        stackView5.addArrangedSubview(btn1)
        stackView5.addArrangedSubview(btn2)
        stackView5.addArrangedSubview(btn3)
        stackView5.addArrangedSubview(addBtn)
        parentStackView.addArrangedSubview(stackView5)
        // ======================================================
        
        // 6段目 =================================================
        let stackView6 = stackViewGenarator(stackDirection: .horizontal)
        let stackViewForTwoCells = stackViewGenarator(stackDirection: .horizontal)
        let btn0 = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().zero)
        if #available(iOS 14.0, *) {
            btn0.addAction(UIAction { _ in
                self.buttonRecognizer(btn0)
            }, for: .touchUpInside)
        }
        let dotBtn = buttonGenerator(color: UIColor.buttonColor.blue, buttonName: K.Number().dot)
        if #available(iOS 14.0, *) {
            dotBtn.addAction(UIAction { _ in
                self.buttonRecognizer(dotBtn)
            }, for: .touchUpInside)
        }
        let equal = buttonGenerator(color: UIColor.buttonColor.orange, buttonName: K.operands().equal)
        if #available(iOS 14.0, *) {
            equal.addAction(UIAction { _ in
                self.buttonRecognizer(equal)
            }, for: .touchUpInside)
        }
        stackView6.addArrangedSubview(btn0)
        stackViewForTwoCells.addArrangedSubview(dotBtn)
        stackViewForTwoCells.addArrangedSubview(equal)
        stackView6.addArrangedSubview(stackViewForTwoCells)
        parentStackView.addArrangedSubview(stackView6)
        // ======================================================
    }
    
    /**
     ボタン生成ファクトリー
     */
    func buttonGenerator(color: UIColor, buttonName: String) -> UIButton {
        let btn = UIButton()
        btn.setTitleColor(UIColor.white, for: .normal) // ボタンの文字色
        btn.setTitle(buttonName, for: .normal) // 文字
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30) // 文字サイズ
        btn.backgroundColor = color // ボタンの色
        if #available(iOS 14.0, *) {
            btn.addAction(UIAction { _ in
                btn.setTitleColor(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0), for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    btn.setTitleColor(.white, for: .normal)
                }
            }, for: .touchUpInside)
        }
        return btn
    }
    
    /**
     ボタンの色を元に戻す
     */
    func initButtons() {
        tappedBtnArr.forEach {
            $0.layer.opacity = 1
        }
    }
    
    func stackViewGenarator(stackDirection: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis  = stackDirection
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 1
        return stackView
    }
    
    @IBAction func buttonRecognizer(_ sender: UIButton? = nil) {
        let button = sender!
//        if numberText.count == 1 && numberText.first == "0" {
//            return
//        }
        tappedBtnArr.append(button)
        button.layer.opacity = 0.85
        let number_ = numberText
        let laterComeNumber = laterComer
        let n = Double(number_)!
        let calc = caluclatorLogic(number: n)
        
        calc.calculator(n, operand: button.currentTitle?.description ?? "nil") // 計算ロジック
        
        switch button.currentTitle {
        case K.operands().negative: // 正・負の数
            numberText = String(Double(number_)! * Double(-1))
            initButtonColorDispatch(button: button)
            
        case K.operands().percent: // パーセント
            numberText = String(calc.percentage(Double(number_)!))
            initButtonColorDispatch(button: button)
            
        case K.operands().AC: // All Clear
            laterComer = ""
            numberText = "0"
            label.text = self.numberText
            initButtons()
            initButtonColorDispatch(button: button)
            
        default: // 番号もしくはオペランド
            guard let numberButton = Double(button.currentTitle ?? "nil") else {
                return
            }
//            if number != nil { // 番号だった時
//                if isOperandTapped {
//                    laterComer += number!
//                    laterComer = textValidation(text: laterComer)
//                } else {
//                    numberText += number!
//                    numberText = textValidation(text: numberText)
//                }
//            }
//
//            label.text = isOperandTapped ? laterComer : numberText
        }
        
        label.text = numberText
        
        // = でボタンの透明度を戻す,　計算結果の反映
        if button.currentTitle == K.operands().equal {
            label.text = calc.equal(Double(laterComeNumber)!, operand: K.operands().devision) // Taskで値を受け取るの待つ？
            initButtonColorDispatch(button: button)
            isOperandTapped = false
        }
        
    }
    
    /**
     ボタンの色戻す
     */
    func initButtonColorDispatch(button: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            button.layer.opacity = 1
        }
    }
    
    /**
     テキストのバリデーション
     */
    func textValidation(text: String) -> String{
        var text_ = text
        
        // 0の位置
        if text_.count > 0 && text_.first!.description == K.Number().zero && !text_.contains(".") {
            text_.removeFirst()
        }
        
        // ドットの位置, 数
        if text_.first!.description == K.Number().dot {
            text_ = "0"
        }
        
        if let firstDotIndex = text_.firstIndex(of: ".") {
            let startIndex = text_.index(after: firstDotIndex) // 最初のドット以降
            let range = startIndex..<text_.endIndex
            text_ = text_.replacingOccurrences(of: ".", with: "", options: [], range: range)
        }
        
        return text_
    }
}

