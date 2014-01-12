//
//  BTSCoreDataManager.h
//  CrazyWheel
//
//  Created by user on 13.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface BTSCoreDataManager : NSObject


@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContex;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


-(void)deleteAllObjects;
-(NSArray*)getObjectsFromCoreData;
-(void)saveData;

-(NSManagedObject*)isExistWithID:(NSNumber*)ident;
-(void)setNewObject:(NSDictionary*)object;
-(NSManagedObjectContext *)managedObjectContex;
+(BTSCoreDataManager *)sharedInstance;
-(instancetype) initUniqueInstance;
+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));
@end
