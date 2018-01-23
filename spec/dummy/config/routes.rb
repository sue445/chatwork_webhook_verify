Rails.application.routes.draw do
  post "/webhook" => "webhook#test"
end
