//
//  InterfaceController.m
//  Calculator WatchKit Extension
//
//  Created by Patrick Balestra on 21/11/14.
//  Copyright (c) 2014 Patrick Balestra. All rights reserved.
//

#import "InterfaceController.h"

typedef NS_ENUM(NSUInteger, OperationType) {
    OperationTypeUnknown,
    OperationTypeSum,
    OperationTypeSubtraction,
    OperationTypeMultiplication,
    OperationTypeDivision
};

@interface InterfaceController ()

@property (strong, nonatomic) NSString *displayString; // It'd be better to use a NSMutableString but there is a bug in displaying a NSMutableString in a label in WatchKit
@property (strong, nonatomic) NSString *previousNumber;
@property (assign, nonatomic) OperationType currentOperation;

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    self.displayString = @"";

}

- (IBAction)divide {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = OperationTypeDivision;
}

- (IBAction)multiply {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = OperationTypeMultiplication;
}

- (IBAction)subtract {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = OperationTypeSubtraction;
}

- (IBAction)sum {
    self.previousNumber = self.displayString;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
    self.currentOperation = OperationTypeSum;
}

- (IBAction)result {
    if (self.currentOperation == OperationTypeSum) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] + [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    } else if (self.currentOperation == OperationTypeSubtraction) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] - [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    } else if (self.currentOperation == OperationTypeMultiplication) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] * [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    } else if (self.currentOperation == OperationTypeDivision) {
        NSString *stringResult = [NSString stringWithFormat:@"%.1f", [self.previousNumber floatValue] / [self.displayString floatValue]];
        [self.resultLabel setText:stringResult];
        self.displayString = [stringResult mutableCopy];
    }
    self.previousNumber = nil;
    self.currentOperation = OperationTypeUnknown;
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
    self.currentOperation = OperationTypeUnknown;
    self.displayString = [NSMutableString string];
    [self.resultLabel setText:@"0"];
}

- (IBAction)removeLastDigit {
    if (self.displayString.length > 0) {
        self.displayString = [self.displayString substringToIndex:[self.displayString length] - 1];
        [self.resultLabel setText:self.displayString];
    }
}

- (void)addDigitToDisplay:(NSString *)string {
    self.displayString = [self.displayString stringByAppendingString:string];
    [self.resultLabel setText:self.displayString];
}

@end
