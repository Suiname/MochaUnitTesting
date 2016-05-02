TESTS=$(shell find test/ -name "*.test.js")
MOCHA=node_modules/.bin/mocha
_MOCHA=node_modules/.bin/_mocha

xunit:
	@# check if reports folder exists, if not create it
	@test -d reports || mkdir reports
	XUNIT_FILE="reports/TESTS-xunit.xml" $(MOCHA) -R xunit-file $(TESTS)

coverage:
	@# check if reports folder exists, if not create it
	@test -d reports || mkdir reports
	$(ISTANBUL) cover --report lcovonly --dir ./reports $(_MOCHA) -- -R spec $(TESTS)

sonar:
	@# add the sonar sonar-runner executable to the PATH and run it
	PATH="$$PWD/tools/sonar-runner-2.2/bin:$$PATH" sonar-runner
