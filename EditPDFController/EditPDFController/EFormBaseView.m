//
//  EFormBaseView.m
//  iPoS_IOS
//
//  Created by CIBWKLPMAC006 on 5/9/13.
//  Copyright (c) 2013 AIA Information Technology (Beijing) Co., Ltd. All rights reserved.
//

#import "EFormBaseView.h"
#import "EFormUIImageView.h"
#import "EFormXMLEntity.h"
//#import "UIFactory.h"
//#import "EFormUtil.h"
//#import "EFormCheckBox.h"
//#import "EFormEditData.h"
//#import "EFormTextView.h"
//#import "EFormEdit.h"
//#import "EFormDataDelegate.h"
#import "EFormComponent.h"
//#import "EFormButtonGroup.h"
@implementation EFormBaseView

#define TEXTFILED_PLACEHOLDER @"input"
@synthesize configs;
@synthesize dataDelegate;
@synthesize groups;
@synthesize children;

-(void) dealloc
{
    [configs release];
    [dataDelegate release];
    [groups release];
    [children release];
    
    [super dealloc];
}

-(id) initWithConfig:(NSMutableDictionary *)iConfigs dataDelegateName:(NSString *)datadelegatName
{
    self = [super init];
    if(self){
        self.configs = iConfigs;
        Class class= NSClassFromString(datadelegatName);
        self.dataDelegate = [[[class alloc]init] autorelease];
        self.groups = [[[NSMutableDictionary alloc] init] autorelease];
        self.children = [[[NSMutableDictionary alloc] init] autorelease];
    }
    return self;
    
}


-(void) layoutWithView:(EFormUIImageView *)view andPageIndex:(int) pageIndex
{
    for(NSString *key in self.configs){
        EFormXMLEntity *entity = [self.configs objectForKey:key];
        NSArray *array = [entity.cid componentsSeparatedByString:@","];
        NSString *strTag0 = [array objectAtIndex:0];
        
        int page = [strTag0 intValue];
        id<EFormComponent> comp = nil;
        if(entity != nil && entity.component != nil){
            comp = entity.component;
        }else{
            comp = [self createUIObject:entity];
            entity.component = comp;
        }
        [self addChildren:entity.pareantName andSelf:entity.name];
        [self addButtonGoup:entity.groupID andSelf:comp];
        ((UITextField *)comp).text = entity.content;
        [self setFormValue:comp andValue:entity.content];
        
        if (page - 1 == pageIndex) {
            ((UIView *)comp).frame = CGRectMake(entity.x,entity.y,entity.width,entity.height);
            [view addSubview:((UIView *)comp)];
        }
    }
//    [self autoPopulate];
    //Comment by Frank 20130531
    //[self setDefaultValue];
//    [self updatedAllChildren];
}

-(void) addButtonGoup:(NSString *)groupName andSelf:(id<EFormComponent>) comp
{
//    NSMutableArray *group = [groups objectForKey:groupName];
//    if(group == nil){
//        group = [NSMutableArray array];
//        [groups setValue:group forKey:groupName];
//    }
//    [group addObject:comp.compName];
}

-(void) addChildren:(NSString *)pareantName andSelf:(NSString *)name
{
    NSMutableArray *list = [self.children objectForKey:pareantName];
    if(list == nil){
        list = [NSMutableArray array];
        [self.children setValue:list forKey:pareantName];
    }
    [list addObject:name];
}

