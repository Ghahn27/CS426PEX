:: Creates a Variable for the Output File
@SET file="pex_test_results.txt"

:: Erases Everything Currently In the Output File
type NUL>%file%

:: ----------------------------------------
:: TITLE
:: ----------------------------------------
echo PEX 2 PARSER TEST CASES (C1C Hahn) >> %file%
echo Correct tests print the parse tree. Incorrect tests print the [line,column] of the first error. >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     01_operations_pass.txt >> %file%
echo TESTING:  Add, subtract, multiply, divide, unary minus, parentheses, chaining and order of operations on INF and FA >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\01_operations_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     01_operations_fail_a.txt >> %file%
echo TESTING:  Expression ends in an operator >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\01_operations_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     01_operations_fail_b.txt >> %file%
echo TESTING:  Missing closing parenthesis >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\01_operations_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     02_assignment_pass.txt >> %file%
echo TESTING:  Assigning numbers, single characters and strings to each variable type >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\02_assignment_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     02_assignment_fail_a.txt >> %file%
echo TESTING:  Assignment with nothing on the right-hand side >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\02_assignment_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     02_assignment_fail_b.txt >> %file%
echo TESTING:  Wrong assignment symbol, an equals sign instead of the arrow >> %file%
echo EXPECTED: Lexer error - unknown token = >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\02_assignment_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     03_boolean_pass.txt >> %file%
echo TESTING:  Every comparison and logical operator, plus precedence combinations >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\03_boolean_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     03_boolean_fail_a.txt >> %file%
echo TESTING:  Chained comparison, 3 less than x less than 5 >> %file%
echo EXPECTED: Parse tree printed - chaining is rejected in PEX 3, not by the parser >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\03_boolean_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     03_boolean_fail_b.txt >> %file%
echo TESTING:  Invalid comparison, two comparison operators in a row >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\03_boolean_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     04_constants_pass.txt >> %file%
echo TESTING:  One constant of each type declared before procedures and main >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\04_constants_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     04_constants_fail_a.txt >> %file%
echo TESTING:  Constant declared after MARCH (main) >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\04_constants_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     04_constants_fail_b.txt >> %file%
echo TESTING:  Constant declared without a value >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\04_constants_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     05_declarations_pass.txt >> %file%
echo TESTING:  Uninitialized declarations of each type in a procedure and in main >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\05_declarations_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     05_declarations_fail_a.txt >> %file%
echo TESTING:  Declaration with a type but no variable name >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\05_declarations_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     05_declarations_fail_b.txt >> %file%
echo TESTING:  Declaring a string literal instead of a variable name >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\05_declarations_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     06_identifiers_pass.txt >> %file%
echo TESTING:  Valid identifier forms, including names that start with a keyword >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\06_identifiers_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     06_identifiers_fail_a.txt >> %file%
echo TESTING:  Identifier containing an invalid character ($) >> %file%
echo EXPECTED: Lexer error - unknown token $ >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\06_identifiers_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     06_identifiers_fail_b.txt >> %file%
echo TESTING:  Identifier starting with a number >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\06_identifiers_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     07_if_else_pass.txt >> %file%
echo TESTING:  TLP (if) alone, TLP/CAVEAT (if/else), nested and empty blocks >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\07_if_else_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     07_if_else_fail_a.txt >> %file%
echo TESTING:  CAVEAT (else) with no TLP (if) >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\07_if_else_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     07_if_else_fail_b.txt >> %file%
echo TESTING:  TLP (if) with an empty condition >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\07_if_else_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     08_literals_pass.txt >> %file%
echo TESTING:  Integer, float and string literals, including exponents and escapes >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\08_literals_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     08_literals_fail_a.txt >> %file%
echo TESTING:  Invalid character (@) inside a numeric literal >> %file%
echo EXPECTED: Lexer error - unknown token @ >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\08_literals_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     08_literals_fail_b.txt >> %file%
echo TESTING:  Keyword used where a literal is expected >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\08_literals_fail_b.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     09_while_pass.txt >> %file%
echo TESTING:  STX (while) basic, nested, compound condition and empty body >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\09_while_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     09_while_fail_a.txt >> %file%
echo TESTING:  STX (while) with an empty condition >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\09_while_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     10_procedure_calls_pass.txt >> %file%
echo TESTING:  Procedures with 0, 1 and 3 parameters; expression and string arguments; calls inside if/else >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\10_procedure_calls_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     10_procedure_calls_fail_a.txt >> %file%
echo TESTING:  Assigning a procedure call to a variable (procedures have no return values) >> %file%
echo EXPECTED: Parser error - parse tree NOT printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\10_procedure_calls_fail_a.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     11_comments_pass.txt >> %file%
echo TESTING:  Full-line comments, comments after code, keywords and symbols inside comments >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex2\11_comments_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     12_salute_integration_pass.txt >> %file%
echo TESTING:  Integration - fire team engages, reloads and sends a SALUTE report >> %file%
echo EXPECTED: Parse tree printed >> %file%
echo ------------------------------------------------------------------------ >> %file%bin\Debug\ConsoleApplication.exe testcases\pex2\while_loops_incorrect_2.txt >> %file%
echo. >> %file%

pause
