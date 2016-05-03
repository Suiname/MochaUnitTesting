TESTS=$(shell find test/ -name "*.test.js")
MOCHA=node_modules/.bin/mocha
_MOCHA=node_modules/.bin/_mocha
ISTANBUL=node_modules/.bin/istanbul

xunit:
	@# check if reports folder exists, if not create it
	@test -d reports || mkdir reports
	GUNIT_FILE="./reports/TESTS-gunit.xml" $(MOCHA) -R mocha-sonar-generic-test-coverage-file $(TESTS)

coverage:
	@# check if reports folder exists, if not create it
	@test -d reports || mkdir reports
	$(ISTANBUL) cover --report lcovonly --dir ./reports $(_MOCHA) -- -R spec $(TESTS)

sonar:
	@# add the sonar sonar-runner executable to the PATH and run it
	PATH="$$PWD/tools/sonar-runner-2.2/bin:$$PATH" sonar-runner
