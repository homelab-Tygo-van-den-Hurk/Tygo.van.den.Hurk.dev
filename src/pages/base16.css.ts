import type { APIRoute } from "astro";
import { Base16 } from "#src/config";

/** Whether astro should prerender the page. */
export const prerender = true;

/** The generated CSS. */
export const css = "light" in Base16.config ? /* CSS */ `
@media (prefers-color-scheme: dark) {
  :root {
    --base00: ${Base16.config.dark.base00};
    --base01: ${Base16.config.dark.base01};
    --base02: ${Base16.config.dark.base02};
    --base03: ${Base16.config.dark.base03};
    --base04: ${Base16.config.dark.base04};
    --base05: ${Base16.config.dark.base05};
    --base06: ${Base16.config.dark.base06};
    --base07: ${Base16.config.dark.base07};
    --base08: ${Base16.config.dark.base08};
    --base09: ${Base16.config.dark.base09};
    --base0A: ${Base16.config.dark.base0A};
    --base0B: ${Base16.config.dark.base0B};
    --base0C: ${Base16.config.dark.base0C};
    --base0D: ${Base16.config.dark.base0D};
    --base0E: ${Base16.config.dark.base0E};
    --base0F: ${Base16.config.dark.base0F};
  }
}

@media (prefers-color-scheme: light) {
  :root {
    --base00: ${Base16.config.light.base00};
    --base01: ${Base16.config.light.base01};
    --base02: ${Base16.config.light.base02};
    --base03: ${Base16.config.light.base03};
    --base04: ${Base16.config.light.base04};
    --base05: ${Base16.config.light.base05};
    --base06: ${Base16.config.light.base06};
    --base07: ${Base16.config.light.base07};
    --base08: ${Base16.config.light.base08};
    --base09: ${Base16.config.light.base09};
    --base0A: ${Base16.config.light.base0A};
    --base0B: ${Base16.config.light.base0B};
    --base0C: ${Base16.config.light.base0C};
    --base0D: ${Base16.config.light.base0D};
    --base0E: ${Base16.config.light.base0E};
    --base0F: ${Base16.config.light.base0F};
  }
}
` : /* CSS */ `
:root {
  --base00: ${Base16.config.base00};
  --base01: ${Base16.config.base01};
  --base02: ${Base16.config.base02};
  --base03: ${Base16.config.base03};
  --base04: ${Base16.config.base04};
  --base05: ${Base16.config.base05};
  --base06: ${Base16.config.base06};
  --base07: ${Base16.config.base07};
  --base08: ${Base16.config.base08};
  --base09: ${Base16.config.base09};
  --base0A: ${Base16.config.base0A};
  --base0B: ${Base16.config.base0B};
  --base0C: ${Base16.config.base0C};
  --base0D: ${Base16.config.base0D};
  --base0E: ${Base16.config.base0E};
  --base0F: ${Base16.config.base0F};
}
`;

const file = css.replaceAll(/\s*/gui, "");
const headers = { "Content-Type": "text/css" } as const;
export const GET: APIRoute = async function GET() {
  return new Response(file, { headers });
};
