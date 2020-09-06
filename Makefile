.PHONY: all dev test

all: dev

repl:
	cmd-clj -A:cljs:dev clj-repl

dev:
	cmd-clj -A:cljs:dev clj-run build/run

http:
	cd resources/public && python -m http.server 8080

js-deps:
	rm -rf .node_modules .shadow-cljs && npm install

clean:
	rm -rf .shadow-cljs .cpcache resources/public/cljs target

release-cljs:
	@echo "Build release js"
	cmd-clj -A:cljs release app --config-merge '{:output-dir "target/cljs"}'

debug-cljs:
	@echo "Build release debug js"
	cmd-clj -A:cljs release app --debug --config-merge '{:output-dir "target/cljs"}'
