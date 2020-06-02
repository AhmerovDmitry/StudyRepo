//    MARK: - ViewController
//    @IBAction func saveData(_ unwindSegue: UIStoryboardSegue) {
//        if let source = unwindSegue.source as? TableViewController {
//            self.view.backgroundColor = source.mainLabel.backgroundColor
//        }
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let color = segue.destination as? TableViewController {
//            color.colorLabel = self.view.backgroundColor
//        }
//    }

//    MARK: - TableViewController
//    func RGBColor() {
//        var fRed: CGFloat = 0
//        var fGreen: CGFloat = 0
//        var fBlue: CGFloat = 0
//        var fAlpha: CGFloat = 0
//        if (mainLabel.backgroundColor?.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha))! {
//            sliderForChangeColor[0].value = Float(fRed)
//            sliderForChangeColor[1].value = Float(fGreen)
//            sliderForChangeColor[2].value = Float(fBlue)
//            for index in 0...sliderForChangeColor.count - 1 {
//                changeValueLabel[index].text = String(Int((sliderForChangeColor[index].value) * Float(255)))
//                changeValueTextField[index].text = changeValueLabel[index].text
//            }
//        }
//    }
