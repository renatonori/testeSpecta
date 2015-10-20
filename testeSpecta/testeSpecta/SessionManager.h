//
//  SessionManager.h
//  testeSpecta
//
//  Created by Renato Ioshida on 19/10/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionManager : NSObject
+(instancetype)sharedInstance;

-(void)clean;
-(BOOL)isEmpty;
-(void)addNewName:(NSString *)name;
-(NSArray *)getNames;
@end
