defmodule Drops.ValidatorTest do
  use Drops.ContractCase
  use Drops.Validator

  describe "validate/3" do
    test "validates a string" do
      assert validate("foo", Types.new({:type, {:string, []}}, []), path: []) ==
               {:ok, {[], "foo"}}
    end

    test "validates an integer with constraints" do
      assert validate(11, Types.new({:type, {:integer, [:odd?]}}, []), path: []) ==
               {:ok, {[], 11}}
    end
  end
end
