require 'grpc'
require './lib/user_services_pb'

def main
  stub = User::UserService::Stub.new('localhost:50051', :this_channel_is_insecure)
  user = stub.get_user(User::GetUserRequest.new(user_id: '2FFA4396-EB75-4240-9E44-ECA1E530DABE'))
  puts user.to_json
end

main
