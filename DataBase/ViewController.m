//
//  ViewController.m
//  DataBase
//
//  Created by MAC on 4/28/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"



@interface ViewController ()

@end

@implementation ViewController
{
    AppDelegate *appObj;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    
    /// Added to git hub
    appObj =[[UIApplication sharedApplication]delegate];
    
    
    NSError *error;
    NSManagedObjectContext *context =[appObj managedObjectContext];
    
    
    NSManagedObject *object =[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
    [object setValue:@"Kranthi" forKey:@"name"];
    [object setValue:@"male" forKey:@"gender"];
    
    if (![context save:&error])
    {
        NSLog(@"falied");
        
    }else{
        
        NSLog(@"Saved");
    }
    
    
    
    
    NSMutableArray *array =[[NSMutableArray alloc]init];
    NSFetchRequest *request =[[NSFetchRequest alloc]initWithEntityName:@"Person"];
    array =[[context executeFetchRequest:request error:&error] mutableCopy];
   // NSLog(@"%@",array);


    
    
    NSManagedObject * entity2 =[NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];
    
    [entity2 setValue:@"Hello" forKey:@"name"];
    [entity2 setValue:@"ABC" forKey:@"branch"];
    [entity2 setValue:[NSNumber numberWithInt:10] forKey:@"rollono"];
    
    
    
    if (![context save:&error])
    {
    }
    
    
    NSMutableArray *arrrar2 =[[NSMutableArray alloc]init];
    NSFetchRequest *request1 =[[NSFetchRequest alloc]initWithEntityName:@"Student"];
    arrrar2 =[[context executeFetchRequest:request1 error:&error] mutableCopy];
    NSLog(@"%@",arrrar2);
    
    
    
    //  Update the old record
    NSManagedObject *object1 =[arrrar2 lastObject];
    [object1 setValue:@"Mech" forKey:@"branch"];
    [context save:&error];
    

    NSMutableArray *arrrar21 =[[NSMutableArray alloc]init];
    NSFetchRequest *request11 =[[NSFetchRequest alloc]initWithEntityName:@"Student"];
    arrrar21 =[[context executeFetchRequest:request11 error:&error] mutableCopy];
    NSLog(@"%@",arrrar21);
    
    // Delete the record from the database
    NSManagedObject *deletObject =[arrrar2 lastObject];
    [context deleteObject:deletObject];
    [context save:&error];
    
    
    // Using predicate and sort descripotr in format the array and data
    NSMutableArray *arrrar211 =[[NSMutableArray alloc]init];
    NSFetchRequest *request111 =[[NSFetchRequest alloc]initWithEntityName:@"Student"];
    NSPredicate *pred =[NSPredicate predicateWithFormat:@"branch CONTAINS[cd] %@",@"ABC"];
   [request111 setPredicate:pred];
    arrrar211 =[[context executeFetchRequest:request111 error:&error] mutableCopy];
    NSSortDescriptor *soort =[NSSortDescriptor sortDescriptorWithKey:@"branch" ascending:YES];
    NSArray *descriptor = @[soort];
    NSArray *sortedArray = [arrrar211 sortedArrayUsingDescriptors:descriptor];
    NSLog(@"%@",sortedArray);
    
    
    NSString *str =[[sortedArray objectAtIndex:0] valueForKey:@"branch"];
    NSLog(@"%@",str);
    
    
    for (int i =0; i< sortedArray.count; i++)
    {
        NSString *str =[[sortedArray objectAtIndex:i] valueForKey:@"branch"];
        NSLog(@"%@",str);

        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
