defmodule NameBadge do
  @owner_dept "OWNER"
  @separator " - "
  def print(id, name, department) do
    department = if is_nil(department), do: @owner_dept, else: String.upcase(department)
    id = if is_nil(id), do: nil, else: "[#{id}]"
    
    [id, name, department]
    |> Enum.reject(&is_nil(&1))
    |> Enum.join(@separator)
  end
end
