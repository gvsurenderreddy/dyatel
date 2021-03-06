package Dyatel::Controller::U;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Dyatel::Controller::U - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path Args(0) {
	my( $self, $c ) = @_;

	my $jsredir = << "***";
<html><head>
 <script type="text/javascript">
  document.location = "/u/spa";
 </script>
</head><body>
 <noscript>
  <h1>JavaScript not detected</h1>
	<p>Javascript support is required.</p>
 </noscript>
</body></html>
***
	$c->response->body( $jsredir );
}

sub spa :Local {
	my($self, $c) = @_;
	$c->stash(template => 'spa.tt', no_wrapper => 1, prefix => 'u-');
}

use Data::Dumper;
sub conf :Local :Args(1)
{
	my($self, $c, $section) = @_;
	my $p = $c->model('DB::Config')->find({section => $section});
	$p = $p ? $p->params : { };
	my $d = $c->model('ConfDefs')->section($section);
	my %r;
	foreach my $x(@{$d->{params}}) {
		my $name = $x->{name};
		if(defined $p->{$name}) {
			$r{$name} = $p->{$name};
		} else {
			$r{$name} = $x->{defval};
		}
	}
	$c->stash(section => $section, params => \%r);
}

=encoding utf8

=head1 AUTHOR

Vasily i. Redkin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
