proto:
	 protoc --proto_path=protos --go_out=pb  --go_opt=paths=source_relative \
	   --go-grpc_out=pb --go-grpc_opt=paths_relative \
	   protos/translations.proto


.PHONY: proto
ls