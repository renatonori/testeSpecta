//
//  sessionManagerSpec.m
//  testeSpecta
//
//  Created by Renato Ioshida on 19/10/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//


#import "UIKit/UIKit.h"
#import <Specta/Specta.h>
#import "Expecta.h"
#import "OCMock.h"
#import "SessionManager.h"

SpecBegin(sessionManager)

describe(@"sessionManager", ^{
    beforeEach(^{
        [[SessionManager sharedInstance] clean];
    });
    
    it(@"Should Pass", ^{
        SessionManager *i = [SessionManager sharedInstance];
        expect(i).toNot.beNil();
    });
    
    it(@"Deveria Não existe nomes na lista", ^{
        BOOL isEmpty = [[SessionManager sharedInstance] isEmpty];
        expect(isEmpty).to.beTruthy();
    });
    
    it(@"Deveria adicionar nome na lista", ^{
        [[SessionManager sharedInstance] addNewName:@"name"];
        BOOL isEmpty = [[SessionManager sharedInstance] isEmpty];
        expect(isEmpty).to.beFalsy();
        
        NSString *name = [[SessionManager sharedInstance] getNames].firstObject;
        expect(name).to.equal(@"name");
    });
    
    it(@"Deveria ter dois nomes na lista", ^{
        [[SessionManager sharedInstance] addNewName:@"name1"];
        [[SessionManager sharedInstance] addNewName:@"name2"];
        NSArray *i = [[SessionManager sharedInstance] getNames];
        expect(i.count).to.equal(2);
        NSString *name = [[SessionManager sharedInstance] getNames].firstObject;
        NSString *name2 = [[SessionManager sharedInstance] getNames].lastObject;
        expect(name).to.equal(@"name1");
        expect(name2).to.equal(@"name2");
    });
});

SpecEnd
