import sys
import time

if __name__ == "__main__":
  time.sleep(10)
  filename = sys.argv[1]
  with open(filename, 'r') as par_file:
    content = par_file.read().rstrip()
    print(content)
  time.sleep(10)
