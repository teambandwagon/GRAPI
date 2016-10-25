with open("data.txt", "r") as data, open("results.txt", "r") as results, open("data2.txt", "w") as dout, open("results2.txt", "w") as rout:
    for dataline in data:
        resultline = results.readline()
        datapoints = [float(i) for i in dataline.split(",")]
        if len(datapoints) != 60:
            print(len(datapoints))
            print (resultline)
            print (dataline)
            continue
        for i in range(0, 360, 15):
            p = [datapoints[j] if j%6 != 0 else (datapoints[j] + i)%360 for j in range(60)]
            dout.write(",".join(str(j) for j in p) + "\n")
            rout.write(resultline)
                
