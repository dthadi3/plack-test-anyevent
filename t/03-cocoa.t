use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use parent 'Plack::Test::AnyEvent::Test';
use Test::More;

sub impl_name {
    return 'AnyEvent';
}

eval {
    require Cocoa::EventLoop;
};

if($@) {
    plan skip_all => "You need Cocoa::EventLoop to run this test";
} else {
    __PACKAGE__->runtests;
}
