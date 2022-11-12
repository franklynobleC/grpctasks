
GOPATH:=$(shell go env GOPATH)


GO_SOURCES := $(wildcard *.go)
GO_SOURCES += $(shell find . -type f -name "*.go")

GOFMT ?= gofmt -s




PROTO_SRC_DIR := ${PWD}/proto
PROTO_DST_DIR := ${PWD}/pb



protos: 
	 mkdir -p ${PROTO_DST_DIR} && protoc -I=${PROTO_SRC_DIR}  --go-grpc_out=${PROTO_DST_DIR} ${PROTO_SRC_DIR}/translation.proto
	 --go-grpc_out=${PROTO_DST_DIR}  ${PROTO_SRC_DIR}/translation.proto
	  

.PHONY: proto
proto:
	go get -u google.golang.org/grpc
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
	mkdir -p ${PROTO_DST_DIR} && protoc -I=${PROTO_SRC_DIR} --go-grpc_out=${PROTO_DST_DIR} ${PROTO_SRC_DIR}/translation.proto  
	
	 
	

.PHONY: 
# build: proto
# 	go build -o srv *.go


proto1:
	 go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
	mkdir -p ${PROTO_DST_DIR} && protoc -I=${PROTO_SRC_DIR}  --go-grpc_out:${PROTO_DST_DIR} ${PROTO_SRC_DIR}/translation.proto --go-grpc_out=${PROTO_DST_DIR} ${PROTO_SRC_DIR}/translation.proto	

tools: 
	  go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28
	  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
	 
proto2:	 
	  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2
	  protoc -I=${PROTO_SRC_DIR}   --go-grpc_out=${PROTO_DST_DIR}
	  --go-grpc_out=. --go-grpc_opt=paths=${PROTO_SRC_DIR}/*.proto
		 
local:
	 go run main.go 



tools2:
	
	 go get github.com/grpc-ecosystem/grpc-gateway/v3/protoc-gen-grpc-gateway 
	 go get github.com/grpc-ecosystem/grpc-gateway/v3/protoc-gen-openapiv3 
	 go get google.golang.org/protobuf/cmd/protoc-gen-go 
	 go get google.golang.org/grpc/cmd/protoc-gen-go-grpc

# .PHONY: test
# test:
# 	go test -v ./... -cover


# gen-mocks:
# 	go generate ./...

# local: proto mocks
# 	go run main.go

# tools:
# 	go get golang.org/x/tools/cmd/goimports
# 	go get github.com/kisielk/errcheck
# 	go get golang.org/x/lint/golint
# 	go get github.com/axw/gocov/gocov
# 	go get github.com/matm/gocov-html
# 	go get github.com/tools/godep
# 	go get github.com/mitchellh/gox

# lint:
# 	@hash golangci-lint > /dev/null 2>&1; if [ $$? -ne 0 ]; then \
# 		export BINARY="golangci-lint"; \
# 		curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b $(GOPATH)/bin v1.41.0; \
# 	fi
# 	golangci-lint run --timeout 5m

# vet:
# 	go vet -v ./...

# fmt:
# 	gofmt -w .

# fmt-check:
# 	@diff=$$($(GOFMT) -d $(GO_SOURCES_OWN)); \
# 	if [ -n "$$diff" ]; then \
# 		echo "Please run 'make fmt' and commit the result:"; \
# 		echo "$${diff}"; \
# 		exit 1; \
# 	fi;

# errors:
# 	errcheck -ignoretests -blank ./...

# coverage:
# 	gocov test ./... > $(CURDIR)/coverage.out 2>/dev/null
# 	gocov report $(CURDIR)/coverage.out
# 	if test -z "$$CI"; then \
# 	  gocov-html $(CURDIR)/coverage.out > $(CURDIR)/coverage.html; \
# 	  if which open &>/dev/null; then \
# 	    open $(CURDIR)/coverage.html; \
# 	  fi; \
# 	fiproto:




.PHONY: proto1  proto2 protos  	  