function [histEqual, histClustered] = get_hue_hists(im, k)
    B = rgb2hsv(im);
    [output, ~] = quantize_HSV(B, k);
    [a, center] = hist(output(:),k);
    %figure;
    %hist(output(:),k);
    %pause;
    histClustered = output(:);
    [counts, p] = hist(B(:),k);
    %figure;
    %hist(B(:),k);
    %pause;
    histEqual = B(:);
end
