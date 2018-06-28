function meanRT = getmeanrt(data)

    meanRT = NaN(numel(data.cueInfo),1);
    for cueIdx = 1:numel(data.cueInfo)
        if data.cueInfo(cueIdx).stimCode ~= -1 && ~isempty(data.cueInfo(cueIdx).rt) && data.cueInfo(cueIdx).bumpMag == 0
            meanRT(cueIdx) = mean(data.cueInfo(cueIdx).rt);
        end
    end
    meanRT = meanRT(~isnan(meanRT));
end