-(id) createUIObject:(EFormXMLEntity *)bean
{
    int maxlen = 0;
//    if(![EFormUtil isNULL:bean.maxLen])
//    {
        maxlen = [bean.maxLen intValue];
//    }

    if([bean.type isEqualToString:@"TextField"]){
        UITextField * edt = [[[UITextField alloc] init] autorelease];
//        edt.placeholder =@"TextField";
//        [edt addActionListener:self];
        edt.textAlignment = NSTextAlignmentLeft;
//        edt.edtType = @"TextField";
        return edt;
       
    }else if([bean.type isEqualToString:@"HTextField"]){
        UITextField * edt = [[[UITextField alloc] init] autorelease];
//        edt.placeholder =@"TextField";
        edt.backgroundColor = [UIColor redColor];
        edt.textAlignment = NSTextAlignmentLeft;
        return edt;
    }else if([bean.type isEqualToString:@"Checkbox"]){
        UIButton *chb = [[[UIButton alloc] init] autorelease];
//        [chb addActionListener:self];
        [chb setTitle:@"btn" forState:UIControlStateNormal];
        return chb;
        
    }else if([bean.type isEqualToString:@"Date"]){
        UIButton *chb = [[[UIButton alloc] init] autorelease];
        [chb setTitle:@"btn" forState:UIControlStateNormal];
        return chb;
    }else if([bean.type isEqualToString:@"Day"]){
        UIButton *chb = [[[UIButton alloc] init] autorelease];
        [chb setTitle:@"btn" forState:UIControlStateNormal];
        return chb;
    }else if([bean.type isEqualToString:@"Month"]){
        UIButton *chb = [[[UIButton alloc] init] autorelease];
        [chb setTitle:@"btn" forState:UIControlStateNormal];
        return chb;
    }else if([bean.type isEqualToString:@"Year"]){
        UIButton *chb = [[[UIButton alloc] init] autorelease];
        [chb setTitle:@"btn" forState:UIControlStateNormal];
        return chb;
    }else if([bean.type isEqualToString:@"DropDown"]){
        
        UIButton *chb = [[[UIButton alloc] init] autorelease];
        [chb setTitle:@"btn" forState:UIControlStateNormal];
        return chb;
    }else if([bean.type isEqualToString:@"TextView"]){
        UITextView *tview = [[[UITextView alloc] init] autorelease];
        tview.delegate = self;
        tview.textAlignment = NSTextAlignmentLeft;
        tview.scrollEnabled=NO;
        tview.tag=bean.cid.intValue;
//        [tview addActionListener:self];
        //tview.placeHolder=@"input";
        tview.text=@"input";
        
        
        return tview;
    }
    return nil;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}


-(void) setFormValue:(id) comp andValue:(NSString *) value
{
//    if([comp isKindOfClass:[UITextField class]])
//    {
//        ((UITextField *)comp).text = value;
//    }
//    
//    if([comp isKindOfClass:[UITextView class]])
//    {
//        // set placeholder
//        if (value.length==0||[value isEqualToString:@""]) {
//            ((UITextView *)comp).text = TEXTFILED_PLACEHOLDER;
//        }else{
//            ((UITextView *)comp).text = value;
//        }
//    }
//    if([comp isKindOfClass:[UIButton class]])
//    {
//        [((UIButton *)comp) setSelected:[value isEqualToString:@"YES"]];
////        [self updatedChildren:((UIButton *)comp).compName];
//    }
//    if([comp isKindOfClass:[UIButton class]])
//    {
//        if(value == nil)
//        {
//            value = @"";
//        }
//        [((UIButton *)comp) setTitle:value forState:UIControlStateNormal];
//    }
}

- (void) updatedChildren:(NSString *)name
{
    BOOL flag = [((EFormXMLEntity *)[self.configs objectForKey:name]).content isEqualToString:@"YES"];
    for(NSString *key in [self.children objectForKey:name]){
        EFormXMLEntity *bean = [self.configs objectForKey:key];
        UIControl *comp = (UIControl *)bean.component;
        comp.enabled = flag;
        if(!flag){
            if([comp isKindOfClass:[UIButton class]])
            {
                [self setDataWith:key andValue:@""];
                [self setFormValue:comp andValue:@""];
            }else{
                [self setDataWith:key andValue:@""];
                [self setFormValue:comp andValue:nil];
            }
        }
    }
}

-(void) setDataWith:(NSString *) key andValue:(NSString *) value
{
    ((EFormXMLEntity *)[self.configs objectForKey:key]).content = value;
}
- (void) updatedAllChildren{
    for (NSString *key in children) {
        [self updatedChildren:key];
    }
}


@end