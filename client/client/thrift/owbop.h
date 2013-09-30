/**
 * Autogenerated by Thrift Compiler (0.9.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#import <Foundation/Foundation.h>

#import "TProtocol.h"
#import "TApplicationException.h"
#import "TProtocolUtil.h"
#import "TProcessor.h"
#import "TObjective-C.h"


enum owbOwbDrawOpType {
  OwbDrawOpType_LINE = 0,
  OwbDrawOpType_ELLIPSE = 1,
  OwbDrawOpType_RECTANGE = 2,
  OwbDrawOpType_POINT = 3
};

enum owbOwbOpType {
  OwbOpType_DRAW = 0,
  OwbOpType_SAVE = 1
};

@interface owbOwbPoint : NSObject <NSCoding> {
  int32_t __x;
  int32_t __y;

  BOOL __x_isset;
  BOOL __y_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=x, setter=setX:) int32_t x;
@property (nonatomic, getter=y, setter=setY:) int32_t y;
#endif

- (id) init;
- (id) initWithX: (int32_t) x y: (int32_t) y;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

#if !__has_feature(objc_arc)
- (int32_t) x;
- (void) setX: (int32_t) x;
#endif
- (BOOL) xIsSet;

#if !__has_feature(objc_arc)
- (int32_t) y;
- (void) setY: (int32_t) y;
#endif
- (BOOL) yIsSet;

@end

@interface owbOwbDrawOp : NSObject <NSCoding> {
  BOOL __mid_op;
  int __type;
  owbOwbPoint * __start_point;
  owbOwbPoint * __end_point;
  int32_t __thickness;
  int32_t __color;
  BOOL __is_fill;
  BOOL __alpha;
  BOOL __status;

  BOOL __mid_op_isset;
  BOOL __type_isset;
  BOOL __start_point_isset;
  BOOL __end_point_isset;
  BOOL __thickness_isset;
  BOOL __color_isset;
  BOOL __is_fill_isset;
  BOOL __alpha_isset;
  BOOL __status_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=mid_op, setter=setMid_op:) BOOL mid_op;
@property (nonatomic, getter=type, setter=setType:) int type;
@property (nonatomic, retain, getter=start_point, setter=setStart_point:) owbOwbPoint * start_point;
@property (nonatomic, retain, getter=end_point, setter=setEnd_point:) owbOwbPoint * end_point;
@property (nonatomic, getter=thickness, setter=setThickness:) int32_t thickness;
@property (nonatomic, getter=color, setter=setColor:) int32_t color;
@property (nonatomic, getter=is_fill, setter=setIs_fill:) BOOL is_fill;
@property (nonatomic, getter=alpha, setter=setAlpha:) BOOL alpha;
@property (nonatomic, getter=status, setter=setStatus:) BOOL status;
#endif

- (id) init;
- (id) initWithMid_op: (BOOL) mid_op type: (int) type start_point: (owbOwbPoint *) start_point end_point: (owbOwbPoint *) end_point thickness: (int32_t) thickness color: (int32_t) color is_fill: (BOOL) is_fill alpha: (BOOL) alpha status: (BOOL) status;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

#if !__has_feature(objc_arc)
- (BOOL) mid_op;
- (void) setMid_op: (BOOL) mid_op;
#endif
- (BOOL) mid_opIsSet;

#if !__has_feature(objc_arc)
- (int) type;
- (void) setType: (int) type;
#endif
- (BOOL) typeIsSet;

#if !__has_feature(objc_arc)
- (owbOwbPoint *) start_point;
- (void) setStart_point: (owbOwbPoint *) start_point;
#endif
- (BOOL) start_pointIsSet;

#if !__has_feature(objc_arc)
- (owbOwbPoint *) end_point;
- (void) setEnd_point: (owbOwbPoint *) end_point;
#endif
- (BOOL) end_pointIsSet;

#if !__has_feature(objc_arc)
- (int32_t) thickness;
- (void) setThickness: (int32_t) thickness;
#endif
- (BOOL) thicknessIsSet;

#if !__has_feature(objc_arc)
- (int32_t) color;
- (void) setColor: (int32_t) color;
#endif
- (BOOL) colorIsSet;

#if !__has_feature(objc_arc)
- (BOOL) is_fill;
- (void) setIs_fill: (BOOL) is_fill;
#endif
- (BOOL) is_fillIsSet;

#if !__has_feature(objc_arc)
- (BOOL) alpha;
- (void) setAlpha: (BOOL) alpha;
#endif
- (BOOL) alphaIsSet;

#if !__has_feature(objc_arc)
- (BOOL) status;
- (void) setStatus: (BOOL) status;
#endif
- (BOOL) statusIsSet;

@end

@interface owbOwbSaveOp : NSObject <NSCoding> {
  NSString * __sponsor;
  NSString * __time;
  NSString * __notes;

  BOOL __sponsor_isset;
  BOOL __time_isset;
  BOOL __notes_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, retain, getter=sponsor, setter=setSponsor:) NSString * sponsor;
@property (nonatomic, retain, getter=time, setter=setTime:) NSString * time;
@property (nonatomic, retain, getter=notes, setter=setNotes:) NSString * notes;
#endif

- (id) init;
- (id) initWithSponsor: (NSString *) sponsor time: (NSString *) time notes: (NSString *) notes;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

#if !__has_feature(objc_arc)
- (NSString *) sponsor;
- (void) setSponsor: (NSString *) sponsor;
#endif
- (BOOL) sponsorIsSet;

#if !__has_feature(objc_arc)
- (NSString *) time;
- (void) setTime: (NSString *) time;
#endif
- (BOOL) timeIsSet;

#if !__has_feature(objc_arc)
- (NSString *) notes;
- (void) setNotes: (NSString *) notes;
#endif
- (BOOL) notesIsSet;

@end

@interface owbOwbOp : NSObject <NSCoding> {
  int32_t __opid;
  int __type;
  owbOwbDrawOp * __draw_op;
  owbOwbSaveOp * __save_op;

  BOOL __opid_isset;
  BOOL __type_isset;
  BOOL __draw_op_isset;
  BOOL __save_op_isset;
}

#if TARGET_OS_IPHONE || (MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5)
@property (nonatomic, getter=opid, setter=setOpid:) int32_t opid;
@property (nonatomic, getter=type, setter=setType:) int type;
@property (nonatomic, retain, getter=draw_op, setter=setDraw_op:) owbOwbDrawOp * draw_op;
@property (nonatomic, retain, getter=save_op, setter=setSave_op:) owbOwbSaveOp * save_op;
#endif

- (id) init;
- (id) initWithOpid: (int32_t) opid type: (int) type draw_op: (owbOwbDrawOp *) draw_op save_op: (owbOwbSaveOp *) save_op;

- (void) read: (id <TProtocol>) inProtocol;
- (void) write: (id <TProtocol>) outProtocol;

#if !__has_feature(objc_arc)
- (int32_t) opid;
- (void) setOpid: (int32_t) opid;
#endif
- (BOOL) opidIsSet;

#if !__has_feature(objc_arc)
- (int) type;
- (void) setType: (int) type;
#endif
- (BOOL) typeIsSet;

#if !__has_feature(objc_arc)
- (owbOwbDrawOp *) draw_op;
- (void) setDraw_op: (owbOwbDrawOp *) draw_op;
#endif
- (BOOL) draw_opIsSet;

#if !__has_feature(objc_arc)
- (owbOwbSaveOp *) save_op;
- (void) setSave_op: (owbOwbSaveOp *) save_op;
#endif
- (BOOL) save_opIsSet;

@end

@interface owbowbopConstants : NSObject {
}
@end