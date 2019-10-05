require "binding_ninja"
require "scope_visibility/version"

module ScopeVisibility
  module VisibilityMethods
    def self.extended(klass)
      klass.singleton_class.instance_eval do
        extend(BindingNinja)
        auto_inject_binding(:scope_visibility)
        auto_inject_binding(:scope_visibility_public?)
        auto_inject_binding(:scope_visibility_private?)
        auto_inject_binding(:scope_visibility_protected?)
      end
    end

    def scope_visibility(bind, binding_from_predicate_method = nil)
      bind = binding_from_predicate_method if binding_from_predicate_method

      method_name = "_scope_visibility_trial".to_sym

      eval("def #{method_name}; end", bind, __FILE__, __LINE__ + 1)

      visibility = if private_instance_methods(false).include?(method_name)
                     :private
                   elsif protected_instance_methods(false).include?(method_name)
                     :protected
                   else
                     :public
                   end

      undef_method method_name

      visibility
    end

    def scope_visibility_public?(bind)
      scope_visibility(bind) == :public
    end

    def scope_visibility_private?(bind)
      scope_visibility(bind) == :private
    end

    def scope_visibility_protected?(bind)
      scope_visibility(bind) == :protected
    end
  end
end
