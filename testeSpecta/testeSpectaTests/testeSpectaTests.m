//
//  testeSpectaTests.m
//  testeSpectaTests
//
//  Created by Renato Ioshida on 16/10/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//
#import "UIKit/UIKit.h"
#import <Specta/Specta.h>
#import "Expecta.h"
#import "OCMock.h"

SpecBegin(testeSpectaTests)

describe(@"testeSpectaTests", ^{
   it(@"Should pass", ^{
       expect(YES).to.beTruthy();
   });
});

SpecEnd

