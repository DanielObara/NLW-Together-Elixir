defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exist, returns the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Daniel" => 26.026174895895306,
           "Diego" => 25.24933720489837,
           "Aghata" => 20.811654526534856,
         }}

      assert response == expected_response
    end

    test "when the wrong file name is given, returns an error" do
      params = %{"filename" => "banana.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
