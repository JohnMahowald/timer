#!/usr/bin/env python

import datetime
import os
import subprocess
import time

TIME_FORMAT = "%I:%M:%S %p"
TIMER_SRC_DIR = "/Users/johnmahowald/Desktop/day/07.31.2018/timer"
NUMBER_DIR = "{}/numbers".format(TIMER_SRC_DIR)

class Timer(object):
  @staticmethod
  def load_numbers():
    numbers = {}
    for filename in os.listdir(NUMBER_DIR):
      full_path = os.path.join(NUMBER_DIR, filename)
      basename, ext = os.path.splitext(filename)
      with open(full_path) as f:
        lines = list(f)
        lines = [line.replace('\n', '') for line in lines]
        numbers[basename] = lines
    return numbers

  def __init__(self):
    self._numbers = Timer.load_numbers()
    pass

  def run(self):
    while True:
      time_text = self.generate_font()
      self.print_update(time_text)
      time.sleep(1)

  def print_update(self, text):
    subprocess.call('clear', shell=True)
    print text

  def current_time(self):
    now = datetime.datetime.now()
    return now.strftime(TIME_FORMAT).lower()

  def generate_font(self):
    """
    Note: This assumes all chars are 7 lines long
    """
    output = ""
    current_time = self.current_time()
    for idx in range(7):
      for char in current_time:
        number_data = self._numbers[char][idx]
        output += "{} ".format(number_data)  # adds spacing between numbers
      output += "\n"
    return output

if __name__ == "__main__":
  instance = Timer()
  print instance.run()
