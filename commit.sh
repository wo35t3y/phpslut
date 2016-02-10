#!/bin/bash


id_string=$( date +%Y%m%d%k%M%S );

git add . ;
git status ;

read commit_text;

commit_text="$id_string $commit_text";
echo $commit_text;


git commit -m "$commit_text";
git push;
