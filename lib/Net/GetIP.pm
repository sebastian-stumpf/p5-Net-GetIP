package Net::GetIP;
use Moo;
use Types::Standard qw/ArrayRef Str/;
use Module::Find qw/useall/;
use feature qw/say/;

our $VERSION = '0.1';

has plugins => (
    is => 'ro',
    isa => ArrayRef[Str],
    required => 1,
    default => sub {
        [ useall 'Net::GetIP::Plugin' ]
    }
);

has default => (
    is => 'rw',
    isa => Str,
    required => 1,
    default => sub {
        $ENV{'PERL5_GETIP_DEFAULT'} || 'Net::GetIP::Plugin::ICanHazIp'
    }
);

sub run_all {
    my $self = shift;

    foreach my $mod (@{ $self->plugins }) {
        my $ip = $mod->new->run;
        say "$mod: $ip";
    }
}

sub run {
    my $self = shift;
    say $self->default->new->run;
}

1;
