# bin-bash-shebang

## Moving files around

```
gh issue list --label "template"  --json title,body --template '{{range .}}{{printf "gh issue create --title %q --body -F < %q \n" .title .body}}{{end}}'
```

for i in "$(jq -r '.[]' issues.json)"; do
    title=$(echo $i | jq -r .title)
    body=$(echo $i | jq -r .body)
    echo "$body" > tmp.body.txt
    echo gh issue create --title \"$title\" --body-file tmp.body.txt
done


for row in $(jq -r '.[] | issues.json'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }
   echo $(_jq '.name')
done



----


REPOROOT=$(git rev-parse --show-toplevel)
TEMPLATEDIR=$REPOROOT.github/template
TEMPLATECONFIG=$TEMPLATEDIR/gitconfig
LABEL=$(git config -f $TEMPLATECONFIG template.issue-label)
TEMPLATEREPO=$(git config -f .TEMPLATECONFIG template.repo)
ISSUES=.github/template/issues.json
tmpfile=.github/template/tmp-body.md

[ -e $issues ] || gh issue list --label $LABEL -R $TEMPLATEREPO --json 'title,body' > $issues

for row in $(cat $issues | jq -r '.[] | @base64'); do
    _jq() { 
     echo ${row} | base64 --decode | jq -r ${1}
    }
   echo $(_jq '.body') > $tmpfile
   cmd="gh issue create --title \"$(_jq '.title')\" --body-file $tmpfile"
   # echo $cmd
   eval $cmd
   rm $tmpfile
done





[
    {"body":"Start a codespace","title":"Start a codespace"},
    {"body":"The following snippet will run in a linux terminal.\r\n\r\nYou can copy it, paste into the terminal of the CodeSpace - and it will run. You may have to hit <ENTER> to execute the very last command too.\r\n\r\nBefore you actually try to run it - try to guess (make your notes in the comments)\r\n\r\n- What will happen?\r\n- Will it actually work as it is or do you need to correct anything?\r\n- What programming language is this?\r\n\r\n\r\n``` shell\r\nmkdir samples\r\nmkdir samples/animals\r\nmkdir samples/animals/countries\r\nmkdir samples/animals/countries/movies\r\n\r\nANIMALS=('Apes' 'Elephants' 'Elephant babies' 'monkies' 'apes')\r\nCOUNTRIES=('Denmark' 'Sweden' 'USA' 'France' 'Italy')\r\nMOVIES=('Batman' 'Sex And The City' 'JFK' 'Poltergeist' 'Germany')\r\n\r\ncd samples/animals \r\nfor id in \"${ANIMALS[@]}\"\r\ndo\r\n  echo $id >> $id.txt\r\ndone\r\n\r\ncd countries\r\nfor id in \"${COUNTRIES[@]}\"\r\ndo\r\n  echo $id >> $id.txt\r\ndone\r\n\r\ncd movies\r\nfor id in \"${MOVIES[@]}\"\r\ndo\r\n  echo $id >> $id.txt\r\ndone\r\n\r\n```\r\n","title":"Create some sample files"},
    {"body":"Take the snippet from the previous issue and turn it into an executable script.","title":"Make a script "}
]
