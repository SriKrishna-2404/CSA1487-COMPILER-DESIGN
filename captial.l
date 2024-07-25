%%
[A-Z]+[\t\n ] { printf("%s is a capital word",yytext); }
.  ;
%%

int main( ) 
{
	printf("Enter String :");
	yylex();
}
int yywrap( )
{
	return 1;
}
