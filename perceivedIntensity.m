function Ps = perceivedintensity(stimfreq, stimamp, stimthresh, trainlength, tau, pulsewidth)
    % Inputs stimfreq in Hz, stimamp and stimthresh in mAmp, time in seconds

    Ps = NaN(floor(trainlength/pulsewidth), 1); %Ps sampling time interval = length of biphasic pulse, here is 400us

    %generate absolute value of stim signal in increments
    Iamp = zeros(floor(trainlength/pulsewidth),1); 
    Imin = zeros(floor(trainlength/pulsewidth),1); 
    for k = floor(1:((1/pulsewidth)/(stimfreq)):length(Iamp))
        Iamp(k) = stimamp;
        Imin(k) = stimthresh;
    end

    tau = tau/pulsewidth; %625 time points = 250ms 
    Ks = 1; % represents the constants
    Ps(1)=((Iamp(1)^(3/2))-(Imin(1)^(3/2)));
  
    for i = 1:length(Ps)-1
        Ps(i+1) = ((((-1/tau)*Ps(i)) + Ks*((Iamp(i+1)^(3/2))-(Imin(i+1)^(3/2)))))+Ps(i);
    end
    if stimthresh > stimamp
        Ps = zeros(2500*trainlength, 1);
    end
end
