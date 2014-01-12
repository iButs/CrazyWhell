//
//  BTSListViewController.m
//  CrazyWheel
//
//  Created by user on 11.01.14.
//  Copyright (c) 2014 iButs. All rights reserved.
//

#import "BTSListViewController.h"
#import "BTSCell.h"
#import "BTSDetailViewController.h"
#import "BTSCoreDataManager.h"

@interface BTSListViewController ()
@property (nonatomic) NSInteger selectedRow;
@property (strong, nonatomic) NSMutableData *data;
@property (strong, nonatomic) BTSCoreDataManager *coreDataManager;
@end

@implementation BTSListViewController
@synthesize objects;
@synthesize selectedRow;
@synthesize data;
@synthesize coreDataManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
     data = [[NSMutableData alloc]init];
    self.tableView.delegate = self;
    NSURL *url = [NSURL URLWithString:@"http://crazy-dev.wheely.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc]initWithRequest:request delegate:self];
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:30 target:self selector:@selector(reLoadData)  userInfo:nil repeats:YES];

}


-(void)viewWillDisappear:(BOOL)animated{
    self.title = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    self.title = @"Crazy Wheel";
    [self reLoadData];
    [super viewWillAppear:animated];
}


-(BTSCoreDataManager*)coreDataManager {
    return [BTSCoreDataManager sharedInstance];
}

#pragma mark - connection

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData{
    [data appendData:theData];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self reLoadData];

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertView *err = [[UIAlertView alloc]initWithTitle:@"Disconnect" message: @"Please, check your internet connection" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
    [err show];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifer = @"Cell";
    NSDictionary *object = [self.objects objectAtIndex:indexPath.row];
    BTSCell *cell = [[BTSCell alloc]initCustomCellWithTable:tableView withIdentifer:cellIdentifer];
    return [cell customCellFromObject:object WithTableView:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

        return (85+[[[objects objectAtIndex:indexPath.row]valueForKey:@"text"]length]/7);

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"details" sender:self];
}

-(void)reLoadData{
    NSArray* temp =[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    for (NSDictionary* object in temp){
        [self.coreDataManager setNewObject:object];
    }
    self.objects = [self.coreDataManager getObjectsFromCoreData];
    [self.tableView reloadData];

}
- (IBAction)deleteObjects:(id)sender {
    [coreDataManager deleteAllObjects];
    self.objects =[coreDataManager getObjectsFromCoreData];
    [self.tableView reloadData];
}

- (IBAction)reFresh:(id)sender {
    [self reLoadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BTSDetailViewController *dvc = [segue destinationViewController];
    NSDictionary* obj= [self.objects objectAtIndex:selectedRow];
    dvc.currentObject = obj;
    self.navigationController.toolbarHidden = YES;
}

@end
