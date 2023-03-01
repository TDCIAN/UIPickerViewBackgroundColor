//
//  ViewController.swift
//  PickerView
//
//  Created by JeongminKim on 2023/03/01.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.widthAnchor.constraint(equalToConstant: 250),
            pickerView.heightAnchor.constraint(equalToConstant: 200),
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        pickerView.layer.borderColor = UIColor.blue.cgColor
        pickerView.layer.borderWidth = 1
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}

extension ViewController: UIPickerViewAccessibilityDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        // MARK: Set background color of subviews!
        pickerView.subviews.forEach {
            $0.backgroundColor = .clear
        }
        
        let numberLabel = UILabel()
        numberLabel.textAlignment = .center
        numberLabel.text = "\(row)"
        return numberLabel
    }
}

