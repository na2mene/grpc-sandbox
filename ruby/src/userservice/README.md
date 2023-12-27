# userservice

## Development
```
# clone
% git clone https://github.com/na2mene/grpc-sandbox.git
% cd ruby/src/userservice

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
