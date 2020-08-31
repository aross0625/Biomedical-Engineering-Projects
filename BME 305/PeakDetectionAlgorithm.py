
import matplotlib
import time
import numpy as np
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt

try:
    import nscopeapi as nsapi
    ns = nsapi.nScope()
except Exception as e:
    print("unable to communicate with nScope")
    print(e)
else:
    print("Successfully opened connection to nScope")

ns.setChannelsOn(True,False,False,False)
ns.setSampleRateInHz(100)
ns.requestData(1600)
data = []
ts = []
tpeak = [0]
datapeak = [0]

while ns.requestHasData():
    d = ns.readData(1)
    data.append(d)
    t = time.time()
    ts.append(t)
    ### Insert Detect Peak Code Here ###
    if len(data) > 2:
        last = data[-2]
        current = data[-1]
        tc = ts[-1]
        next1 = data[0]
        A = (current-last)
        B = (next1-current)
        C = (tc-tpeak[-1])
        conditions = [A>0,B<0,current>next1,current>last,current>4,C>0.7]

        if all(conditions):
            datapeak.append(current)
            tpeak.append(tc)
            BPM = 60/(tpeak[-1]-tpeak[-2])
            if BPM > 1:
                print("BPM = %s"%(BPM))


tpeakI = np.trim_zeros(tpeak)
datapeakI = np.trim_zeros(datapeak)
BPtsec = len(tpeakI)
average = (6000000000/(ts[-1])*BPtsec)

print("Average BPM = %s"%(average))

plt.plot(ts,data,'k-')
plt.xlabel('Time(seconds)')
plt.ylabel('Heartbeats')
plt.title('BPM = %i' %(average))
plt.show()
