defmodule AshAdmin.Web do
  @moduledoc false

  @doc false
  def view do
    quote do
      @moduledoc false
      use Phoenix.Template, root: "lib/ash_admin/templates"

      unquote(view_helpers())
    end
  end

  @doc false
  def live_view do
    quote do
      @moduledoc false
      use Phoenix.LiveView, layout: {AshAdmin.LayoutView, :app}

      unquote(view_helpers())
    end
  end

  @doc false
  def live_component do
    quote do
      @moduledoc false
      use Phoenix.LiveComponent

      unquote(view_helpers())
    end
  end

  defp view_helpers do
    quote do
      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import AshAdmin.Helpers

      case Code.ensure_compiled(Phoenix.Component) do
        {:module, _} ->
          import Phoenix.Component

        _ ->
          # Import convenience functions for LiveView rendering
          import Phoenix.LiveView.Helpers
      end
    end
  end

  @doc """
  Convenience helper for using the functions above.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
