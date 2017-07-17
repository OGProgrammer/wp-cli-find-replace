# Search and replace but skip one column
$ wp search-replace 'http://example.dev' 'http://example.com' --skip-columns=guid

# Run search/replace operation but dont save in database
$ wp search-replace 'foo' 'bar' wp_posts wp_postmeta wp_terms --dry-run

# Run case-insensitive regex search/replace operation (slow)
$ wp search-replace '\[foo id="([0-9]+)"' '[bar id="\1"' --regex --regex-flags='i'

# Turn your production multisite database into a local dev database
$ wp search-replace --url=example.com example.com example.dev 'wp_*options' wp_blogs

# Search/replace to a SQL file without transforming the database
$ wp search-replace foo bar --export=database.sql

# Bash script: Search/replace production to development url (multisite compatible)
#!/bin/bash
if $(wp --url=http://example.com core is-installed --network); then
    wp search-replace --url=http://example.com 'http://example.com' 'http://example.dev' --recurse-objects --network --skip-columns=guid
else
    wp search-replace 'http://example.com' 'http://example.dev' --recurse-objects --skip-columns=guid
fi