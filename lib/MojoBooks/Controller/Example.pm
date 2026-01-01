package MojoBooks::Controller::Example;
use Mojo::Base 'Mojolicious::Controller', -signatures;

# This action will render a template
sub welcome ($self) {

	my $editions =  $self->pg->db->query('SELECT * FROM edition')->hashes->to_array;
	$self->render(json => {
			editions => $editions
		});
}

1;
