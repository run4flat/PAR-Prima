 # question.pl
 use strict;
 use warnings;
 use Prima qw(InputLine Label Application);
 
 # Build a one-window program
 my $window = Prima::MainWindow->new(
     height => 300, width => 200,
 );
 
 # Add our prompt
 $window->insert(Label =>
     text => 'What is the answer to life, the universe, and everything?',
     pack => {
         side => 'top', fill => 'x', padx => 10, pady => 5,
     },
     height => 80,
     wordWrap => 1,
 );
 
 # Add the place where an answer may be supplied
 $window->insert(InputLine =>
     text => 'your answer',
     pack => {
         side => 'top', fill => 'x', padx => 10, pady => 5,
     },
     onKeyUp => sub {
         my $self = shift;
         if ($self->text == 42) {
             $window->response->text(
               'Yes, but what is the question?'
             );
         }
         else {
             $window->response->text(
               'Looks like you need to do some more reading.'
             );
         }
     },
 );
 
 # Add the response
 $window->insert(Label =>
     text => '',
     pack => {
         side => 'top', fill => 'both', expand => 1,
         padx => 10, pady => 5,
     },
     name => 'response',
     wordWrap => 1,
 );
 
 Prima->run;
