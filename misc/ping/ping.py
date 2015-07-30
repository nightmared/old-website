#!/usr/bin/env python3

import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime

log = open('ping.log', 'r')

y = []
x = list()

while True:
    line = log.readline()
    if line == '' or line == '\n':
        break
    splited = line.split(' - ')
    y.append(splited[1])
    someTime = datetime.strptime(splited[0], "%a %b %d %H:%M:%S")
    x.append(someTime.replace(datetime.now().year))

fig = plt.figure()
ax = fig.add_subplot(111)
graph = ax.plot(x, y, 'r-')
plt.setp(graph, drawstyle='steps')
plt.title('Network connectivity visualizer')
plt.xlabel('Time')
plt.ylabel('Network Avaibility')
plt.yticks(range(0, 2, 1))
ax.xaxis.set_major_formatter(mdates.DateFormatter('%d/%m %H:%m'))
fig.autofmt_xdate()
plt.savefig("network.png", dpi=500)
