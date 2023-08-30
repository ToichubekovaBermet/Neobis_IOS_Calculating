import UIKit
import SnapKit

class ViewController: BaseController {
    var beforeOperator: Int = 0
    var afterOperator: Int = 0
    
    var deleteText: Bool = false
    
    var selectedOperation: String = ""
    
    var currentNumber: Int = 0
    var storedNumber: Int = 0
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        label.font = .systemFont(ofSize: 80)
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    private lazy var buttonForAC: UIButton = {
        let button = UIButton()
        button.setTitle("AC", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForPlusMinus: UIButton = {
        let button = UIButton()
        button.setTitle("+/_", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        return button
    }()
    private lazy var buttonForPercent: UIButton = {
        let button = UIButton()
        button.setTitle("%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        return button
    }()
    private lazy var buttonForDivision: UIButton = {
        let button = UIButton()
        button.setTitle("÷", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTappedDivision), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForMultiply: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTappedMultiply), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForMinus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTappedMinus), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForPlus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTappedPlus), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForEquals: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(buttonTappedEquals), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonForSeven: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        button.titleLabel?.minimumScaleFactor = 0.3
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    private lazy var buttonForEight: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonForNine: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForFour: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForFive: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForSix: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonForOne: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForTwo: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForThree: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForPoint: UIButton = {
        let button = UIButton()
        button.setTitle(",", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    private lazy var buttonForZero: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 40
        button.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return button
    }()
    
    override func setupView() {
        view.backgroundColor = .black
        view.addSubview(label)
        view.addSubview(buttonForAC)
        view.addSubview(buttonForPlusMinus)
        view.addSubview(buttonForPercent)
        view.addSubview(buttonForDivision)
        view.addSubview(buttonForMultiply)
        view.addSubview(buttonForMinus)
        view.addSubview(buttonForPlus)
        view.addSubview(buttonForEquals)
        view.addSubview(buttonForSeven)
        view.addSubview(buttonForEight)
        view.addSubview(buttonForNine)
        view.addSubview(buttonForFive)
        view.addSubview(buttonForFour)
        view.addSubview(buttonForSix)
        view.addSubview(buttonForOne)
        view.addSubview(buttonForTwo)
        view.addSubview(buttonForThree)
        view.addSubview(buttonForPoint)
        view.addSubview(buttonForZero)
    }
    
    override func setupConstraints() {
        label.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.width.equalTo(360)
            make.height.equalTo(60)
            make.leading.trailing.equalTo(-25)
            make.top.equalToSuperview().inset(200)
        }
        buttonForAC.snp.makeConstraints({ make in
            make.top.equalTo(label.snp.bottom).offset(40)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForPlusMinus.snp.makeConstraints({ make in
            make.top.equalTo(buttonForAC.snp.top)
            make.leading.equalTo(buttonForAC.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForPercent.snp.makeConstraints({ make in
            make.top.equalTo(buttonForPlusMinus.snp.top)
            make.leading.equalTo(buttonForPlusMinus.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForDivision.snp.makeConstraints({ make in
            make.top.equalTo(buttonForPercent.snp.top)
            make.leading.equalTo(buttonForPercent.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        
        buttonForSeven.snp.makeConstraints({ make in
            make.top.equalTo(buttonForAC.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForEight.snp.makeConstraints({ make in
            make.top.equalTo(buttonForSeven.snp.top)
            make.leading.equalTo(buttonForSeven.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForNine.snp.makeConstraints({ make in
            make.top.equalTo(buttonForEight.snp.top)
            make.leading.equalTo(buttonForEight.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        
        buttonForMultiply.snp.makeConstraints({ make in
            make.top.equalTo(buttonForNine.snp.top)
            make.leading.equalTo(buttonForNine.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForFour.snp.makeConstraints({ make in
            make.top.equalTo(buttonForSeven.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForFive.snp.makeConstraints({ make in
            make.top.equalTo(buttonForFour.snp.top)
            make.leading.equalTo(buttonForFour.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForSix.snp.makeConstraints({ make in
            make.top.equalTo(buttonForFive.snp.top)
            make.leading.equalTo(buttonForFive.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForMinus.snp.makeConstraints({ make in
            make.top.equalTo(buttonForSix.snp.top)
            make.leading.equalTo(buttonForSix.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForOne.snp.makeConstraints({ make in
            make.top.equalTo(buttonForFour.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForTwo.snp.makeConstraints({ make in
            make.top.equalTo(buttonForOne.snp.top)
            make.leading.equalTo(buttonForOne.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForThree.snp.makeConstraints({ make in
            make.top.equalTo(buttonForTwo.snp.top)
            make.leading.equalTo(buttonForTwo.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForPlus.snp.makeConstraints({ make in
            make.top.equalTo(buttonForThree.snp.top)
            make.leading.equalTo(buttonForThree.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForZero.snp.makeConstraints({ make in
            make.top.equalTo(buttonForOne.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(180)
            make.height.equalTo(80)
        })
        
        buttonForPoint.snp.makeConstraints({ make in
            make.top.equalTo(buttonForZero.snp.top)
            make.leading.equalTo(buttonForZero.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
        buttonForEquals.snp.makeConstraints({ make in
            make.top.equalTo(buttonForPoint.snp.top)
            make.leading.equalTo(buttonForPoint.snp.trailing).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(80)
        })
    }

}

// MARK: -  Selectors

extension ViewController {

    @objc func buttonTapped() {
        clearCalculator()
    }
    private func clearCalculator() {
        currentNumber = 0
        storedNumber = 0
        selectedOperation = ""
        label.text = "0"
    }

    @objc func buttonTappedDivision(sender: UIButton) {
           selectedOperation = "/"
           storeCurrentNumber()
    }

       @objc func buttonTappedMultiply(sender: UIButton) {
           selectedOperation = "x"
           storeCurrentNumber()
       }

       @objc func buttonTappedMinus(sender: UIButton) {
           selectedOperation = "-"
           storeCurrentNumber()
       }

       @objc func buttonTappedPlus(sender: UIButton) {
           selectedOperation = "+"
           storeCurrentNumber()
       }

       @objc func buttonTappedEquals(sender: UIButton) {
           performCalculation()
       }

    private func storeCurrentNumber() {
           if let currentNumberText = label.text, let number = Int(currentNumberText) {
               currentNumber = number
               deleteText = true
           }
       }

       private func performCalculation() {
           if let currentNumberText = label.text, let number = Int(currentNumberText) {
               switch selectedOperation {
               case "/":
                   if storedNumber != 0 {
                                storedNumber /= number
                }
               case "x":
                   storedNumber *= number
               case "-":
                   storedNumber -= number
               case "+":
                   storedNumber += number
               default:
                   storedNumber = number
               }
               label.text = String(storedNumber)
           }
       }

    @objc func numberPressed(sender: UIButton) {
        let digit = sender.currentTitle
                if deleteText {
                    label.text = ""
                    deleteText = false
                }
        if let numberLabel = label.text {
            if numberLabel == "0" {
                label.text = digit
            } else {
                label.text = (label.text ?? "") + (digit ?? "")
            }
        }
    }
}

