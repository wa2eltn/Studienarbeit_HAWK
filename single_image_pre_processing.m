function [rgb_out,diff_out] = single_image_pre_processing(rgb)

hsv = rgb2hsv(rgb);

BW = (hsv(:,:,1) >= 00 ) & (hsv(:,:,1) <= 0.215) & ...
    (hsv(:,:,2) >= 0.3 ) & (hsv(:,:,2) <= 1);

% figure;imshow(BW);

BW = bwareaopen(BW, 200);
BW=imfill(BW,'holes');

% figure;imshow(BW);

rgb_out = rgb;
rgb_out(repmat(~BW,[1 1 3])) = 0;

r=rgb(:,:,1);
g=rgb(:,:,2);

diff_out(:,:,1)=abs(r-g);
diff_out(:,:,2)=abs(r-g);
diff_out(:,:,3)=abs(r-g);

end



 