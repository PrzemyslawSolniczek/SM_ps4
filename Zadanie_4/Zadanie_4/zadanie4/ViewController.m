
#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction) enter {
    NSString *yourName = self.inputField.text;
    NSString *myName = @"Przemyslaw";
    NSString *message;
    if ([yourName length] == 0) {
        yourName = @"World";
    }
    if ([yourName isEqualToString:myName]) {
        message = [NSString stringWithFormat:@"Witaj %@! mamy to samo imie:) ", yourName];
    }
    else {
        message = [NSString stringWithFormat:@"Witaj %@!", yourName];
    }
    self.messageLabel.text = message;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"sendSurnameSegue"]) {
        SecondViewController *destinationController = (SecondViewController *) segue.destinationViewController;
        destinationController.delegate = self;
        destinationController.surname = self.surnameTextField.text;
    }
}

- (void) addItemViewController:(SecondViewController *) controller didFinishEnteringItem:(NSString *) item {
    NSLog(@"This was returned from SecondViewController %@", item);
    self.surnameTextField.text = item;
}
@end
