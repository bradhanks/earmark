defmodule Earmark.SysInterface do
  def readlines(device)

  def readlines(:stdio),
    do: Agent.get_and_update(__MODULE__, &{Map.get(&1, :stdio), %{stdio: []}})

  def readlines(filename) when is_binary(filename) do
    case File.open(filename, [:utf8]) do
      {:ok, device} -> readlines(device)
      {:error, _} = error -> error
    end
  end

  def readlines(device), do: IO.stream(device, :line)

  def start_link do
    Agent.start_link(fn -> %{stdio: []} end, name: __MODULE__)
  end

  def mock_stdio(lines) do
    Agent.update(__MODULE__, &Map.put(&1, :stdio, lines))
  end
end

#  SPDX-License-Identifier: Apache-2.0
