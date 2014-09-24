use strict;
use warnings;

use ExtUtils::MakeMaker 6.64;

WriteMakefile(
    ABSTRACT => 'a tool for checking your ip address',
    NAME => 'Net::GetIP',
    VERSION_FROM => 'lib/Net/GetIP.pm',
    AUTHOR => 'Sebastian Stumpf <sepp@perlhacker.org>',
    PREREQ_PM => {
        'Moo' => '0',
        'Module::Find' => '0',
        'Type::Tiny' => '0',
        'SOAP::Lite' => '0'
    },
    TEST_REQUIRES => {
        'Test::RequiresInternet' => '0'
    },
    EXE_FILES => [ 'bin/getip' ],
    LICENSE => 'perl'
);
