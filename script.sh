# !/bin/bash

echo "🔥🔥🔥Beginning build!! 🔥🔥🔥"

# firstline=$(head source/changelog.md)
# echo $firstline
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version

echo 'Do you want to continue? (enter "1" for yes, "0" for no)'
read versioncontinue

if [[ $versioncontinue != "1" && $versioncontinue != "0" ]]
then
  echo "Invalid input. Please enter 1 or 0."
  exit 1
fi

if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  # Loop through each file in source directory
  for filename in source/*
  do
    echo $filename
    
    if [ $filename == "source/secretinfo.md" ]
    then
      echo "Not copying $filename with sensitive info"
      # copy file but replacing sensitive info to 'XX' 
      # echo "Copying $filename with sensitive info replaced"
      # sed 's/42/XX/g' "$filename" > build/secretinfo.md
    else
      echo "Copying" $filename
      mkdir -p build
      cp "$filename" build
    fi
  done

else
  echo "Please come back when you are ready"
fi
if [ $versioncontinue -eq 1 ]
then
  cd build
  echo "Build version $version contains:"
  ls
  cd ../
fi

