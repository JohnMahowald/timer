#! /bin/bash

TIMER_SRC_DIR="/Users/johnmahowald/Desktop/day/07.31.2018/timer"
NUMBER_DIR="$TIMER_SRC_DIR/numbers"

while true; do
  now=$(date +"%H:%M:%S:%p")

  output_display=""

  for idx in $(seq 7); do # there are 7 lines in each font file
    # output_line=$(($idx - 1))
    output_line=$idx

    for l in $(seq ${#now}); do
      char=${now:l-1:1}
      lower_char=$(awk '{ print tolower($0) }' <<< $char)
      filename="$lower_char.txt"

      sed_args_postfix="q;d"
      sed_args=$output_line$sed_args_postfix

      content=$(sed $sed_args $NUMBER_DIR/$filename)
      output_display="$output_display  $content"
    done
    output_display="$output_display\n"

  done

  clear screen
  printf "$output_display"
done
