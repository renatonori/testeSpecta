//
//  ViewController.h
//  testeSpecta
//
//  Created by Renato Ioshida on 16/10/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UIButton *addButton;

@property (strong, nonatomic) IBOutlet UITableView *namesTableView;

@property (strong, nonatomic) NSArray *dataArray;

@end

