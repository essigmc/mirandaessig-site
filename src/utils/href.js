// Prefix internal links with the deploy base so PR previews (served at
// /pr-preview/pr-N/) resolve correctly while production stays at "/".
export function href(path = '/') {
  const base = import.meta.env.BASE_URL || '/';
  const b = base.endsWith('/') ? base.slice(0, -1) : base;
  const p = path.startsWith('/') ? path : '/' + path;
  return (b + p) || '/';
}
