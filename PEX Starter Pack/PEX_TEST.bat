:: Creates a Variable for the Output File
@SET file="pex_test_results.txt"

:: Erases Everything Currently In the Output File
type NUL>%file%

:: ----------------------------------------
:: PEX 2
:: ----------------------------------------
:: echo PEX 2 PARSER TEST CASES (C1C Hahn) >> %file%
:: echo Correct tests print the parse tree. Incorrect tests print the [line,column] of the first error. >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     01_operations_pass.txt >> %file%
:: echo TESTING:  Add, subtract, multiply, divide, unary minus, parentheses, chaining and order of operations on INF and FA >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\01_operations_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     01_operations_fail_a.txt >> %file%
:: echo TESTING:  Expression ends in an operator >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\01_operations_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     01_operations_fail_b.txt >> %file%
:: echo TESTING:  Missing closing parenthesis >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\01_operations_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     02_assignment_pass.txt >> %file%
:: echo TESTING:  Assigning numbers, single characters and strings to each variable type >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\02_assignment_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     02_assignment_fail_a.txt >> %file%
:: echo TESTING:  Assignment with nothing on the right-hand side >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\02_assignment_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     02_assignment_fail_b.txt >> %file%
:: echo TESTING:  Wrong assignment symbol, an equals sign instead of the arrow >> %file%
:: echo EXPECTED: Lexer error - unknown token = >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\02_assignment_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     03_boolean_pass.txt >> %file%
:: echo TESTING:  Every comparison and logical operator, plus precedence combinations >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\03_boolean_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     03_boolean_fail_a.txt >> %file%
:: echo TESTING:  Chained comparison, 3 less than x less than 5 >> %file%
:: echo EXPECTED: Parse tree printed - chaining is rejected in PEX 3, not by the parser >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\03_boolean_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     03_boolean_fail_b.txt >> %file%
:: echo TESTING:  Invalid comparison, two comparison operators in a row >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\03_boolean_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     04_constants_pass.txt >> %file%
:: echo TESTING:  One constant of each type declared before procedures and main >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\04_constants_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     04_constants_fail_a.txt >> %file%
:: echo TESTING:  Constant declared after MARCH (main) >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\04_constants_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     04_constants_fail_b.txt >> %file%
:: echo TESTING:  Constant declared without a value >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\04_constants_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     05_declarations_pass.txt >> %file%
:: echo TESTING:  Uninitialized declarations of each type in a procedure and in main >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\05_declarations_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     05_declarations_fail_a.txt >> %file%
:: echo TESTING:  Declaration with a type but no variable name >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\05_declarations_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     05_declarations_fail_b.txt >> %file%
:: echo TESTING:  Declaring a string literal instead of a variable name >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\05_declarations_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     06_identifiers_pass.txt >> %file%
:: echo TESTING:  Valid identifier forms, including names that start with a keyword >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\06_identifiers_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     06_identifiers_fail_a.txt >> %file%
:: echo TESTING:  Identifier containing an invalid character ($) >> %file%
:: echo EXPECTED: Lexer error - unknown token $ >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\06_identifiers_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     06_identifiers_fail_b.txt >> %file%
:: echo TESTING:  Identifier starting with a number >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\06_identifiers_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     07_if_else_pass.txt >> %file%
:: echo TESTING:  TLP (if) alone, TLP/CAVEAT (if/else), nested and empty blocks >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\07_if_else_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     07_if_else_fail_a.txt >> %file%
:: echo TESTING:  CAVEAT (else) with no TLP (if) >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\07_if_else_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     07_if_else_fail_b.txt >> %file%
:: echo TESTING:  TLP (if) with an empty condition >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\07_if_else_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     08_literals_pass.txt >> %file%
:: echo TESTING:  Integer, float and string literals, including exponents and escapes >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\08_literals_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     08_literals_fail_a.txt >> %file%
:: echo TESTING:  Invalid character (@) inside a numeric literal >> %file%
:: echo EXPECTED: Lexer error - unknown token @ >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\08_literals_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     08_literals_fail_b.txt >> %file%
:: echo TESTING:  Keyword used where a literal is expected >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\08_literals_fail_b.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     09_while_pass.txt >> %file%
:: echo TESTING:  STX (while) basic, nested, compound condition and empty body >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\09_while_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     09_while_fail_a.txt >> %file%
:: echo TESTING:  STX (while) with an empty condition >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\09_while_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     10_procedure_calls_pass.txt >> %file%
:: echo TESTING:  Procedures with 0, 1 and 3 parameters; expression and string arguments; calls inside if/else >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\10_procedure_calls_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     10_procedure_calls_fail_a.txt >> %file%
:: echo TESTING:  Assigning a procedure call to a variable (procedures have no return values) >> %file%
:: echo EXPECTED: Parser error - parse tree NOT printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\10_procedure_calls_fail_a.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     11_comments_pass.txt >> %file%
:: echo TESTING:  Full-line comments, comments after code, keywords and symbols inside comments >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%
:: bin\Debug\ConsoleApplication.exe testcases\pex2\11_comments_pass.txt >> %file%
:: echo. >> %file%

