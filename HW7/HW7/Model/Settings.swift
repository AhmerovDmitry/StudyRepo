import UIKit

// MARK: - Protocol - TableViewControllerDelegate
protocol TableViewControllerDelegate {
    func update(color: UIColor)
}

extension TableViewController {
    
    func countsOfElements() -> Int {
        return sliderForChangeColor.count - 1
    }
    func changeValueInLabelAndTextField() {
        for index in 0...countsOfElements() {
            changeValueLabel[index].text = String(Int((sliderForChangeColor[index].value) * Float(colorCastNumber)))
            changeValueTextField[index].text = changeValueLabel[index].text
        }
    }
    
    // MARK: - Sliders
    @IBAction func changeValueSlider() {
        mainLabel.backgroundColor = UIColor(
            red: CGFloat(sliderForChangeColor[0].value),
            green: CGFloat(sliderForChangeColor[1].value),
            blue: CGFloat(sliderForChangeColor[2].value),
            alpha: 1
        )
        changeValueInLabelAndTextField()
    }
    
    // MARK: - Text Field
    @IBAction func ChangeTextFieldInfo() {
        for index in 0...2 {
            if let number = Float(changeValueTextField[index].text!) {
                changeValueLabel[index].text = changeValueTextField[index].text
                sliderForChangeColor[index].value = number / Float(colorCastNumber)
            } else {
                changeValueLabel[index].text = "0"
                sliderForChangeColor[index].value = 0
                changeValueTextField[index].text = ""
            }
            
            let maxNumberCount = 1...3
            var numberCount = [String]()
            for i in changeValueTextField[index].text! {
                numberCount.append(String(i))
            }
            
            if let textNumber = Int(changeValueTextField[index].text!) {
                if textNumber <= colorCastNumber && maxNumberCount.contains(numberCount.count) {
                } else {
                    changeValueLabel[index].text = "0"
                    sliderForChangeColor[index].value = 0
                    changeValueTextField[index].text = ""
                }
            }
        }
        mainLabel.backgroundColor = UIColor(
            red: CGFloat(Float(changeValueLabel[0].text!)! / Float(colorCastNumber)),
            green: CGFloat(Float(changeValueLabel[1].text!)! / Float(colorCastNumber)),
            blue: CGFloat(Float(changeValueLabel[2].text!)! / Float(colorCastNumber)),
            alpha: 1)
    }
    
    // MARK: - Change color after change of View
    func changeMainLabel(color: UIColor) {
        mainLabel.backgroundColor = color
        
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        
        if mainLabel.backgroundColor?.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) != nil {
            sliderForChangeColor[0].value = Float(fRed)
            sliderForChangeColor[1].value = Float(fGreen)
            sliderForChangeColor[2].value = Float(fBlue)
            mainLabel.alpha = fAlpha
            
            changeValueInLabelAndTextField()
        }
    }
    
    // MARK: - Delegate
    @IBAction func pressButton(sender: UIButton) {
        if let viewColor = mainLabel.backgroundColor {
            delegate?.update(color: viewColor)
            navigationController?.popViewController(animated: true)
        }
    }
}
