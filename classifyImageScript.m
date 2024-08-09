function label = classifyImage(imagePath, modelPath)
    % load .mat 
    modelData = load(modelPath);
    net = modelData.net_B;  
    % read&preprocess input IMG
    img = imread(imagePath);
    img = imresize(img, [32 32]);
    img = double(img) / 255;

    % classify
    label = classify(net, img);
    disp(['Predicted Label: ', char(label)]);
end


classifyImage('sampleIMG.jpg', 'best_network.mat');
