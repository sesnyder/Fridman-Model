function pDetect_Norm = normalizepdetect(pDetect)
    pDetect_min = min(pDetect);
    pDetect_max = max(pDetect);
    
    pDetect_Norm = (pDetect - pDetect_min)/(pDetect_max-pDetect_min); 
end