//
//  CheckBox.h
//  components
//
//  Created by João Paulo dos Anjos on 28/07/17.
//  Copyright © 2017 João Paulo dos Anjos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckBox : UIControl
@property (nonatomic) IBInspectable BOOL isSelected;
@property (nonatomic, weak) IBInspectable UIColor* borderColor;
@property (nonatomic, weak) IBInspectable UIColor* checkColor;
@end
