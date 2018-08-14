.PHONY: hello
hello:
	rm -f ./html/*
	GOOS=js GOARCH=wasm go1.11rc1 build -o ./html/test.wasm ./hello/main.go
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.html ./html/index.html
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.js ./html/wasm_exec.js

.PHONY: channels
channels:
	rm -f ./html/*
	GOOS=js GOARCH=wasm go1.11rc1 build -o ./html/test.wasm ./channels/main.go
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.html ./html/index.html
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.js ./html/wasm_exec.js

.PHONY: js
js:
	rm -f ./html/*
	GOOS=js GOARCH=wasm go1.11rc1 build -o ./html/test.wasm ./js/main.go
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.html ./html/index.html
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.js ./html/wasm_exec.js
	sed -i -e 's;</button>;</button>\n\t<div id=\"target\"></div>;' ./html/index.html

.PHONY: fetch
fetch:
	rm -f ./html/*
	GOOS=js GOARCH=wasm go1.11rc1 build -o ./html/test.wasm ./fetch/main.go
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.html ./html/index.html
	cp $$(go1.11rc1 env GOROOT)/misc/wasm/wasm_exec.js ./html/wasm_exec.js
	sed -i -e 's;</button>;</button>\n\t<div id=\"target\"></div>;' ./html/index.html

serve:
	go run main.go