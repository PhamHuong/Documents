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
#import "MyDetailController.h"
#import "Book.h"

@implementation MyDetailController

@synthesize book = _book;
@synthesize authorCell = _authorCell;
@synthesize titleCell = _titleCell;
@synthesize yearCell = _yearCell;

#pragma mark -

- (void)dealloc
{
    [_book release];
    [_titleCell release];
    [_authorCell release];
    [_yearCell release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark UITableView Methods

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setTitle:[_book title]];
}

- (void)loadView
{
    [super loadView];
    
    // Create an instance of UITableViewCell for each row of the table view.
    
    UITableViewCell *cell1 = [[UITableViewCell alloc] initWithFrame:CGRectZero
                                                    reuseIdentifier:nil];
    [self setTitleCell:cell1];
    [cell1 release];

    UITableViewCell *cell2 = [[UITableViewCell alloc] initWithFrame:CGRectZero
                                                    reuseIdentifier:nil];
    [self setAuthorCell:cell2];
    [cell2 release];
    
    UITableViewCell *cell3 = [[UITableViewCell alloc] initWithFrame:CGRectZero
                                                    reuseIdentifier:nil];
    [self setYearCell:cell3];
    [cell3 release];
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    //  There's a section for each of the book's properties.
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0: return @"Title";
        case 1: return @"Author";
        case 2: return @"Year";
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSString *text = nil;
    
    NSUInteger section = [indexPath section];
    switch (section) 
    {
        case 0:
            cell = [self titleCell];
            text = [_book title];
            break;
        case 1:
            cell = [self authorCell];
            text = [_book author];
            break;
        case 2:
            cell = [self yearCell];
            text = [[_book publicationYear] stringValue];
            break;
    }
    
    [[cell textLabel] setText:text];
    
    return cell;
}

@end

