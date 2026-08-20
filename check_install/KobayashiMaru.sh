#!/bin/bash

# Break on error
set -e

# -----------------------------------------
# Test standard tools
# -----------------------------------------
vim --version

# -----------------------------------------
# Test FreePascal
# -----------------------------------------
cat > /tmp/lazarus_test.pas << 'EOF'
program LazarusTest;
begin
    WriteLn('Hello World from (Free)Pascal');
end.
EOF

fpc /tmp/lazarus_test.pas
/tmp/lazarus_test
rm -f /tmp/lazarus_test /tmp/lazarus_test.o
# -----------------------------------------

# -----------------------------------------
# Test PHP
# -----------------------------------------
php -r 'echo "I am PHP " . PHP_VERSION . ", therefore, PHP is alive.\n";'
# -----------------------------------------

# -----------------------------------------
# Test DotNet
# -----------------------------------------
dotnet --version

# -----------------------------------------
# Test SQLite
# -----------------------------------------
sqlite3 --version

# -----------------------------------------
# Test C3
# -----------------------------------------
c3c --version
cat > /tmp/c3_hello.c3 << 'EOF'
module hello;
import std::io;
fn void main()
{
    io::printn("Hello from C3!");
}
EOF

c3c compile /tmp/c3_hello.c3 o /tmp/hello_c3
/tmp/c3_hello.c3
# -----------------------------------------

# -----------------------------------------
# Test d
# -----------------------------------------
ldc2 --version
cat > /tmp/d_hello.d << 'EOF'
import std.stdio;
void main()
{
    writeln("Hello from D!");
}
EOF

ldc2 /tmp/d_hello.d -of=/tmp/d_hello
/tmp/hello
# -----------------------------------------

echo "------------------------------------------------"
echo "-------------- Status update -------------------"
echo "------------------------------------------------"
echo ""
echo "vim ...........passed"
echo "FreePascal ... passed"
echo "PHP .......... passed"
echo "DotNet ....... passed"
echo "SQLite ....... passed"
echo "C3 ........... passed"
echo "d ............ passed"
echo ""
echo "------------------------------------------------"
echo "- Your distro survived the Kobayashi Maru test -"
echo "------------------------------------------------"