:: echo ======================================================================== >> %file%
:: echo TEST:     12_salute_integration_pass.txt >> %file%
:: echo TESTING:  Integration - fire team engages, reloads and sends a SALUTE report >> %file%
:: echo EXPECTED: Parse tree printed >> %file%
:: echo ------------------------------------------------------------------------ >> %file%bin\Debug\ConsoleApplication.exe testcases\pex2\while_loops_incorrect_2.txt >> %file%
:: echo. >> %file%

:: ----------------------------------------
:: PEX 3 TEST CASES
:: ----------------------------------------
:: Placeholder files are blank; expected results apply after test programs are written.
echo PEX 3 SEMANTIC ANALYZER TEST CASES >> %file%
echo. >> %file%

:: Variable declarations

echo ======================================================================== >> %file%
echo TEST:     01_variable_duplicate_pass.txt >> %file%
echo TESTING:  Rule 1 - Variable names unique in the same scope >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\01_variable_duplicate_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     01_variable_duplicate_fail.txt >> %file%
echo TESTING:  Rule 1 - Variable name already declared in the same scope >> %file%
echo EXPECTED: Semantic error - Variable name already declared in the same scope >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\01_variable_duplicate_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     02_variable_undeclared_type_pass.txt >> %file%
echo TESTING:  Rule 2 - Variable declared using a declared type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\02_variable_undeclared_type_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     02_variable_undeclared_type_fail.txt >> %file%
echo TESTING:  Rule 2 - Variable declared using an undeclared type >> %file%
echo EXPECTED: Semantic error - Variable declared using an undeclared type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\02_variable_undeclared_type_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     03_variable_non_type_pass.txt >> %file%
echo TESTING:  Rule 3 - Variable declaration uses an identifier that is a type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\03_variable_non_type_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     03_variable_non_type_fail.txt >> %file%
echo TESTING:  Rule 3 - Variable declaration uses an identifier that is not a type >> %file%
echo EXPECTED: Semantic error - Variable declaration uses an identifier that is not a type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\03_variable_non_type_fail.txt >> %file%
echo. >> %file%

:: Constant declarations

echo ======================================================================== >> %file%
echo TEST:     04_constant_duplicate_pass.txt >> %file%
echo TESTING:  Rule 4 - Constant names unique in the applicable scope >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\04_constant_duplicate_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     04_constant_duplicate_fail.txt >> %file%
echo TESTING:  Rule 4 - Constant name already declared in the applicable scope >> %file%
echo EXPECTED: Semantic error - Constant name already declared in the applicable scope >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\04_constant_duplicate_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     05_constant_undeclared_type_pass.txt >> %file%
echo TESTING:  Rule 5 - Constant declared using a declared type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\05_constant_undeclared_type_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     05_constant_undeclared_type_fail.txt >> %file%
echo TESTING:  Rule 5 - Constant declared using an undeclared type >> %file%
echo EXPECTED: Semantic error - Constant declared using an undeclared type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\05_constant_undeclared_type_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     06_constant_non_type_pass.txt >> %file%
echo TESTING:  Rule 6 - Constant declaration uses an identifier that is a type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\06_constant_non_type_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     06_constant_non_type_fail.txt >> %file%
echo TESTING:  Rule 6 - Constant declaration uses an identifier that is not a type >> %file%
echo EXPECTED: Semantic error - Constant declaration uses an identifier that is not a type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\06_constant_non_type_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     07_constant_initializer_type_pass.txt >> %file%
echo TESTING:  Rule 7 - Constant initializer matches its declared type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\07_constant_initializer_type_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     07_constant_initializer_type_fail.txt >> %file%
echo TESTING:  Rule 7 - Constant initializer does not match its declared type >> %file%
echo EXPECTED: Semantic error - Constant initializer does not match its declared type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\07_constant_initializer_type_fail.txt >> %file%
echo. >> %file%

:: Conditional statements

