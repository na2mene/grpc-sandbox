require 'grpc'
require './lib/user_services_pb'

class UserServer < User::UserService::Service
  def get_user(request, _unused_call)
    User::User.new(id: request.user_id, username: '山田太郎')
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(UserServer)
server.run_till_terminated
