function Ps = perceivedIntensity(stimfreq, stimamp, stimthresh, time, tau)
    % Inputs stimfreq in Hz, stimamp and stimthresh in mAmp, time in seconds


    Ps = NaN(2500*time, 1); %Ps sampling time interval = length of biphasic pulse, here is 400us


    %generate absolute value of stim signal in increments
    Iamp = zeros(2500*time,1); 
    Imin = zeros(2500*time,1); 
    for k = floor(1:(2500/(stimfreq)):length(Iamp))
        Iamp(k) = stimamp;
        Imin(k) = stimthresh;
    end

    tau = tau*2500; %625 time points = 250ms 
    Ks = 1; % represents the constants
    Ps(1)=((Iamp(1)^(3/2))-(Imin(1)^(3/2)));
    
    for i = 1:length(Ps)-1
        Ps(i+1) = ((((-1/tau)*Ps(i)) + Ks*((Iamp(i+1)^(3/2))-(Imin(i+1)^(3/2)))))+Ps(i);
    end
    if stimthresh > stimamp
        Ps = zeros(2500*time, 1);
    end
end










