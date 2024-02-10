// path to ~ home directory
export const HOME = process.env.HOME;

// path to .config directory
export const CONFIG_PATH =
  process.env.XDG_CONFIG_HOME || process.env.HOME + "/.config";
