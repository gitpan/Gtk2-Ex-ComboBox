use strict;
use warnings;
use Glib qw(TRUE FALSE);
use Gtk2 qw/-init/;
use Gtk2::Ex::ComboBox;
use Gtk2::Ex::Simple::List;
use Data::Dumper;

use Gtk2::TestHelper tests => 3;

my $window = Gtk2::Window->new;
$window->signal_connect('destroy', sub {Gtk2->main_quit;});

my $label = Gtk2::Label->new('With-Buttons');
my $hbox = Gtk2::HBox->new (FALSE, 10);
$hbox->pack_start ($label, FALSE, TRUE, 0);    

my $combobox = Gtk2::Ex::ComboBox->new($label, 'with-buttons');
isa_ok($combobox, "Gtk2::Ex::ComboBox");
ok(!$combobox->set_list(['this', 'that', 'what']));

my $slist = $combobox->get_treeview;
isa_ok($slist, "Gtk2::Ex::Simple::List");

my $text = Gtk2::TextView->new;

my $vbox = Gtk2::VBox->new (FALSE, 0);
$vbox->pack_start ($hbox, FALSE, TRUE, 0);
$vbox->pack_start ($text, TRUE, TRUE, 0);
$window->add ($vbox);
$window->set_default_size(500, 200);
$window->show_all;

$combobox->show;