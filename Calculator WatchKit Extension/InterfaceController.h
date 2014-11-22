//
//  InterfaceController.h
//  Calculator WatchKit Extension
//
//  Created by Patrick Balestra on 21/11/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *resultLabel;

- (IBAction)divide;
- (IBAction)multiply;
- (IBAction)subtract;
- (IBAction)sum;
- (IBAction)decimal;
- (IBAction)result;

- (IBAction)zero;
- (IBAction)one;
- (IBAction)two;
- (IBAction)three;
- (IBAction)four;
- (IBAction)five;
- (IBAction)six;
- (IBAction)seven;
- (IBAction)eight;
- (IBAction)nine;

- (IBAction)clearScreen;
- (IBAction)removeLastDigit;

@end
