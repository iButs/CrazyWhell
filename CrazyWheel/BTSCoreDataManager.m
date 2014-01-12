//
//  BTSCoreDataManager.m
//  CrazyWheel
//
//  Created by user on 13.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import "BTSCoreDataManager.h"
#import "BTSAppDelegate.h"

@implementation BTSCoreDataManager
@synthesize managedObjectContex = _managedObjectContex;

-(NSManagedObjectContext *)managedObjectContex
{
    return [(BTSAppDelegate*) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

+(BTSCoreDataManager *)sharedInstance
{
    static BTSCoreDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super alloc] initUniqueInstance];
    });
    return sharedInstance;
}

-(instancetype) initUniqueInstance {
    return [super init];
}

-(void)saveData
{
    [self.managedObjectContex save:nil];
}

-(void)deleteAllObjects
{
    NSArray* objects =[self getObjectsFromCoreData];
    for (NSManagedObject *object in objects) {
        [self.managedObjectContex deleteObject:object];
    }
    [self saveData];
}

-(NSArray*)getObjectsFromCoreData
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Object"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
    NSArray *result = [self.managedObjectContex executeFetchRequest:fetchRequest error:nil];
    return result;
}

-(void)setNewObject:(NSDictionary*)object{
    NSManagedObject *newObject;
    newObject = [self isExistWithID:[object valueForKey:@"id"]];
    if (newObject == nil)
    {
    newObject = [NSEntityDescription insertNewObjectForEntityForName:@"Object" inManagedObjectContext:self.managedObjectContex];
        [newObject setValue:[object valueForKey:@"id"] forKey:@"id"];
        [newObject setValue:[object valueForKey:@"title"] forKey:@"title"];
    }
    [newObject setValue:[object valueForKey:@"text"] forKey:@"text"];
    NSDate *date = [[NSDate alloc]init];
    [newObject setValue:date forKey:@"date"];
    [self saveData];
}

-(NSManagedObject*)isExistWithID:(NSNumber *)ident{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Object"];
    [fetchRequest setFetchLimit:1];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"id == %@",ident];
    [fetchRequest setPredicate:predicate];
    NSArray *results = [self.managedObjectContex executeFetchRequest:fetchRequest error:nil];
    if (![results count])
        return nil;
    return [results objectAtIndex:0];
}
@end
