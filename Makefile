update:
	@echo yet implementation.
init:
	git submodule update --init
	for e in `grep path .gitmodules | awk '{print $3}'`; do (cd $e; git checkout master); done
