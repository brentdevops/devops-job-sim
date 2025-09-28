IMAGE ?= devops-job-sim-app
TAG ?= v0.1
.PHONY: build run test clean
build:
	docker build -t $(IMAGE):$(TAG) -f app/Dockerfile .

run:
	docker run --rm -p 8080:8080 -e APP_VERSION=$(TAG) $(IMAGE):$(TAG)

test:
	# simple smoke test after running container separately (not starting here)
	curl -sS http://localhost:8080/health || true

clean:
	docker image rm -f $(IMAGE):$(TAG) || true
