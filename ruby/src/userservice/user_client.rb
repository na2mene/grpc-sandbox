require 'grpc'
require './lib/user_services_pb'

def main
  # NOTE: stubを経由してサーバへ通信をする.(user_services_pbにあるので、それを使う)
  #       > Stub = Service.rpc_stub_class
  stub = User::UserService::Stub.new('localhost:50051', :this_channel_is_insecure)
  # NOTE: .protoでrpcの引数に指定した型でリクエストを作る(user_services_pb見た方がわかりやすい↓)
  #       > rpc :GetUser, ::User::GetUserRequest, ::User::User
  user = stub.get_user(User::GetUserRequest.new(user_id: '2FFA4396-EB75-4240-9E44-ECA1E530DABE'))
  puts user.to_json
end

main
