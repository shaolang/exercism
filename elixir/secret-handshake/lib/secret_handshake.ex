defmodule SecretHandshake do
  use Bitwise, only_operators: true

  @cmds [{1, "wink"}, {2, "double blink"}, {4, "close your eyes"}, {8, "jump"}]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = @cmds
            |> Stream.map(fn {x, action} -> command(action, x, code) end)
            |> Enum.reject(&is_nil/1)

    if (code &&& 16) == 0 do
      result
    else
      Enum.reverse(result)
    end
  end

  defp command(_, x, y) when (x &&& y) == 0, do: nil
  defp command(s, _, _), do: s
end
