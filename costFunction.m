function cost = costFunction(x, inputdata)
    %x is going to vecot of inputs args, should be a0 to d0 and tau0


    cost = 0;
    tau = x(5);
    for i =1:numel(inputdata.stimamps)
        Ps = perceivedIntensity(inputdata.stimfreq, inputdata.stimamps(i), inputdata.stimthresh, inputdata.time, tau);
        Ps = Ps(end);
        cost = cost + (x(2) + x(4)/(1+exp(-(x(1)*(Ps-x(3))))) - inputdata.Pdetect(i))^2;
       
    end
end