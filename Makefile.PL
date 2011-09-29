
use strict;
use warnings;

use 5.012001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Modules RSRCHBOY uses!",
  "AUTHOR" => "Chris Weyl <cweyl\@alumni.drew.edu>",
  "BUILD_REQUIRES" => {
    "Carp" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Scalar::Util" => 0,
    "Test::More" => "0.94",
    "Test::UseAllModules" => 0,
    "strict" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Task-BeLike-RSRCHBOY",
  "EXE_FILES" => [],
  "LICENSE" => "lgpl",
  "NAME" => "Task::BeLike::RSRCHBOY",
  "PREREQ_PM" => {
    "Any::Moose" => 0,
    "App::cpanminus" => 0,
    "App::cpanoutdated" => 0,
    "App::gh" => 0,
    "Catalyst::Controller::REST" => 0,
    "Catalyst::Devel" => 0,
    "Catalyst::Model::DBIC::Schema" => 0,
    "Catalyst::Runtime" => "5.9",
    "Catalyst::View::TT" => 0,
    "Class::Method::Modifiers" => 0,
    "Config::GitLike" => 0,
    "DBD::SQLite" => "1.31",
    "DBIx::Class" => "0.08192",
    "DBIx::Class::Schema::Loader" => "0.07010",
    "Dancer" => 0,
    "DateTime" => 0,
    "DateTime::Format::DB2" => 0,
    "DateTime::Format::DBI" => 0,
    "DateTime::Format::MySQL" => 0,
    "DateTime::Format::Pg" => 0,
    "Dist::Zilla" => 4,
    "Dist::Zilla::PluginBundle::RSRCHBOY" => 0,
    "File::Slurp" => "9999.18",
    "File::chdir" => 0,
    "Moose" => 2,
    "MooseX::AlwaysCoerce" => 0,
    "MooseX::App::Cmd" => 0,
    "MooseX::AttributeShortcuts" => "0.005",
    "MooseX::AutoDestruct" => "0.007",
    "MooseX::Types" => 0,
    "MooseX::Types::Path::Class" => 0,
    "MooseX::Types::Perl" => 0,
    "Path::Class" => 0,
    "Perl::Critic" => 0,
    "Perl::Tidy" => 0,
    "Plack" => 0,
    "Plack::Middleware::Debug" => 0,
    "Plack::Middleware::SetAccept" => 0,
    "Readonly" => 0,
    "Readonly::XS" => 0,
    "Role::Basic" => 0,
    "Starman" => 0,
    "Sub::Install" => 0,
    "Task::BeLike::RJBS" => "20110324.000",
    "Task::Catalyst" => 0,
    "Term::ReadLine::Gnu" => 0,
    "Try::Tiny" => 0,
    "V" => 0,
    "common::sense" => 0,
    "namespace::autoclean" => 0,
    "opts" => "0.05",
    "warnings" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



