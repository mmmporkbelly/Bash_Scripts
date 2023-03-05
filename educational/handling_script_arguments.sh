#!/bin/bash
# Script shows how arguments are handled


echo "\$* gives $*"
echo "\$# gives $#"
echo "\$@ gives $@"
echo "\$0 gives $0"

# For loops

for i in $*
do
	echo $i
done

# Show what $@ does

for i in $@
do
	echo $i
done
exit 0
