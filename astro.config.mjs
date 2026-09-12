// @ts-check
import { defineConfig } from 'astro/config';
import { fileURLToPath } from 'node:url';
import tailwindcss from '@tailwindcss/vite';
import * as YAML from 'yaml';

// https://astro.build/config
export default defineConfig({
    vite: {
        resolve: {
            alias: {
                '#config': fileURLToPath(new URL('./.config/', import.meta.url)),
                '#repo': fileURLToPath(new URL('./', import.meta.url)),
                '#src': fileURLToPath(new URL('./src/', import.meta.url)),
            },
        },
        plugins: [
            tailwindcss({ optimize: true }),
            {
                name: 'import-yaml-raw',
                enforce: 'pre',
                transform(code, id) {
                    if (id.endsWith('.yaml') || id.endsWith('.yml')) {
                        const parsed = YAML.parse(code);  
                        return {
                            code: `export default ${JSON.stringify(parsed)};`,
                            map: null,
                        };
                    }
                },
            },
        ],
    },
});
