//
//  ViewControllerSpec.m
//  testeSpecta
//
//  Created by Renato Ioshida on 20/10/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//

#import "UIKit/UIKit.h"
#import <Specta/Specta.h>
#import "Expecta.h"
#import "OCMock.h"

#import "ViewController.h"

SpecBegin(ViewControllerSpec)

describe(@"ViewControllerSpec", ^{
    __block ViewController *vc;
    beforeAll(^{
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UINavigationController *nav = [mainStoryboard instantiateViewControllerWithIdentifier:@"ViewController"];
        vc = (ViewController *)nav;
        [vc view];
    });
    
    it(@"Should exist", ^{
        expect(vc).toNot.beNil();
    });
    it(@"Should exist", ^{
        expect(vc.nameTextField).toNot.beNil();
    });
    it(@"Should exist", ^{
        expect(vc.addButton).toNot.beNil();
    });
    it(@"Should exist", ^{
        expect(vc.namesTableView).toNot.beNil();
    });
    it(@"Should ViewController conform with uitableview delegate and datasorce", ^{
        expect(vc).conformTo(@protocol(UITableViewDelegate));
        expect(vc).conformTo(@protocol(UITableViewDataSource));
        expect(vc.namesTableView.delegate).to.equal(vc);
        expect(vc.namesTableView.dataSource).to.equal(vc);
    });
    
    
    it(@"Should ViewController respond to methods from uitableview delegate and datasorce", ^{
        expect(vc).respondTo(@selector(tableView:numberOfRowsInSection:));
        expect(vc).respondTo(@selector(tableView:cellForRowAtIndexPath:));
    });
    it(@"Should have number of cell equal to names in dataArray", ^{
        NSArray *array = @[@"name1",@"name2"];
        vc.dataArray = array;
        [vc.namesTableView reloadData];
        NSInteger rows = [vc.namesTableView numberOfRowsInSection:0];
        expect(rows).to.equal(2);
    });
});

SpecEnd
