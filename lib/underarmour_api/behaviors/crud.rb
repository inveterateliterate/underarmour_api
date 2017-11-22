module UnderarmourApi
  module Behaviors
    module Crud

      ACTIONS = {
        'find' => 'get',
        'create' => 'post',
        'update' => 'put',
        'delete' => 'delete'
      }

      # ACTIONS.each do |a|
      #   define_method(a) do |klass, **params|
      #     klass.request(a.value, params)
      #   end
      # end
    end
  end
end
