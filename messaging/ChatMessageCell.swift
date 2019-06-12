//
//  ChatMessageCell.swift
//  messaging
//
//  Created by Salvador Mireles on 2/4/19.
//  Copyright © 2019 Salvador Mireles. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {

   let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .gray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            }else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
 /*   var isIncoming: Bool! {
        didSet {
            bubbleBackgroundView.backgroundColor = isIncoming ? .white : .gray
            messageLabel.textColor = isIncoming ? .black : .white
        }
    } */
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        bubbleBackgroundView.backgroundColor = .green
        bubbleBackgroundView.layer.cornerRadius = 12
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bubbleBackgroundView)
        
        addSubview(messageLabel)
        
        messageLabel.text = "yo yo yokdjf fjdk jfkajf djf djfdkjkdf jaksjf df dkldkfl;kdslfk;dslkfkfjdksjfkjsdfjdsfjdkjfkjdskfjdkjfksdjfkldjfjf aj"
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
       //ewwcode messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        //lets up some good constraints
        let constraints = [ messageLabel.topAnchor.constraint(equalTo: topAnchor, constant:16),
         messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant:-32),
         messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
         
         bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
         bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
         bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
         bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
            
         
         
         ]
         NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:32)
        leadingConstraint.isActive = false
        
         trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        trailingConstraint.isActive = true
        
        
        
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ayye wayyy")
    }

}
