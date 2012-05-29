use strict;
use warnings;
use Test::More 0.88;
# This is a relatively nice way to avoid Test::NoWarnings breaking our
# expectations by adding extra tests, without using no_plan.  It also helps
# avoid any other test module that feels introducing random tests, or even
# test plans, is a nice idea.
our $success = 0;
END { $success && done_testing; }

my $v = "\n";

eval {                     # no excuses!
    # report our Perl details
    my $want = '5.006';
    my $pv = ($^V || $]);
    $v .= "perl: $pv (wanted $want) on $^O from $^X\n\n";
};
defined($@) and diag("$@");

# Now, our module version dependencies:
sub pmver {
    my ($module, $wanted) = @_;
    $wanted = " (want $wanted)";
    my $pmver;
    eval "require $module;";
    if ($@) {
        if ($@ =~ m/Can't locate .* in \@INC/) {
            $pmver = 'module not found.';
        } else {
            diag("${module}: $@");
            $pmver = 'died during require.';
        }
    } else {
        my $version;
        eval { $version = $module->VERSION; };
        if ($@) {
            diag("${module}: $@");
            $pmver = 'died during VERSION check.';
        } elsif (defined $version) {
            $pmver = "$version";
        } else {
            $pmver = '<undef>';
        }
    }

    # So, we should be good, right?
    return sprintf('%-45s => %-10s%-15s%s', $module, $pmver, $wanted, "\n");
}

eval { $v .= pmver('App::cpanminus','any version') };
eval { $v .= pmver('App::cpanoutdated','any version') };
eval { $v .= pmver('App::gh','any version') };
eval { $v .= pmver('Capture::Tiny','any version') };
eval { $v .= pmver('Class::Method::Modifiers','any version') };
eval { $v .= pmver('Config::JFDI','any version') };
eval { $v .= pmver('DBD::SQLite','1.31') };
eval { $v .= pmver('DBIx::Class','0.08192') };
eval { $v .= pmver('DBIx::Class::Migration','any version') };
eval { $v .= pmver('DBIx::Class::Schema::Loader','0.07010') };
eval { $v .= pmver('DateTime','any version') };
eval { $v .= pmver('DateTime::Format::DB2','any version') };
eval { $v .= pmver('DateTime::Format::DBI','any version') };
eval { $v .= pmver('DateTime::Format::MySQL','any version') };
eval { $v .= pmver('DateTime::Format::Pg','any version') };
eval { $v .= pmver('Dist::Zilla','4') };
eval { $v .= pmver('Dist::Zilla::PluginBundle::RSRCHBOY','any version') };
eval { $v .= pmver('ExtUtils::MakeMaker','6.30') };
eval { $v .= pmver('File::Find','any version') };
eval { $v .= pmver('File::Slurp','9999.18') };
eval { $v .= pmver('File::Temp','any version') };
eval { $v .= pmver('File::chdir','any version') };
eval { $v .= pmver('Git::CPAN::Patch','any version') };
eval { $v .= pmver('MooseX::App::Cmd','any version') };
eval { $v .= pmver('MooseX::AutoDestruct','0.007') };
eval { $v .= pmver('MooseX::TrackDirty::Attributes','2.000') };
eval { $v .= pmver('MooseX::Types::Perl','any version') };
eval { $v .= pmver('Path::Class','any version') };
eval { $v .= pmver('Perl::Critic','any version') };
eval { $v .= pmver('Perl::Tidy','any version') };
eval { $v .= pmver('Reindeer','0.008') };
eval { $v .= pmver('Role::Basic','any version') };
eval { $v .= pmver('Smart::Args','any version') };
eval { $v .= pmver('Smart::Comments','any version') };
eval { $v .= pmver('Sub::Exporter','any version') };
eval { $v .= pmver('Sub::Install','any version') };
eval { $v .= pmver('Test::Moose::More','0.009') };
eval { $v .= pmver('Test::More','0.88') };
eval { $v .= pmver('Test::Routine','0.015') };
eval { $v .= pmver('Try::Tiny','any version') };
eval { $v .= pmver('V','any version') };
eval { $v .= pmver('aliased','any version') };
eval { $v .= pmver('common::sense','any version') };
eval { $v .= pmver('namespace::autoclean','any version') };
eval { $v .= pmver('opts','0.05') };
eval { $v .= pmver('strict','any version') };
eval { $v .= pmver('warnings','any version') };



# All done.
$v .= <<'EOT';

Thanks for using my code.  I hope it works for you.
If not, please try and include this output in the bug report.
That will help me reproduce the issue and solve you problem.

EOT

diag($v);
ok(1, "we really didn't test anything, just reporting data");
$success = 1;

# Work around another nasty module on CPAN. :/
no warnings 'once';
$Template::Test::NO_FLUSH = 1;
exit 0;
