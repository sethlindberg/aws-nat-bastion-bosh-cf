.PHONY: all plan apply destroy provision ssh

all: plan apply provision

deploy: apply

plan:
	./bin/nbb vpc plan

apply:
	./bin/nbb vpc apply

destroy:
	./bin/nbb vpc destroy

clean:
	./bin/nbb vpc clean

provision:
	./bin/nbb provision all

provision-base:
	./bin/nbb provision base

provision-bosh:
	./bin/nbb provision bosh

provision-cf:
	./bin/nbb provision cf

ssh:
	./bin/nbb bastion ssh

test:
	./bin/nbb vpc test