echo ======================================================================== >> %file%
echo TEST:     08_if_condition_boolean_pass.txt >> %file%
echo TESTING:  Rule 8 - TLP condition has Boolean type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\08_if_condition_boolean_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     08_if_condition_boolean_fail.txt >> %file%
echo TESTING:  Rule 8 - TLP condition does not have Boolean type >> %file%
echo EXPECTED: Semantic error - TLP condition does not have Boolean type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\08_if_condition_boolean_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     09_while_condition_boolean_pass.txt >> %file%
echo TESTING:  Rule 9 - STX condition has Boolean type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\09_while_condition_boolean_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     09_while_condition_boolean_fail.txt >> %file%
echo TESTING:  Rule 9 - STX condition does not have Boolean type >> %file%
echo EXPECTED: Semantic error - STX condition does not have Boolean type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\09_while_condition_boolean_fail.txt >> %file%
echo. >> %file%

:: Expression checking

echo ======================================================================== >> %file%
echo TEST:     10_expression_type_name_pass.txt >> %file%
echo TESTING:  Rule 10 - Expression uses a variable or value >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\10_expression_type_name_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     10_expression_type_name_fail.txt >> %file%
echo TESTING:  Rule 10 - Expression uses a type name as a value >> %file%
echo EXPECTED: Semantic error - Expression uses a type name as a value >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\10_expression_type_name_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     11_expression_undeclared_variable_pass.txt >> %file%
echo TESTING:  Rule 11 - Expression uses a declared variable >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\11_expression_undeclared_variable_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     11_expression_undeclared_variable_fail.txt >> %file%
echo TESTING:  Rule 11 - Expression uses an undeclared variable >> %file%
echo EXPECTED: Semantic error - Expression uses an undeclared variable >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\11_expression_undeclared_variable_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     12_arithmetic_matching_types_pass.txt >> %file%
echo TESTING:  Rule 12 - Arithmetic operands have matching types for +, -, *, / >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\12_arithmetic_matching_types_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     12_arithmetic_matching_types_fail.txt >> %file%
echo TESTING:  Rule 12 - Arithmetic operands have mismatched types for +, -, *, / >> %file%
echo EXPECTED: Semantic error - Arithmetic operands have mismatched types for +, -, *, / >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\12_arithmetic_matching_types_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     13_arithmetic_numeric_operands_pass.txt >> %file%
echo TESTING:  Rule 13 - Arithmetic operands are INF or FA for +, -, *, / >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\13_arithmetic_numeric_operands_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     13_arithmetic_numeric_operands_fail.txt >> %file%
echo TESTING:  Rule 13 - Arithmetic operands are not INF or FA for +, -, *, / >> %file%
echo EXPECTED: Semantic error - Arithmetic operands are not INF or FA for +, -, *, / >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\13_arithmetic_numeric_operands_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     14_logical_matching_types_pass.txt >> %file%
echo TESTING:  Rule 14 - AND/OR operands have matching types >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\14_logical_matching_types_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     14_logical_matching_types_fail.txt >> %file%
echo TESTING:  Rule 14 - AND/OR operands have mismatched types >> %file%
echo EXPECTED: Semantic error - AND/OR operands have mismatched types >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\14_logical_matching_types_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     15_logical_boolean_operands_pass.txt >> %file%
echo TESTING:  Rule 15 - AND/OR/NOT operands are Boolean >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\15_logical_boolean_operands_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     15_logical_boolean_operands_fail.txt >> %file%
echo TESTING:  Rule 15 - AND/OR/NOT operands are not Boolean >> %file%
echo EXPECTED: Semantic error - AND/OR/NOT operands are not Boolean >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\15_logical_boolean_operands_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     16_comparison_matching_types_pass.txt >> %file%
echo TESTING:  Rule 16 - Comparison operands have matching types >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\16_comparison_matching_types_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     16_comparison_matching_types_fail.txt >> %file%
echo TESTING:  Rule 16 - Comparison operands have mismatched types >> %file%
echo EXPECTED: Semantic error - Comparison operands have mismatched types >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\16_comparison_matching_types_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     17_comparison_numeric_operands_pass.txt >> %file%
echo TESTING:  Rule 17 - Comparison operands are INF or FA >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\17_comparison_numeric_operands_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     17_comparison_numeric_operands_fail.txt >> %file%
echo TESTING:  Rule 17 - Comparison operands are not INF or FA >> %file%
echo EXPECTED: Semantic error - Comparison operands are not INF or FA >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\17_comparison_numeric_operands_fail.txt >> %file%
echo. >> %file%

:: Assignment statements

