{
  perSystem =
    {
      config,
      self',
      pkgs,
      ...
    }:
    {
      apps.default = config.apps.dev;

      # NPM compatibility

      apps.dev = with pkgs; {
        type = "app";
        program = writeShellApplication {
          name = "dev";
          runtimeInputs = with self'.packages; [ nodejs ];
          text = ''
            ROOT="$(git rev-parse --show-toplevel)"
            [ -d "$ROOT/node_modules" ] || npm ci
            exec npm run dev -- "$@"
          '';
        };
      };

      apps.host = with pkgs; {
        type = "app";
        program = writeShellApplication {
          name = "host";
          runtimeInputs = with self'.packages; [ nodejs ];
          text = ''
            ROOT="$(git rev-parse --show-toplevel)"
            [ -d "$ROOT/node_modules" ] || npm ci
            exec npm run dev -- --host "$@"
          '';
        };
      };

      apps.build = with pkgs; {
        type = "app";
        program = writeShellApplication {
          name = "build";
          runtimeInputs = with self'.packages; [ nodejs ];
          text = ''
            ROOT="$(git rev-parse --show-toplevel)"
            [ -d "$ROOT/node_modules" ] || npm ci
            exec npm run build -- "$@"
          '';
        };
      };

      apps.astro = with pkgs; {
        type = "app";
        program = writeShellApplication {
          name = "astro";
          runtimeInputs = with self'.packages; [ nodejs ];
          text = ''
            ROOT="$(git rev-parse --show-toplevel)"
            [ -d "$ROOT/node_modules" ] || npm ci
            exec npm run astro -- "$@"
          '';
        };
      };
    };
}
