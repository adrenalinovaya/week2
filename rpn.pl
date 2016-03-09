=head1 DESCRIPTION

Эта функция должна принять на вход арифметическое выражение,
а на выходе дать ссылку на массив, содержащий обратную польскую нотацию
Один элемент массива - это число или арифметическая операция
В случае ошибки функция должна вызывать die с сообщением об ошибке

=cut

use 5.010;
use strict;
use warnings;
use diagnostics;
BEGIN{
	if ($] < 5.018) {
		package experimental;
		use warnings::register;
	}
}
no warnings 'experimental';
use FindBin;
require "$FindBin::Bin/../lib/tokenize.pl";

sub rpn {
	my $expr = shift;
	my $source = tokenize($expr);
	my @rpn = ()
	my @stack1 = ()
	my @stack2 = ()
    for my $c ($_$source) {
    next if $c =~ /^\s*$/;
 # пропустить, если пустая строка или пробелы
    given ($c) {
  # when (/^\s*$/) {} # то-же самое 
    when (/\d/) { # элемент содержит цифру
    push @rpn, $c;
	
    }
    when ( '.' ) {push @stack1, $c} # элемент равен "."
    when ([ '+', '-', '*', '/', '(', ')' ]){ #	элемент "+" или "-"
    push @stack2, $c
    }
default {
die "Bad: '$_'";
}
}
}
 
	

	return \@rpn;
}

1;
