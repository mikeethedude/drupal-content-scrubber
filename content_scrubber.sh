#! /usr/bin/bash

# The only argument is the drush or other command to use to delete these.
if [$1 == ""];then
  >&2 echo "Expected usage ./content_scrubber.sh 'lando drush sql:query' or terminus equivalent"
  exit 1
fi
COMMAND=$1

# All of the tables to scrub, change these based on your site.
TABLES=("crop" "crop_field_data" "crop_field_revision" "entity_usage" "file_managed" "media" "media_field_data" "media_revision" "node" "node_field_data" "node_revision" "node_field_revision" "paragraphs_item" "paragraphs_item_field_data" "paragraphs_item_revision" "paragraphs_item_revision_field_data" "paragraphs_library_item" "paragraphs_library_item_field_data" "paragraphs_library_item_revision" "paragraphs_library_item_field_revision_data" "queue" "batch" "redirect" "search_api_item" "search_api_task" "taxonomy_term_data" "taxonomy_term_field_data" "taxonomy_term_revision" "taxonomy_term_field_revision" "taxonomy_term__parent" "taxonomy_index")

# Loop through each of these and delete.
for TABLE in ${TABLES[@]}; do
  echo "Clearing table: ${TABLE}"
  $COMMAND "DELETE FROM ${TABLE}"
  STATUS=$?
  if [ $STATUS -ne 0 ]; then
    echo "Table not found or command for ${TABLE} failed."
  fi
done
