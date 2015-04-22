//
//  ViewController.m
//  test_hirata1
//
//  Created by 力丸 玲嘉 on 2015/04/09.
//  Copyright (c) 2015年 reika.rikimaru. All rights reserved.
//

#import "ViewController.h"

typedef NS_ENUM(NSInteger, EnumColumn) {
    EnumColumnAcademy,                  // 学年
    EnumColumnSubject,                  // 教科
    EnumColumnCategory                  // カテゴリ
};

typedef NS_ENUM(NSInteger, EnumAcademy) {
    EnumAcademy1st,                     // 1年
    EnumAcademy2nd,                     // 2年
    EnumAcademy3rd                      // 3年
};

typedef NS_ENUM(NSInteger, EnumSubject) {
    EnumSubjectNationalLanguage,        // 国語
    EnumSubjectMath,                    // 算数
    EnumSubjectScience,                 // 理科
    EnumSubjectSociety,                 // 社会
    EnumSubjectEnglish                  // 英語
};


@implementation ViewController {
    UIPickerView *picker;
    NSArray *_subjectArray;
    NSArray *_categoryArray;
    NSArray *_academyArray;
    EnumAcademy academy;
    EnumSubject subject;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    academy = EnumAcademy1st;
    subject = EnumSubjectNationalLanguage;
    
    // UIPickerのインスタンス化
    picker = [[UIPickerView alloc]init];
    
    // デリゲートを設定
    picker.delegate = self;
    
    // データソースを設定
    picker.dataSource = self;
    
    // 選択インジケータを表示
    picker.showsSelectionIndicator = YES;
    
    // UIPickerのインスタンスをビューに追加
    [self.view addSubview:picker];
    
    //ピッカーに文字列を格納する
    _academyArray = [NSArray arrayWithObjects:@"中学一年", @"中学二年", @"中学三年", nil];
    _subjectArray = [NSArray arrayWithObjects:@"国語", @"算数", @"理科", @"社会", @"英語", nil];
    _categoryArray = [NSArray arrayWithObjects:@"標準", @"予習", @"模試", @"復習", @"再復習", nil];
}


#pragma mark - UIPickerView Datesorce Methods
/**
 * ピッカーに表示する列数を返す
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}


/**
 * ピッカーに表示する行数を返す
 */
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    
    EnumColumn col = component;
    
    switch (col) {
        case EnumColumnAcademy: // 学年の列
            return 3;
            break;
        case EnumColumnSubject: // 教科の列
            switch (academy) {
                case EnumAcademy1st: //1年
                    return 2;
                    break;
                case EnumAcademy2nd: //2年
                    return 4;
                    break;
                case EnumAcademy3rd: //3年
                    return 5;
                    break;
                default:
                    break;
            }
            
        case EnumColumnCategory: // カテゴリの列
            switch (subject) {
                case EnumSubjectNationalLanguage:
                    return 2;
                    break;
                case EnumSubjectMath:
                    return 3;
                    break;
                case EnumSubjectScience:
                    return 5;
                    break;
                case EnumSubjectSociety:
                    return 4;
                    break;
                case EnumSubjectEnglish:
                    return 1;
                    break;
                default:
                    break;
            }
         
            default:
            return 0;
            break;
    }
}

#pragma mark - UIPickerView Delegate Methods
/**
 * 行のサイズを変更
 */
- (CGFloat)pickerView:(UIPickerView *)pickerView
    widthForComponent:(NSInteger)component {
    
    EnumColumn col = component;
    
    switch (col) {
        case EnumColumnAcademy: // 学年の列
            return 125.0;
            break;
            
        case EnumColumnSubject: // 教科の列
            return 85.0;
            break;
            
        case EnumColumnCategory: // カテゴリの列
            return 85.0;
            break;
            
        default:
            return 0;
            break;
    }
}




/**
 * ピッカーに表示する値を返す
 */
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    EnumColumn col = component;
    
    switch (col) {
        case EnumColumnAcademy: // 学年の列
            return [_academyArray objectAtIndex: row];
            break;
            
        case EnumColumnSubject: // 教科の列
            return [_subjectArray  objectAtIndex: row];
            break;
            
        case EnumColumnCategory: // カテゴリの列
            return [_categoryArray objectAtIndex: row];
            break;
            
        default:
            return 0;
            break;
    }
}
                    
                    
/**
 * ピッカーの選択行が決まったとき
 */
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    // 1列目の選択された行数を取得
    academy = [pickerView selectedRowInComponent:EnumColumnAcademy];
    subject = [pickerView selectedRowInComponent:EnumColumnSubject];
    NSInteger category = [pickerView selectedRowInComponent:EnumColumnCategory];
    
        NSLog(@"selected: %ld %ld %ld", academy, subject, category);
    [picker reloadComponent:EnumColumnSubject];
    [picker reloadComponent:EnumColumnCategory];
}


@end

