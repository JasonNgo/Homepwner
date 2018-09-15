//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Jason Ngo on 2018-07-19.
//  Copyright © 2018 Jason Ngo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet var nameField: CustomTextField!
    @IBOutlet var serialNumberField: CustomTextField!
    @IBOutlet var valueField: CustomTextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    var imageStore: ImageStore!

    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }

    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()

    // MARK: - Lifecycle methods

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameField.text = item.name
        serialNumberField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)

        if let imageToDisplay = imageStore.image(forKey: item.imageKey) {
            imageView.image = imageToDisplay
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        view.endEditing(true)

        item.name = nameField.text ?? ""
        item.serialNumber = serialNumberField.text

        if let valueText = valueField.text {
            if let value = numberFormatter.number(from: valueText) {
                item.valueInDollars = value.intValue
            }
        } else {
            item.valueInDollars = 0
        }
    }

    // MARK: - IBActions

    @IBAction func backgroundTapped(_: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func takePicture(_: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }

        present(imagePicker, animated: true, completion: nil)
    }

} // DetailViewController

extension DetailViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        imageStore.setImage(image, forKey: item.imageKey)
        
        dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
