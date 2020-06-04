import UIKit

// MARK: - Protocol - TableViewControllerDelegate
protocol TableViewControllerDelegate {
    func update(color: UIColor)
}

extension TableViewController {
    
    func countsOfElements() -> Int {
        return sliders.count - 1
    }
    
    // MARK: - Set color for first view
    @IBAction func setColor() {
        let newColor = UIColor(
            red: CGFloat(sliders[0].value),
            green: CGFloat(sliders[1].value),
            blue: CGFloat(sliders[2].value),
            alpha: 1
        )
        mainLabel.backgroundColor = newColor
        delegate?.update(color: newColor)
        
        valuesForLabelsAndTextFields()
    }
    
    // MARK: - Done button method
    @IBAction func pressButton(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Set value for sliders
    func setValueForSlider() {
        let ciColor = CIColor(color: colorFromMainLabel)

        sliders[0].value = Float(ciColor.red)
        sliders[1].value = Float(ciColor.green)
        sliders[2].value = Float(ciColor.blue)
    }
    
    // MARK: - Set value for labels and text fields
    func valuesForLabelsAndTextFields() {
        for index in 0...countsOfElements() {
            labels[index].text = String(Int(sliders[index].value * colorCastNumber))
            textFields[index].text = labels[index].text
        }
    }
    
    // MARK: - Text Field
    @IBAction func ChangeTextFieldInfo() {
        for index in 0...countsOfElements() {
            if let number = Float(textFields[index].text!) {
                labels[index].text = textFields[index].text
                sliders[index].value = number / colorCastNumber
            } else {
                labels[index].text = "0"
                sliders[index].value = 0
                textFields[index].text = ""
            }

            let maxNumberCount = 1...3
            var numberCount = [String]()
            for i in textFields[index].text! {
                numberCount.append(String(i))
            }

            if let textNumber = Int(textFields[index].text!) {
                if textNumber <= Int(colorCastNumber) && maxNumberCount.contains(numberCount.count) {
                } else {
                    labels[index].text = "0"
                    sliders[index].value = 0
                    textFields[index].text = ""
                }
            }
        }
        mainLabel.backgroundColor = UIColor(
            red: CGFloat(Float(labels[0].text!)! / Float(colorCastNumber)),
            green: CGFloat(Float(labels[1].text!)! / Float(colorCastNumber)),
            blue: CGFloat(Float(labels[2].text!)! / Float(colorCastNumber)),
            alpha: 1)
    }
}
