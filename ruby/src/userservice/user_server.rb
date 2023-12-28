require 'grpc'
require './lib/user_services_pb'

# NOTE: servicesのファイルのクラスを継承
class UserServer < User::UserService::Service
  # NOTE: .protoでrpcで定義した名称でメソッドを書く(user_services_pb見た方がわかりやすい↓)
  #       > rpc :GetUser, ::User::GetUserRequest, ::User::User
  def get_user(request, _unused_call)
    # NOTE: .protoでrpcのreturnsに指定した型でレスポンスを作る(user_services_pb見た方がわかりやすい↓)
    #       > rpc :GetUser, ::User::GetUserRequest, ::User::User
    User::User.new(id: request.user_id, username: '山田太郎')
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(UserServer)
server.run_till_terminated
