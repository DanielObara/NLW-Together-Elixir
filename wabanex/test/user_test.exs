defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "daniel", email: "daniel@teste.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: true,
               changes: %{email: "daniel@teste.com", name: "daniel", password: "123456"},
               errors: []
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{name: "d", email: "daniel@teste.com", password: "12345"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               valid?: false,
               changes: %{email: "daniel@teste.com", name: "d", password: "12345"},
               errors: [
                 name:
                   {"should be at least %{count} character(s)",
                    [count: 2, validation: :length, kind: :min, type: :string]},
                 password:
                   {"should be at least %{count} character(s)",
                    [count: 6, validation: :length, kind: :min, type: :string]}
               ]
             } = response
    end
  end
end
