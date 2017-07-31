//
//  CheckBox.m
//  components
//
//  Created by João Paulo dos Anjos on 28/07/17.
//  Copyright © 2017 João Paulo dos Anjos. All rights reserved.
//

#import "CheckBox.h"

@interface CheckBox()
@property (nonatomic, strong) UIView* background;
@property (nonatomic, strong) UIButton* button;
@property (nonatomic, strong) CAShapeLayer* check;
@end

@implementation CheckBox
- (void) setup {
  //Setup super view
  [self setFrame:CGRectMake(0, 0, 20, 20)];
  
  // Setup Background
  _background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
  [[_background layer] setCornerRadius:5];
  [[_background layer] setMasksToBounds:YES];
  [[_background layer] setBorderColor:_borderColor.CGColor];
  [[_background layer] setBorderWidth:2.0];
  
  // Setup Button
  _button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
  [_button addTarget:self action:@selector(switchView) forControlEvents:UIControlEventTouchUpInside];
  
  
  
  // Setup icon
  
  UIBezierPath *path = [[UIBezierPath alloc] init];
  
  [path moveToPoint:CGPointMake(5, 11)];
  [path addLineToPoint:CGPointMake(9, 14)];
  [path addLineToPoint:CGPointMake(15, 6)];
  
  _check = [[CAShapeLayer alloc] init];
  [_check setStrokeColor:_checkColor.CGColor];
  [_check setFillColor:[UIColor whiteColor].CGColor];
  [_check setLineWidth: 2.0];
  [_check setPath:path.CGPath];
  
  if(_isSelected) {
    [_check setStrokeEnd:1.0];
  } else {
    [_check setStrokeEnd:0.0];
  }
  
  
  [[_background layer] addSublayer: _check];
  
  [self addSubview:_background];
  [self addSubview:_button];
  
}
# pragma mark Actions
- (void) switchView {
  _isSelected = !_isSelected;
  
  [self sendActionsForControlEvents:UIControlEventValueChanged];
  
  dispatch_async(dispatch_get_main_queue(), ^{
    if (_isSelected){
      [self enable];
    } else {
      [self disable];
    }
  });
}

#pragma mark Icons


# pragma mark Animations
- (void) enable {
  
  [UIView animateWithDuration:0.2 animations:^{
    [_check setStrokeEnd:1.0];
  }];
}

- (void) disable {
  [UIView animateWithDuration:0.2 animations:^{
    [_check setStrokeEnd:0.0];
  }];
}

#pragma mark UI
-(void) awakeFromNib {
  [super awakeFromNib];
  [self setup];
}

-(void)prepareForInterfaceBuilder {
  [super prepareForInterfaceBuilder];
  [self setup];
}

@end
