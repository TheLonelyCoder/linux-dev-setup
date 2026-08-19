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
cat > /tmp/lazarus_test.pas <<'EOF'
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

echo "------------------------------------------------"
echo "-------------- Status update -------------------"
echo "------------------------------------------------"
echo ""
echo "vim ...........passed"
echo "FreePascal ... passed"
echo "PHP .......... passed"
echo "DotNet ....... passed"
echo "SQLite ....... passed"
echo ""
echo "------------------------------------------------"
echo "- Your distro survived the Kobayashi Maru test -"
echo "------------------------------------------------"

