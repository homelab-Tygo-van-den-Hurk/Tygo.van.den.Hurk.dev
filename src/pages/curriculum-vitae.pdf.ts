import { Projects, Base16, Education, Career, Competencies } from '#src/config';
import { NodeCompiler } from '@myriaddreamin/typst-ts-node-compiler';
import content from '#src/documents/curriculum-vitae.typ?raw';
import portrait from '#repo/public/head-shot.jpg?inline';
import type { APIRoute } from 'astro';

// Old Standard TT
import OldStandardTtBold from '#repo/public/fonts/old-standard-tt/bold.ttf?inline';
import OldStandardTtRegular from '#repo/public/fonts/old-standard-tt/regular.ttf?inline';
import OldStandardTtItalic from '#repo/public/fonts/old-standard-tt/italic.ttf?inline';

// Source Serif Pro
import SourceSerifProBlackItalics from '#repo/public/fonts/source-serif-pro/black-italics.otf?inline';
import SourceSerifProBlack from '#repo/public/fonts/source-serif-pro/black.otf?inline';
import SourceSerifProBoldItalics from '#repo/public/fonts/source-serif-pro/bold-italics.otf?inline';
import SourceSerifProBold from '#repo/public/fonts/source-serif-pro/bold.otf?inline';
import SourceSerifProExtraLightItalics from '#repo/public/fonts/source-serif-pro/extra-light-italics.otf?inline';
import SourceSerifProExtraLight from '#repo/public/fonts/source-serif-pro/extra-light.otf?inline';
import SourceSerifProItalics from '#repo/public/fonts/source-serif-pro/italics.otf?inline';
import SourceSerifProLightItalics from '#repo/public/fonts/source-serif-pro/light-italics.otf?inline';
import SourceSerifProLight from '#repo/public/fonts/source-serif-pro/light.otf?inline';
import SourceSerifProRegular from '#repo/public/fonts/source-serif-pro/regular.otf?inline';
import SourceSerifProSemiBoldItalics from '#repo/public/fonts/source-serif-pro/semi-bold-italics.otf?inline';
import SourceSerifProSemiBold from '#repo/public/fonts/source-serif-pro/semi-bold.otf?inline';

/** Whether astro should prerender the page. */
export const prerender = true;

const authors = ['Tygo van den Hurk'];
const date = Date.now();
const title = 'Curriculum Vitae Tygo van den Hurk';
const compiler = await NodeCompiler.create({
  fontArgs: [
    {
      fontBlobs: [
        OldStandardTtItalic,
        OldStandardTtBold,
        OldStandardTtRegular,
        SourceSerifProBlackItalics,
        SourceSerifProBlack,
        SourceSerifProBoldItalics,
        SourceSerifProBold,
        SourceSerifProExtraLightItalics,
        SourceSerifProExtraLight,
        SourceSerifProItalics,
        SourceSerifProLightItalics,
        SourceSerifProLight,
        SourceSerifProRegular,
        SourceSerifProSemiBoldItalics,
        SourceSerifProSemiBold,
      ].map(font => {
        const base64 = font.split(",")[1];
        return Buffer.from(base64, "base64");
      }),
    },
  ],
});

const colorSchema = (() => {
  if ("light" in Base16.config) return Base16.config.light;
  else return Base16.config;
})();

const colorsInjection = `#let colors = (
  "base00": "${colorSchema.base00}",
  "base01": "${colorSchema.base01}",
  "base02": "${colorSchema.base02}",
  "base03": "${colorSchema.base03}",
  "base04": "${colorSchema.base04}",
  "base05": "${colorSchema.base05}",
  "base06": "${colorSchema.base06}",
  "base07": "${colorSchema.base07}",
  "base08": "${colorSchema.base08}",
  "base09": "${colorSchema.base09}",
  "base0A": "${colorSchema.base0A}",
  "base0B": "${colorSchema.base0B}",
  "base0C": "${colorSchema.base0C}",
  "base0D": "${colorSchema.base0D}",
  "base0E": "${colorSchema.base0E}",
  "base0F": "${colorSchema.base0F}",
);\n` as const;

const base64 = portrait.split(",", 2)[1];
const bytes = Uint8Array.from(
  atob(base64),
  c => c.charCodeAt(0),
);

const portraitInjection = `#let portrait(..args) = image(
  bytes((${Array.from(bytes).join(",")})),
  format: "jpg", ..args,
);` as const;

const projectsInjection = `#let projects = (
  ${Projects.config.map(({ repo, user, desc }) => `(
    "repo": "${repo}",
    "user": "${user}",
    "desc": "${desc}",
  )`).join(',')}
);\n` as const;

const educationInjection = `#let education = (
  ${Education.config.filter(({ show_on }) => show_on.pdf).map(entry => `(
    "name": "${entry.name}",
    "description": "${entry.description}",
    "location": "${entry.location}",
    "start_date": datetime(
      year: ${entry.start_date.getFullYear()},
      month: ${entry.start_date.getMonth() + 1},
      day: ${entry.start_date.getDate()},
    ),
    "end_date": datetime(
      year: ${entry.end_date.getFullYear()},
      month: ${entry.end_date.getMonth() + 1},
      day: ${entry.end_date.getDate()},
    ),
  )`).join(',\n  ')},
);\n` as const;

const careerInjection = `#let career = (
  ${Career.config.filter(({ show_on }) => show_on.pdf).map(entry => `(
    "name": "${entry.name}",
    "description": "${entry.description}",
    "location": "${entry.location}",
    "start_date": datetime(
      year: ${entry.start_date.getFullYear()},
      month: ${entry.start_date.getMonth() + 1}, // In Typst months in dates start at 1 not 0.
      day: ${entry.start_date.getDate()},
    ),
    "end_date": datetime(
      year: ${entry.end_date.getFullYear()},
      month: ${entry.end_date.getMonth() + 1}, // In Typst months in dates start at 1 not 0.
      day: ${entry.end_date.getDate()},
    ),
  )`).join(',\n  ')},
);\n` as const;

const competenciesInjection = `#let competencies = (
  "tools": (
    ${Competencies.config.tools.map(tool => `"${tool}"`).join(",    \n")}
  ),
  "skills": (
    ${Competencies.config.skills.map(skill => `"${skill}"`).join(",    \n")}
  ),
  "languages": (
    ${Competencies.config.languages.map(language => `"${language}"`).join(",    \n")}
  ),
);\n` as const;

const mainFileContent = content
  .replace(/#let\s+portrait.*;\n/gui, portraitInjection)
  .replace(/#let\s+competencies\s*=\s*\([\s\S]*?\);\s*/gui, competenciesInjection)
  .replace(/#let\s+colors\s*=\s*\([\s\S]*?\);\s*/gui, colorsInjection)
  .replace(/#let\s+projects\s*=\s*\([\s\S]*?\);\s*/gui, projectsInjection)
  .replace(/#let\s+career\s*=\s*\([\s\S]*?\);\s*/gui, careerInjection)
  .replace(/#let\s+education\s*=\s*\([\s\S]*?\);\s*/gui, educationInjection);

const document = await compiler.pdf({ 
  mainFileContent,
  authors,
  title,
  date,
});

const buffer = new Uint8Array(document.length);
buffer.set(document);

const headers = { "Content-Type": "application/pdf" } as const;
export const GET: APIRoute = async function GET() {
  return new Response(buffer, { headers });
};
