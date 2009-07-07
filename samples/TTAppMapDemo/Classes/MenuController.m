#import "MenuController.h"

@implementation MenuController

///////////////////////////////////////////////////////////////////////////////////////////////////
// private

- (NSString*)nameForMenuPage:(MenuPage)page {
  switch (page) {
    case MenuPageBreakfast:
      return @"Breakfast";
    case MenuPageLunch:
      return @"Lunch";
    case MenuPageDinner:
      return @"Dinner";
    case MenuPageDessert:
      return @"Dessert";
    case MenuPageAbout:
      return @"About";
    default:
      return @"";
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)init {
  if (self = [super init]) {
    _page = MenuPageNone;
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTViewController

- (id<TTTableViewDataSource>)createDataSource {
  if (_page == MenuPageBreakfast) {
    return [TTSectionedDataSource dataSourceWithObjects:
      @"Food",
      [TTTableTextItem itemWithText:@"Porridge" URL:@"tt://food/porridge"],
      [TTTableTextItem itemWithText:@"Bacon & Eggs" URL:@"tt://food/baconeggs"],
      [TTTableTextItem itemWithText:@"French Toast" URL:@"tt://food/frenchtoast"],
      @"Drinks",
      [TTTableTextItem itemWithText:@"Coffee" URL:@"tt://food/coffee"],
      [TTTableTextItem itemWithText:@"Orange Juice" URL:@"tt://food/oj"],
      @"Other",
      [TTTableTextItem itemWithText:@"Complaints" URL:@"tt://about/complaints"],
      nil];
  } else if (_page == MenuPageLunch) {
    return [TTSectionedDataSource dataSourceWithObjects:
      @"Menu",
      [TTTableTextItem itemWithText:@"Mac & Cheese" URL:@"tt://food/macncheese"],
      [TTTableTextItem itemWithText:@"Ham Sandwich" URL:@"tt://food/hamsam"],
      [TTTableTextItem itemWithText:@"Salad" URL:@"tt://food/salad"],
      @"Drinks",
      [TTTableTextItem itemWithText:@"Coke" URL:@"tt://food/coke"],
      [TTTableTextItem itemWithText:@"Sprite" URL:@"tt://food/sprite"],
      @"Other",
      [TTTableTextItem itemWithText:@"Complaints" URL:@"tt://about/complaints"],
      nil];
  } else if (_page == MenuPageDinner) {
    return [TTSectionedDataSource dataSourceWithObjects:
      @"Appetizers",
      [TTTableTextItem itemWithText:@"Potstickers" URL:@"tt://food/potstickers"],
      [TTTableTextItem itemWithText:@"Egg Rolls" URL:@"tt://food/eggrolls"],
      [TTTableTextItem itemWithText:@"Buffalo Wings" URL:@"tt://food/wings"],
      @"Entrees",
      [TTTableTextItem itemWithText:@"Steak" URL:@"tt://food/steak"],
      [TTTableTextItem itemWithText:@"Chicken Marsala" URL:@"tt://food/marsala"],
      [TTTableTextItem itemWithText:@"Cobb Salad" URL:@"tt://food/cobbsalad"],
      [TTTableTextItem itemWithText:@"Green Salad" URL:@"tt://food/greensalad"],
      @"Drinks",
      [TTTableTextItem itemWithText:@"Red Wine" URL:@"tt://food/redwine"],
      [TTTableTextItem itemWithText:@"White Wine" URL:@"tt://food/whitewhine"],
      [TTTableTextItem itemWithText:@"Beer" URL:@"tt://food/beer"],
      [TTTableTextItem itemWithText:@"Coke" URL:@"tt://food/coke"],
      [TTTableTextItem itemWithText:@"Sparkling Water" URL:@"tt://food/coke"],
      @"Other",
      [TTTableTextItem itemWithText:@"Complaints" URL:@"tt://about/complaints"],
      nil];
  } else if (_page == MenuPageDessert) {
    return [TTSectionedDataSource dataSourceWithObjects:
      @"Yum",
      [TTTableTextItem itemWithText:@"Chocolate Cake" URL:@"tt://food/cake"],
      [TTTableTextItem itemWithText:@"Apple Pie" URL:@"tt://food/pie"],
      @"Other",
      [TTTableTextItem itemWithText:@"Complaints" URL:@"tt://about/complaints"],
      nil];
  } else if (_page == MenuPageAbout) {
    return [TTListDataSource dataSourceWithObjects:
      [TTTableTextItem itemWithText:@"Complaints Dept." URL:@"tt://about/complaints"],
      nil];
  } else {
    return [TTListDataSource dataSourceWithObjects:nil];
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// URLs

- (void)showMenu:(MenuPage)page {
  _page = page;
  [self invalidateView];
  
  self.title = [self nameForMenuPage:page];

  UIImage* image = [UIImage imageNamed:@"tab.png"];
  self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:self.title image:image tag:0] autorelease];
  
  self.navigationItem.rightBarButtonItem =
    [[[UIBarButtonItem alloc] initWithTitle:@"Order" style:UIBarButtonItemStyleBordered
                              target:@"tt://order?waitress=Tammy&ref=toolbar"
                              action:@selector(loadAsURL)] autorelease];
}

@end
 