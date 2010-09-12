use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Lingua::TreeTagger',
    license             => 'gpl',
    dist_author         => q{Aris Xanthos <aris.xanthos@unil.ch>},
    dist_version_from   => 'lib/Lingua/TreeTagger.pm',
    build_requires => {
        'Test::More'    => 0,
        'File::Temp'    => 0.19,
    },
    requires => {
        'Moose'         => 0,
        'Path::Class'   => 0,
        'File::Temp'    => 0,
    },
);

my $treetagger_base_dir = prompt_treetagger_base_dir();

while ( ! -d $treetagger_base_dir ) {

    print "This directory doesn't seem to exist...\n";

    my $treetagger_base_dir = prompt_treetagger_base_dir();
}

$builder->config_data(
    'treetagger_base_path' => $treetagger_base_dir
);

$builder->create_build_script();


sub prompt_treetagger_base_dir {

    print "Please enter the full path to the TreeTagger base directory ",
      "(e.g. C:\\Program Files\\TreeTagger): ";

    my $treetagger_base_dir = <>;
    chomp $treetagger_base_dir;
    
    return $treetagger_base_dir
}

