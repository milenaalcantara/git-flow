//
//  AddRecipeViewController.swift
//  confy-food
//
//  Created by Joan Wilson Oliveira on 21/06/22.
//  swiftlint:disable trailing_whitespace

import UIKit

class AddRecipeViewController: UIViewController {
    
    @IBOutlet weak var ingredientsInput: UITextView!
    @IBOutlet weak var howToCookInput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Navbar Items
        let cancelButton = UIBarButtonItem(
            title: "Cancelar",
            style: .plain,
            target: self,
            action: #selector(self.cancelButton)
        )
        cancelButton.tintColor = UIColor.red
        self.navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(
            title: "Salvar",
            style: .done,
            target: self,
            action: #selector(self.saveButton)
        )
        self.navigationItem.rightBarButtonItem = saveButton
        
        // MARK: - Inputs style
        ingredientsInput.layer.cornerRadius = 10
        ingredientsInput.layer.borderWidth = 0.5
        ingredientsInput.layer.borderColor = UIColor.black.cgColor
        howToCookInput.layer.cornerRadius = 10
        howToCookInput.layer.borderWidth = 0.5
        howToCookInput.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func cancelButton() {
        self.dismiss(animated: true)
    }
    
    @objc func saveButton() {
        self.dismiss(animated: true)
    }
}
