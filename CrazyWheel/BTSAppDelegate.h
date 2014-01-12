//
//  BTSAppDelegate.h
//  CrazyWheel
//
//  Created by user on 11.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BTSCoreDataManager;

@interface BTSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) BTSCoreDataManager *coreDataManager;

- (NSURL *)applicationDocumentsDirectory;

@end
