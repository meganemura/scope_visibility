RSpec.describe ScopeVisibility do
  class Foo
    extend ScopeVisibility::VisibilityMethods

    @public_scope1 = scope_visibility_public?
    @public_scope_visibility1 = scope_visibility

    private

    @private_scope1 = scope_visibility_private?
    @private_scope_visibility1 = scope_visibility

    protected

    @protected_scope1 = scope_visibility_protected?
    @protected_scope_visibility1 = scope_visibility

    public

    @public_scope2 = scope_visibility_public?
    @public_scope_visibility2 = scope_visibility
  end

  let(:klass) { Foo }

  describe ".scope_visibility" do
    it "returns scope visibility" do
      expect(klass.instance_variable_get(:@public_scope_visibility1)).to eq(:public)
      expect(klass.instance_variable_get(:@private_scope_visibility1)).to eq(:private)
      expect(klass.instance_variable_get(:@protected_scope_visibility1)).to eq(:protected)
      expect(klass.instance_variable_get(:@public_scope_visibility2)).to eq(:public)
    end
  end

  describe ".scope_visibility_xxx? predicates" do
    it "returns true" do
      expect(klass.instance_variable_get(:@public_scope1)).to eq(true)
      expect(klass.instance_variable_get(:@private_scope1)).to eq(true)
      expect(klass.instance_variable_get(:@protected_scope1)).to eq(true)
      expect(klass.instance_variable_get(:@public_scope2)).to eq(true)
    end
  end
end
