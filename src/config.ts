import * as zod from 'zod';

// @ts-ignore YAML files do not support types yet.
import projectsSource from '#config/projects.yaml'; 

// @ts-ignore YAML files do not support types yet.
import educationSource from '#config/education.yaml'; 

// @ts-ignore YAML files do not support types yet.
import careerSource from '#config/career.yaml'; 

//@ts-ignore YAML files can't have types (yet).
import base16Source from "#config/base16.yaml";

//@ts-ignore YAML files can't have types (yet).
import competenciesSource from "#config/competencies.yaml";

export namespace Projects {
  export const schema = zod.object({
    repo: zod.string(),
    user: zod.string(),
    desc: zod.string(),
  });

  export const config = schema.array().parse(projectsSource);
}

/** The type of an `Project`. */
export type Project = zod.infer<typeof Projects.schema>;

/** An entry in the job or education history. */
export namespace Entry {

  /** The date at time of compilation. */
  export const TODAY = (() => {
    const today = new Date(Date.now());
    today.setUTCHours(0, 0, 0, 0,);
    return today;
  })();  

  /** A job or educational background entry */
  export const schema = zod.object({
    'class': zod.string().default(''),
    name: zod.string(),
    description: zod.string(),
    location: zod.string(),
    start_date: zod.coerce.date(),
    end_date: zod.coerce.date().default(TODAY),
    show_on: zod.object({
      site: zod.boolean().default(true),
      pdf: zod.boolean().default(true),
    }).default({
      site: true,
      pdf: true,
    }),
  });

  /** The type of an `Entry`. */
  export type Type = zod.infer<typeof Entry.schema>;
}

/** The type of an `Entry`. */
export type Entry = Entry.Type;

const multipleEntries = Entry.schema.array();

export namespace Education {
  
  export const schema = multipleEntries;

  export const config = schema.parse(educationSource);
}

export namespace Career {
  export const schema = multipleEntries;
  export const config = schema.parse(careerSource);
}

export namespace Base16 {
  

/** A parser to get hex colors. */
export const hexColor = zod.string()
  .regex(/^#[0-9A-Fa-f]{6}$/, "Invalid hex color")
  .brand<"HexColor">();

  /** The type of a hex color. */
  export type HexColor = zod.infer<typeof hexColor>;

  const base16 = zod.object({
    base00: hexColor,
    base01: hexColor,
    base02: hexColor,
    base03: hexColor,
    base04: hexColor,
    base05: hexColor,
    base06: hexColor,
    base07: hexColor,
    base08: hexColor,
    base09: hexColor,
    base0A: hexColor,
    base0B: hexColor,
    base0C: hexColor,
    base0D: hexColor,
    base0E: hexColor,
    base0F: hexColor,
  });

  export const schema = base16.or(zod.object({
    light: base16,
    dark: base16,
  }));

  /** A base16 color schema. */
  export type Type = zod.infer<typeof base16>;

  /** The colors selected by the user. */
  export const config = schema.parse(base16Source);
}

export type Base16 = Base16.Type;

export namespace Competencies {

  export const schema = zod.object({
    languages: zod.string().array(),
    skills: zod.string().array(),
    tools: zod.string().array(),
  });

  export const config = schema.parse(competenciesSource);
  
  export type Type = zod.infer<typeof schema>;
}

export type Competencies = Competencies.Type;
