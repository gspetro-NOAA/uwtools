# Actions invokes script with: bash -e <script>

set -ux
f=recipe/meta.json
tag=v$(jq -r .version $f)-$(jq -r .buildnum $f)
if git ls-remote --tags origin | grep -q "/$tag$"; then
  (set +x && echo TAG $tag ALREADY EXISTS)
  exit 1
fi
