// @@Example: ex_objc_tableview_typed_intro @@

#import <tightdb/objc/table.h>
#import <tightdb/objc/tightdb.h>

// Defines a new table with two columns Name and Age. 
 
TIGHTDB_TABLE_2(PeopleTable,
                Name, String,
                Age, Int);

int main()
{
    @autoreleasepool {
        
        // Creates a new table of the type defined above.

        PeopleTable *table = [[PeopleTable alloc] init];
        
        // Adds rows to the table.
        
        [table addName:@"Mary" Age:14];
        [table addName:@"Joe" Age:17];
        [table addName:@"Jack" Age:22];
        [table addName:@"Sam" Age:34];
        [table addName:@"Bob" Age:10];
        
        // Place the result of a query in a table view.
        
        PeopleTable_View *tableView = [[[table where].Age columnIsGreaterThan:20] findAll];
        
        
        // Itereator over the result in the table view.
        
        for (PeopleTable_Cursor *curser in tableView) {
            NSLog(@"This person is over the age of 20: %@", [curser Name]);
        }

        
        
    }
}

// @@EndExample@@