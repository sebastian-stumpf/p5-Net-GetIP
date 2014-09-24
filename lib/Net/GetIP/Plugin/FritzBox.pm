package Net::GetIP::Plugin::FritzBox;
use Moo;
use Types::Standard qw/Str Int/;
use SOAP::Lite;
with 'Net::GetIP::Plugin';

has host => (
    is => 'ro',
    isa => Str,
    required => 1,
    default => sub { 'fritz.box' }
);

has port => (
    is => 'ro',
    isa => Int,
    required => 1,
    default => sub { 49000 }
);

has target => (
    is => 'ro',
    isa => Str,
    required => 1,
    default => sub {
        my $self = shift;
        $self->host . ':' . $self->port;
    },
    lazy => 1
);

sub run {
    my $self = shift;
    my $target = $self->target;

    return SOAP::Lite->proxy("http://$target/upnp/control/WANIPConn1")
        ->uri("urn:schemas-upnp-org:service:WANIPConnection:1")
        ->call("GetExternalIPAddress")
        ->result;
}

1;
