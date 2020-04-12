defmodule SecretHandshake do
  import Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump
  SecretHandshake.commands(0)
  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) when (code &&& 16) == 16 do
    commands(code - 16)
    |> Enum.reverse
  end
  def commands(code) when (code &&& 1) == 1 do
    ["wink" | commands(code - 1)]
  end
  def commands(code) when (code &&& 2) == 2 do
    ["double blink" | commands(code - 2)]
  end
  def commands(code) when (code &&& 4) == 4 do
    ["close your eyes" | commands(code - 4)]
  end
  def commands(code) when (code &&& 8) == 8 do
    ["jump" | commands(code - 8)]
  end
  def commands(_) do
    []
  end
end
