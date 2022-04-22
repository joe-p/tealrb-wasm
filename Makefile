ruby-wasm: 
	wget https://github.com/ruby/ruby.wasm/releases/download/2022-04-21-a/ruby-head-wasm32-unknown-wasi-full.tar.gz
	tar xfz ruby-head-wasm32-unknown-wasi-full.tar.gz
	mv head-wasm32-unknown-wasi-full/usr/local/bin/ruby ruby.wasm

build:
	wasi-vfs pack ruby.wasm --mapdir /src::./src --mapdir /usr::./head-wasm32-unknown-wasi-full/usr -o tealrb_demo.wasm

run: 
	wasmtime tealrb_demo.wasm -- /src/tealrb/examples/demo.rb > wasm.teal