echo ======================================================================== >> %file%
echo TEST:     18_assignment_undeclared_identifier_pass.txt >> %file%
echo TESTING:  Rule 18 - Assignment target is declared >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\18_assignment_undeclared_identifier_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     18_assignment_undeclared_identifier_fail.txt >> %file%
echo TESTING:  Rule 18 - Assignment target is undeclared >> %file%
echo EXPECTED: Semantic error - Assignment target is undeclared >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\18_assignment_undeclared_identifier_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     19_assignment_non_variable_pass.txt >> %file%
echo TESTING:  Rule 19 - Assignment target is a variable >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\19_assignment_non_variable_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     19_assignment_non_variable_fail.txt >> %file%
echo TESTING:  Rule 19 - Assignment target is an identifier that is not a variable >> %file%
echo EXPECTED: Semantic error - Assignment target is an identifier that is not a variable >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\19_assignment_non_variable_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     20_assignment_constant_pass.txt >> %file%
echo TESTING:  Rule 20 - Assignment updates a mutable variable >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\20_assignment_constant_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     20_assignment_constant_fail.txt >> %file%
echo TESTING:  Rule 20 - Assignment attempts to update an SOP constant >> %file%
echo EXPECTED: Semantic error - Assignment attempts to update an SOP constant >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\20_assignment_constant_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     21_assignment_type_mismatch_pass.txt >> %file%
echo TESTING:  Rule 21 - Assigned expression matches the variable type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\21_assignment_type_mismatch_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     21_assignment_type_mismatch_fail.txt >> %file%
echo TESTING:  Rule 21 - Assigned expression does not match the variable type >> %file%
echo EXPECTED: Semantic error - Assigned expression does not match the variable type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\21_assignment_type_mismatch_fail.txt >> %file%
echo. >> %file%

:: Procedure declarations

echo ======================================================================== >> %file%
echo TEST:     22_procedure_duplicate_pass.txt >> %file%
echo TESTING:  Rule 22 - MISSION name is unused in the relevant symbol table >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\22_procedure_duplicate_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     22_procedure_duplicate_fail.txt >> %file%
echo TESTING:  Rule 22 - MISSION name is already used in the relevant symbol table >> %file%
echo EXPECTED: Semantic error - MISSION name is already used in the relevant symbol table >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\22_procedure_duplicate_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     23_parameter_invalid_type_pass.txt >> %file%
echo TESTING:  Rule 23 - Formal parameter has a valid type >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\23_parameter_invalid_type_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     23_parameter_invalid_type_fail.txt >> %file%
echo TESTING:  Rule 23 - Formal parameter has an invalid type >> %file%
echo EXPECTED: Semantic error - Formal parameter has an invalid type >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\23_parameter_invalid_type_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     24_parameter_duplicate_pass.txt >> %file%
echo TESTING:  Rule 24 - Formal parameter names are unique within the MISSION >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\24_parameter_duplicate_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     24_parameter_duplicate_fail.txt >> %file%
echo TESTING:  Rule 24 - Formal parameter names are duplicated within the MISSION >> %file%
echo EXPECTED: Semantic error - Formal parameter names are duplicated within the MISSION >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\24_parameter_duplicate_fail.txt >> %file%
echo. >> %file%

:: Procedure calls

echo ======================================================================== >> %file%
echo TEST:     25_call_undeclared_procedure_pass.txt >> %file%
echo TESTING:  Rule 25 - Call refers to a declared MISSION >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\25_call_undeclared_procedure_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     25_call_undeclared_procedure_fail.txt >> %file%
echo TESTING:  Rule 25 - Call refers to an undeclared procedure name >> %file%
echo EXPECTED: Semantic error - Call refers to an undeclared procedure name >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\25_call_undeclared_procedure_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     26_call_non_procedure_pass.txt >> %file%
echo TESTING:  Rule 26 - Call target is a MISSION >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\26_call_non_procedure_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     26_call_non_procedure_fail.txt >> %file%
echo TESTING:  Rule 26 - Call target exists but is not a procedure >> %file%
echo EXPECTED: Semantic error - Call target exists but is not a procedure >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\26_call_non_procedure_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     27_call_argument_types_pass.txt >> %file%
echo TESTING:  Rule 27 - Argument types match formal parameter types >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\27_call_argument_types_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     27_call_argument_types_fail.txt >> %file%
echo TESTING:  Rule 27 - Argument types do not match formal parameter types >> %file%
echo EXPECTED: Semantic error - Argument types do not match formal parameter types >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\27_call_argument_types_fail.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     28_call_argument_count_pass.txt >> %file%
echo TESTING:  Rule 28 - Argument count matches formal parameter count >> %file%
echo EXPECTED: No semantic errors >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\28_call_argument_count_pass.txt >> %file%
echo. >> %file%

echo ======================================================================== >> %file%
echo TEST:     28_call_argument_count_fail.txt >> %file%
echo TESTING:  Rule 28 - Argument count does not match formal parameter count >> %file%
echo EXPECTED: Semantic error - Argument count does not match formal parameter count >> %file%
echo ------------------------------------------------------------------------ >> %file%
bin\Debug\ConsoleApplication.exe testcases\pex3\28_call_argument_count_fail.txt >> %file%
echo. >> %file%

pause
