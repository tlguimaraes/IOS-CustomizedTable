//
//  RecipeViewController.m
//  CustomTableView
//
//  Created by Thiago G. on 02/22/2016.
//  Copyright (c) 2016 Thiago G.. All rights reserved.
//
//

#import "RecipeViewController.h"
#import "Sherpa.h"
#import "DataLoad.h"

@interface RecipeViewController ()

@end

@implementation RecipeViewController {
    NSArray *recipes;
    CrossoverModel *_crossoverModel;
    NSArray *_feedItems;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Set this view controller object as the delegate and data source for the table view
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    

    self.navigationItem.title = @"Thiago's Book";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    /*  OLD ONE
    // Create recipe array
    Sherpa *recipe1 = [Sherpa new];
    recipe1.name = @"Mushroom Risotto";
    recipe1.detail = @"0000 min";
    recipe1.imageFile = @"mushroom_risotto.jpg";

    Sherpa *recipe2 = [Sherpa new];
    recipe2.name = @"Egg Benedict";
    recipe2.detail = @"30 min";
    recipe2.imageFile = @"egg_benedict.jpg";

    Sherpa *recipe3 = [Sherpa new];
    recipe3.name = @"Full Breakfast";
    recipe3.detail = @"20 min";
    recipe3.imageFile = @"full_breakfast.jpg";

    Sherpa *recipe4 = [Sherpa new];
    recipe4.name = @"Hamburger";
    recipe4.detail = @"30 min";
    recipe4.imageFile = @"hamburger.jpg";
    
    Sherpa *recipe5 = [Sherpa new];
    recipe5.name = @"Ham and Egg Sandwich";
    recipe5.detail = @"10 min";
    recipe5.imageFile = @"ham_and_egg_sandwich.jpg";

    recipes = [NSArray arrayWithObjects:recipe1, recipe2, recipe3, recipe4, recipe5, nil];
    
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    // Assign our own backgroud for the view
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];

    // Add padding to the top of the table view
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    */
    // Remove table cell separator
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Assign our own backgroud for the view
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    // Add padding to the top of the table view
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _crossoverModel = [[CrossoverModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _crossoverModel.delegate = self;    
    // Call the download items method of the home model object
    [_crossoverModel downloadItems];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //THIS COUNT IS IMPORTANT DURING THE DISPLAY PHASE-THIAGO
    // Return the number of feed items (initially 0)
    //return recipes.count;
    return _feedItems.count;

}

- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:[self tableView] numberOfRowsInSection:0];
    NSInteger rowIndex = indexPath.row;
    UIImage *background = nil;
    
    if (rowIndex == 0) {
        background = [UIImage imageNamed:@"cell_top.png"];
    } else if (rowIndex == rowCount - 1) {
        background = [UIImage imageNamed:@"cell_bottom.png"];
    } else {
        background = [UIImage imageNamed:@"cell_middle.png"];
    }
    
    return background;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    
    //NEW ONE
    //====================================================================
    
    // Retrieve cell details from DataLoad class that is Loading Json from Crossover.
    
    
    // Get the location to be shown
    
    DataLoad *item = _feedItems[indexPath.row];
    
    
    
    // Get references to labels of cell
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    
    recipeImageView.image = [UIImage imageNamed:item.imageFile];
    
    
    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    
    recipeNameLabel.text =  item.name;
    
    
    UILabel *recipeDetailLabel = (UILabel *)[cell viewWithTag:102];
    
    recipeDetailLabel.text =  item.detail;
    
    
    
    /*
    
    //OLD DISPLAY THAT NEEDS TO BE ASSIGNED AS JSON FOR NOW
    // Display recipe in the table cell
    Sherpa *recipe = [recipes objectAtIndex:indexPath.row];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:recipe.imageFile];
    
    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    recipeNameLabel.text = recipe.name;
    
    UILabel *recipeDetailLabel = (UILabel *)[cell viewWithTag:102];
    recipeDetailLabel.text = recipe.detail;
    
    */
    
    
    
    
    
    
    
    // BACKGROUND PART   ******
    
    // Assign our own background image for the cell
    UIImage *background = [self cellBackgroundForRowAtIndexPath:indexPath];
    
    UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage:background];
    cellBackgroundView.image = background;
    cell.backgroundView = cellBackgroundView;


    return cell;
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
}





#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
