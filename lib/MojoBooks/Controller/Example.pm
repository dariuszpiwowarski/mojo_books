package MojoBooks::Controller::Example;
use Mojo::Base 'Mojolicious::Controller', -signatures;

# This action will render a template
sub welcome ($self) {

  # Render template "example/welcome.html.ep" with message
  $self->render(json => 'Welcome to the Mojolicious real-time web framework!!!');
}

1;
