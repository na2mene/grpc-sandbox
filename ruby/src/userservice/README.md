# userservice
The files generated from the .proto file are placed in the 'lib' directory.  
"user_client.rb" and "user_server.rb" scripts are written using files located in the 'lib' directory to implement their logic.  

## Basic Requirements
### Docker
user service are running on a container.  
You can refer official guide to get installed `docker` command.  

- docker  
  https://docs.docker.com/install/

### gRPC over Protocol Buffer
user service communication by [gRPC](https://grpc.io/).  
It uses [protocol buffer](https://developers.google.com/protocol-buffers/docs/overview) as a way to serialize.  
Recommend to check out their docs and install `protoc` command.

## Installation
```
% git clone https://github.com/na2mene/grpc-sandbox.git
% cd ruby/src/userservice
```

## Development
```
# build
% docker build -t grpc_ruby_user .

# run
% docker run -d --name=grpc_ruby_user_service -p 50051:50051 grpc_ruby_user

# exec
% docker exec grpc_ruby_user_service ruby user_client.rb

---

# kill
% docker kill grpc_ruby_user_service

# all delete
% docker rm $(docker ps -aq)
```
