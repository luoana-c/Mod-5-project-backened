class ApplicationController < ActionController::API
    def currrent_user 
        User.find(token_user_id)
    end 

    def issue_token(payload)
        JWT.encode(payload, secret)
    end 

    def token_user_id
        decoded_token.first['id']
    end 

    def decoded_token
        begin 
            return JWT.decode(token, secret)
        rescue JWT::DecodeError
            return [{}]
        end 
    end

    def token
        request.headers['Authorization']
    end

    def secret
        'shhh'
    end 
end
