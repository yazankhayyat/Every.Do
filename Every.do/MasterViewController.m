//
//  MasterViewController.m
//  Every.do
//
//  Created by Yazan Khayyat on 2015-08-18.
//  Copyright (c) 2015 Yazan. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo.h"
#import "TodoTableViewCell.h"

@interface MasterViewController () <UITableViewDelegate>

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Todo *todoItem1 = [[Todo alloc]initWithTitle:@"Go to work early!"
                                 todoDescription:@"Got to wake up earlier than usual in order to make it by 8 am!"
                                  priorityNumber:8
                            isCompletedIndicator:YES];
    
    Todo *todoItem2 = [[Todo alloc]initWithTitle:@"Good night sleep!"
                                 todoDescription:@"Go to bed before 12 am in order to wake up fresh enough to go to work early"
                                  priorityNumber:6
                            isCompletedIndicator:YES];
    
    Todo *todoItem3 = [[Todo alloc]initWithTitle:@"Go to the bank"
                                 todoDescription:@"Go to CIBC and get yourself a credit card!"
                                  priorityNumber:9
                            isCompletedIndicator:NO];
    
    self.objects = [[NSMutableArray alloc]initWithObjects:todoItem1, todoItem2, todoItem3, nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Todo *object = self.objects[indexPath.row];
    cell.titleLabel.text = object.title;
    cell.priorityLabel.text = [NSString stringWithFormat:@"Priority: %d", object.priorityNumber];
    
    if (object.isCompletedIndicator) {
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:object.todoDescription];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributeString length])];
        cell.descriptionLabel.attributedText = attributeString;
    } else {
        cell.descriptionLabel.text = object.todoDescription;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Todo *object = self.objects[indexPath.row];
    object.isCompletedIndicator = !object.isCompletedIndicator;
    [self.objects replaceObjectAtIndex:indexPath.row withObject:object];
    [self.tableView reloadData];
}

@end
