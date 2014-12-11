/*
 Disclaimer: IMPORTANT:  This About Objects software is supplied to you by
 About Objects, Inc. ("AOI") in consideration of your agreement to the 
 following terms, and your use, installation, modification or redistribution
 of this AOI software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this AOI software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, AOI grants you a personal, non-exclusive
 license, under AOI's copyrights in this original AOI software (the
 "AOI Software"), to use, reproduce, modify and redistribute the AOI
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the AOI Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the AOI Software.
 Neither the name, trademarks, service marks or logos of About Objects, Inc.
 may be used to endorse or promote products derived from the AOI Software
 without specific prior written permission from AOI.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by AOI herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the AOI Software may be incorporated.
 
 The AOI Software is provided by AOI on an "AS IS" basis.  AOI
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE AOI SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL AOI BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE AOI SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF AOI HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) About Objects, Inc. 2009. All rights reserved.
*/
#import "MyListController.h"
#import "MyDetailController.h"
#import "Book.h"

@implementation MyListController

@synthesize displayedObjects = _displayedObjects;

#pragma mark -

- (void)dealloc
{
    [_displayedObjects release];
    
    [super dealloc];
}

//  Lazily initializes array of displayed objects
//
- (NSMutableArray *)displayedObjects
{
    if (_displayedObjects == nil)
    {
        _displayedObjects = [[NSMutableArray alloc] initWithObjects:
                             [Book bookWithTitle:@"Middlemarch"
                                          author:@"Eliot, George"
                                            year:1874],
                             [Book bookWithTitle:@"War and Peace"
                                          author:@"Tolstoy, Leo"
                                            year:1869],
                             [Book bookWithTitle:@"Mansfield Park"
                                          author:@"Austen, Jane"
                                            year:1814],
                             [Book bookWithTitle:@"The New Atlantis"
                                          author:@"Bacon, Francis"
                                            year:1627],
                             [Book bookWithTitle:@"The Old Man and the Sea"
                                          author:@"Hemingway, Ernest"
                                            year:1952],
                             nil];
    }
    
    return _displayedObjects;
}

#pragma mark -
#pragma mark UIViewController

//  Override inherited implementation to configure the controller and its
//  table view.
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //  The controller's title (if set) will be displayed in the
    //  navigation controller's navigation bar at the top of the screen.
    //
    [self setTitle:@"Books"];
    
    [[self tableView] setRowHeight:54.0];
}

//  Override inherited implementation to automatically refresh the table
//  view's data.
//
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}


#pragma mark -
#pragma mark UITableViewDelegate Protocol

//  Invoked by the table view when user taps on a row.
//
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyDetailController *controller = [[MyDetailController alloc]
                                      initWithStyle:UITableViewStyleGrouped];
    
    id book = [[self displayedObjects] objectAtIndex:[indexPath row]];
    [controller setBook:book];
    
    [[self navigationController] pushViewController:controller
                                           animated:YES];
	[controller release];
}


//  By default, UITableViewController makes itself the data source of its own
//  UITableView instance, so we can implement data source protocol methods here.
//  You can move these methods to another class if you prefer -- just be sure 
//  to send a -setDataSource: message to the table view if you do.

#pragma mark -
#pragma mark UITableViewDataSource Protocol

//  Returns the number of rows in the current section. A 'plain style' table
//  view only has one section, so we can simply ignore the 'section' argument.
//
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[self displayedObjects] count];
}

// Return a cell containing the text to display at the provided row index.
//
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    //  See the Simple TableView example for an explanation of dequeuing and
    //  reuse identifiers.
    //
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"MyCell"];
        
        //  Configure the accessary to display on the right side of each cell;
        //  in this case a disclosure indicator to imply to the user that 
        //  touching a row will trigger navigation.
        //
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        //  Customize fonts
        
        UIFont *titleFont = [UIFont fontWithName:@"Georgia-BoldItalic" size:18.0];
        [[cell textLabel] setFont:titleFont];
        
        UIFont *detailFont = [UIFont fontWithName:@"Georgia" size:16.0];
        [[cell detailTextLabel] setFont:detailFont];
        
        [cell autorelease];
    }
    
    NSUInteger index = [indexPath row];
    id book = [[self displayedObjects] objectAtIndex:index];
    
    NSString *title = [book title];
    if (title == nil || [title length] < 1)  title = @"?";
    
    [[cell textLabel] setText:title];
    
    NSString *detailText = [NSString stringWithFormat:
                            @"%@    %@",
                            [book publicationYear],
                            [book author]];
    
    [[cell detailTextLabel] setText:detailText];
    
    return cell;
}

@end
