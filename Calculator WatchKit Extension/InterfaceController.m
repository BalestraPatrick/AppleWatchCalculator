//
//  InterfaceController.m
//  Calculator WatchKit Extension
//
//  Created by Patrick Balestra on 21/11/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (strong, nonatomic) NSMutableString *displayString;
@property (strong, nonatomic) NSString *previousNumber;
@property (nonatomic) NSInteger currentOperation; // 1 = sum, 2 = subtraction, 3 = multiplication, 4 = division

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        
        self.displayString = [NSMutableString string];
        
    }
    return self;
}

- (void)willActivate {

}

- (void)didDeactivate {
    
}

- (IBAction)divide {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = 4;
}

- (IBAction)multiply {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = 3;
}

- (IBAction)subtract {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = 2;
}

- (IBAction)sum {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = 1;
}

- (IBAction)result {
    if (self.currentOperation == 1) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] + [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    } else if (self.currentOperation == 2) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] - [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    } else if (self.currentOperation == 3) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] * [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    } else if (self.currentOperation == 4) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] / [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    }
    self.previousNumber = nil;
    self.currentOperation = 0;
}

- (IBAction)decimal {
    [self addDigitToDisplay:@"."];
}

- (IBAction)zero {
    [self addDigitToDisplay:@"0"];
}

- (IBAction)one {
    [self addDigitToDisplay:@"1"];
}

- (IBAction)two {
    [self addDigitToDisplay:@"2"];
}

- (IBAction)three {
    [self addDigitToDisplay:@"3"];
}

- (IBAction)four {
    [self addDigitToDisplay:@"4"];
}

- (IBAction)five {
    [self addDigitToDisplay:@"5"];
}

- (IBAction)six {
    [self addDigitToDisplay:@"6"];
}

- (IBAction)seven {
    [self addDigitToDisplay:@"7"];
}

- (IBAction)eight {
    [self addDigitToDisplay:@"8"];
}

- (IBAction)nine {
    [self addDigitToDisplay:@"9"];
}

- (IBAction)clearScreen {
    self.previousNumber = nil;
    self.currentOperation = 0;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
}

- (IBAction)removeLastDigit {
    if (self.displayString.length > 0) {
        [self.displayString deleteCharactersInRange:NSMakeRange(self.displayString.length - 1, 1)];
        [self.resultLabel setText:self.displayString];
    }
}

- (void)addDigitToDisplay:(NSString *)string {
    [self.displayString appendString:string];
    [self.resultLabel setText:self.displayString];

}

@end
