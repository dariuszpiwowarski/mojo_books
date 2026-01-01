package MojoBooks;
use Mojo::Base 'Mojolicious', -signatures;

use Mojo::Pg;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

	# Pg
 	$self->helper(pg => sub {
		my $self = shift;
		state $pg = Mojo::Pg->new($ENV{DATABASE_URL});
	});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Example#welcome');
}

1;
