.PHONY: build release

build: 
	docker build -t vigneshwarravichandran/ci_pipeline .
	docker push vigneshwarravichandran/ci_pipeline

release:
	docker run -d vigneshwarravichandran/ci_pipeline