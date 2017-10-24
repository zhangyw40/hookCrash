//
//  ViewController.m
//  hookCrash
//
//  Created by zhs on 2017/8/7.
//  Copyright © 2017年 zhs. All rights reserved.
//



#import "ViewController.h"
#import "NSArray+Hook.h"
#import "NSMutableDictionary+SafeCrash.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id obj = nil;
    NSMutableDictionary *m_dict = [NSMutableDictionary dictionary];
    [m_dict setObject:obj forKey:@"666"];
    
    NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSString *str = [arr objectAtIndex:2];
    
    Person *per1 = [Person new];
    per1.name = @"乔峰";
    Person *per2 = [Person new];
    per2.name = @"段誉";
    
    Person *per3 = [Person new];
    per3.name = @"虚竹";
    
    NSMutableArray *muArr = [NSMutableArray arrayWithObjects:per1,per2,per3, nil];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@",@"虚竹"];
    
    NSArray *filteredArr = [muArr filteredArrayUsingPredicate:predicate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
