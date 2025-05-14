# package MyApp;
# use Mojo::Base 'Mojolicious', -signatures;

# # This method will run once at server start
# sub startup ($self) {

#   # Load configuration from config file
#   my $config = $self->plugin('NotYAMLConfig');

#   # Configure the application
#   $self->secrets($config->{secrets});

#   # Router
#   my $r = $self->routes;

#   # Normal route to controller
#   $r->get('/')->to('Example#welcome');
# }

# 1;

package MyApp;
use Mojo::Base 'Mojolicious', -signatures;

sub startup ($self) {

  # Router
  my $r = $self->routes;

  # Root route → HTML page
  $r->get('/')->to('example#welcome');

  # Dynamic route → HTML
  $r->get('/hello/:name')->to(cb => sub ($c) {
    my $name = $c->param('name');
    $c->stash(name => $name);
    $c->render(template => 'example/hello');
  });

  # JSON API
  $r->get('/api/time')->to(cb => sub ($c) {
    $c->render(json => {time => scalar localtime});
  });
}

1;
