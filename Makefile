.PHONY: build-docker push-docker

build build-docker:
	for version in 15 16; do \
		docker build --build-arg PG_MAJOR=$$version -t ramsrib/pgvector:$$version . ; \
	done

push push-docker:
	for version in 15 16; do \
		docker push ramsrib/pgvector:$$version ; \
	done
	docker tag ramsrib/pgvector:16 ramsrib/pgvector:latest
	docker push ramsrib/pgvector:latest
