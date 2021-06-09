all:
	-mkdir bin
	go build -o bin/chrome-session-dump *.go
install:
	install -m755 bin/chrome-session-dump /usr/bin
rel:
	GOOS=darwin GOARCH=amd64 go build -o bin/chrome-session-dump-osx *.go
	GOOS=windows GOARCH=amd64 go build -o bin/chrome-session-dump.exe *.go
	GOOS=linux GOARCH=amd64 go build -o bin/chrome-session-dump-linux *.go
	GOOS=linux GOARCH=arm go build -o bin/chrome-session-dump-linux_arm *.go
	GOOS=linux GOARCH=arm64 go build -o bin/chrome-session-dump-linux_arm64 *.go
