=head1 DESCRIPTION

Эта функция должна принять на вход арифметическое выражение,
а на выходе дать ссылку на массив, состоящий из отдельных токенов.
Токен - это отдельная логическая часть выражения: число, скобка или арифметическая операция
В случае ошибки в выражении функция должна вызывать die с сообщением об ошибке

Знаки '-' и '+' в первой позиции, или после другой арифметической операции стоит воспринимать
как унарные и можно записывать как "U-" и "U+"

Стоит заметить, что после унарного оператора нельзя использовать бинарные операторы
Например последовательность 1 + - / 2 невалидна. Бинарный оператор / идёт после использования унарного "-"

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

sub tokenize {
	chomp(my $expr = shift);
	my @res;
    /* Get a string array with individual elements of expression */
    Regex rx = new Regex(@"\(|\)|\+|\-|\*|\/|<=?|>=?|!=|=|&&|\|\||([a-zA-z][a-zA-z0-9_]*)|(\d+\.?\d*)");
    /* split into tokens*/
    MatchCollection mc = rx.Matches($expr);
    @res = rx.Matches($expr);
    Regex id = new Regex(@"[a-zA-z][a-zA-z0-9_]*"); /* идентификаторы*/
    Regex num = new Regex(@"\d+\.?\d*"); /* числа целые и дробные*/
    Regex skobki = new Regex(@"\(|\)"); /* скобки*/
    string[] operators = { "(", ")", "*", "/", "+", "-", "<", ">", "<=", ">=", "==", "!=", "&&", "||" }; /* операторы по приоритету*/
 
    Regex opers = new Regex(@"\(|\)|\+|\-|\*|\/|<=?|>=?|!=|=|&&|\|\|"); /* операторы*/
 

	return \@res;

}

1;
