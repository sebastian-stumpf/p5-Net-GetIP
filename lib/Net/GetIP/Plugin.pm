package Net::GetIP::Plugin;
use Moo::Role;
use HTTP::Tiny;
requires 'run';

sub http_get {
    my $url = shift;
    my $res = HTTP::Tiny->new->get($url);

    unless($res->{success}) {
        die sprintf "Could not fetch %s [%s]: %s\n", $url, $res->{status}, $res->{reason};
    }

    chomp(my $content = $res->{content});
    return $content;
}

1;
