//
//  RecipeViewController.h
//  CustomTableView
//
//  Created by Thiago G. on 02/22/2016.
//  Copyright (c) 2016 Thiago G.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrossoverModel.h"
@interface RecipeViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate, CrossoverModelProtocol>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@end
