function cost = costfunction(x, inputdata)
    %x is going to vector of inputs args, should be a0 to d0 and tau0
    
    cost = 0;
    tau = x(5);
    for i =1:numel(inputdata.stimamps)
        Ps = perceivedintensity(inputdata.stimfreqs(i), inputdata.stimamps(i), inputdata.stimthresh, inputdata.trainlength(i), tau, inputdata.pulsewidth);
        Ps = Ps(end);
        cost = cost + (x(2) + x(4)/(1+exp(-(x(1)*(Ps-x(3))))) - inputdata.pDetect_actual(i))^2;   
        
        
    end
end

%          mlFit_fun = @(params)(sum((fitData.y-(params(1)+params(2)*erf(params(3)*(fitData.x-params(4))))).^2));