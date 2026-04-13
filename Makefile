.PHONY: build-docker push-docker

build build-docker:
	for version in 16 17; do \
		docker buildx build --platform linux/amd64,linux/arm64 \
			--build-arg PG_MAJOR=$$version \
			-t ramsrib/pgvector:$$version . ; \
	done

push push-docker:
	for version in 16 17; do \
		docker buildx build --platform linux/amd64,linux/arm64 \
			--build-arg PG_MAJOR=$$version \
			-t ramsrib/pgvector:$$version --push . ; \
	done
	docker buildx build --platform linux/amd64,linux/arm64 \
		--build-arg PG_MAJOR=17 \
		-t ramsrib/pgvector:latest --push .
