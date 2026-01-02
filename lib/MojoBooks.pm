package MojoBooks;
use Mojo::Base 'Mojolicious', -signatures;

use Mojo::Pg;

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  $self->plugin('OpenAPI' => {
      url => $self->home->rel_file('openapi.yaml')
    });
  $self->plugin(
    SwaggerUI => {
      route   => $self->routes()->any('api'),
      url     => "/",
      title   => "Mojo Books",
      favicon => "/favicon-32x32.png"
    }
  );

  # Configure the application
  $self->secrets($config->{secrets});

  # Pg
  $self->helper(pg => sub {
      my $self = shift;
      state $pg = Mojo::Pg->new($ENV{DATABASE_URL});
    });
}

1;
