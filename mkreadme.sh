#!/bin/sh

if [ -f README.md.orig ]
then
	mv README.md.orig README-input-$$.md
else
	git checkout master -- README.md
	mv README.md README-input-$$.md
fi
cat > README.md << QUICKLINK
- [code analysis reports](#code-analysis-reports)

QUICKLINK
cat README-input-$$.md >> README.md
rm -f README-input-$$.md
cat >> README.md << HEAD


----------------------

# Code analysis reports

HEAD
(
if [ "`ls -A analysis`" ]
then
	echo '- Clang static code analysis reports:'
	for REPORTDIR in analysis/*
	do
		ID=${REPORTDIR#analysis/}
		DATE=${ID%-*-*-*}
		REMAIN=${ID#*-*-*-}
		TIME=${REMAIN%-*-*}
		HOUR=${TIME%????}
		MINSECS=${TIME#??}
		MINS=${MINSECS%??}
		SECS=${MINSECS#??}
		echo "  - [issues found on ${DATE} ${HOUR}:${MINS}.${SECS}](${REPORTDIR}/index.html)"
	done
fi
if [ "`ls -A coverage`" ]
then
	echo '- Code coverage from `ithitest` program:'
	for SRCDIR in `find coverage -type d -name src`
	do
		REPORTDIR=${SRCDIR%/src}
		BRANCH=${REPORTDIR#coverage/}
		echo "  - [from branch ${BRANCH}](${REPORTDIR}/index.html)"
	done
fi
echo '- [Doxygen documentation (for master branch)](doxygen/index.html)'
echo ''
) >> README.md
git add README.md
awk 'BEGIN{p=1}!/^  - /{p=1}/^include:/{p=0}{if(p)print}' _config.yml > _config.yml.new
echo 'include:' >> _config.yml.new
find doxygen -type f -name "_*" | sed 's/^doxygen\//  - /g' | sort >> _config.yml.new
mv _config.yml.new _config.yml
git add _config.yml
