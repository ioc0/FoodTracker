//
//  RatingControl.swift
//  FoodTracker
//
//  Created by ioc0 on 19.04.17.
//  Copyright © 2017 web-wizards. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
//MARK:Properties
    @IBInspectable var starSize:CGSize = CGSize(width: 44.0, height: 44.0){
    
        didSet
        {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
    
        didSet
        {
            setupButtons()
        }
    }
    private var ratingButtons=[UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
//MARK:INIT
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupButtons()
    }
    required init(coder: NSCoder)
    {
        super.init(coder:coder)
        setupButtons()
    }
//MARK: Button Action
    
    func ratingButtonTapped(button:UIButton)
    {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
        print(ratingButtons.index(of: button)!)
    }
    
//MARK:METHODS
    private func setupButtons()
    {
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // Create the button
        for _ in 0 ..< starCount {
            let button = UIButton()
            
            button.backgroundColor = UIColor.red
            button.accessibilityLabel = "Set \(index) star rating"
            
        
            // Add constraits
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
            // Load button images
            //let bundle = Bundle(for type(of:self))
            //let filledStar = UIImage(named:"filledStar"),in bundle, compatibleWith : self.traitCollection)
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: [.highlighted,.selected])
            
            // Add the button to the stack
        
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(button)
            ratingButtons.append(button)
            }
        
        updateButtonSelectionStates()
    }
    //Selection states for a button
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
        
    }

}
