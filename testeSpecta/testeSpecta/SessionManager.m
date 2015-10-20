//
//  SessionManager.m
//  testeSpecta
//
//  Created by Renato Ioshida on 19/10/15.
//  Copyright © 2015 Renato Ioshida. All rights reserved.
//

#import "SessionManager.h"

NSString *const KStoredName = @"names";

@implementation SessionManager

+(instancetype)sharedInstance{
    static SessionManager *sharedSessionManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSessionManager = [[self alloc] init];
    });
    return sharedSessionManager;
}

-(void)clean{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:KStoredName];
}
-(BOOL)isEmpty{
    NSArray *a = [self getNames];
    return !a && a.count==0 ? YES: NO ;
    
}
-(void)addNewName:(NSString *)name{
    NSMutableArray *names = [NSMutableArray arrayWithArray:[self getNames]];
    
    if(!names)
        names = [NSMutableArray new];
    
    [names addObject:name];
    
    [[NSUserDefaults standardUserDefaults] setObject:names forKey:KStoredName];
    
}
-(NSArray *)getNames{
    return [[NSUserDefaults standardUserDefaults] objectForKey:KStoredName];
}
@end
