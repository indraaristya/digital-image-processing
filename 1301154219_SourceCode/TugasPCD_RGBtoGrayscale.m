function varargout = TugasPCD_RGBtoGrayscale(varargin)
% TUGASPCD_RGBTOGRAYSCALE MATLAB code for TugasPCD_RGBtoGrayscale.fig
%      TUGASPCD_RGBTOGRAYSCALE, by itself, creates a new TUGASPCD_RGBTOGRAYSCALE or raises the existing
%      singleton*.
%
%      H = TUGASPCD_RGBTOGRAYSCALE returns the handle to a new TUGASPCD_RGBTOGRAYSCALE or the handle to
%      the existing singleton*.
%
%      TUGASPCD_RGBTOGRAYSCALE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGASPCD_RGBTOGRAYSCALE.M with the given input arguments.
%
%      TUGASPCD_RGBTOGRAYSCALE('Property','Value',...) creates a new TUGASPCD_RGBTOGRAYSCALE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TugasPCD_RGBtoGrayscale_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TugasPCD_RGBtoGrayscale_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TugasPCD_RGBtoGrayscale

% Last Modified by GUIDE v2.5 14-May-2018 15:12:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TugasPCD_RGBtoGrayscale_OpeningFcn, ...
                   'gui_OutputFcn',  @TugasPCD_RGBtoGrayscale_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TugasPCD_RGBtoGrayscale is made visible.
function TugasPCD_RGBtoGrayscale_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TugasPCD_RGBtoGrayscale (see VARARGIN)

% Choose default command line output for TugasPCD_RGBtoGrayscale
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TugasPCD_RGBtoGrayscale wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TugasPCD_RGBtoGrayscale_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

% this function is to browse image and show image

[filename pathname] = uigetfile({'*.jpg';'*.jpeg';'*.png';}, 'Pilih Gambar');
image = strcat(pathname, filename);
axes(handles.picFrame)
imshow(image)
set(handles.namaFile,'string',filename);
set(handles.almPath,'string',image);


function namaFile_Callback(hObject, eventdata, handles)
% hObject    handle to namaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of namaFile as text
%        str2double(get(hObject,'String')) returns contents of namaFile as a double


% --- Executes during object creation, after setting all properties.
function namaFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to namaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

% this function is to convert RGB matrix to Grayscale matrix 
% rumus = rata-rata (jumlah matrix RGB dibagi 3)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);
matrixR = matrixRGB(:,:,1);
matrixG = matrixRGB(:,:,2);
matrixB = matrixRGB(:,:,3);
% greyScale = rgb2gray(matrixRGB);
sumOfMatrix = matrixR + matrixG + matrixB;
k = 1/3;
greyScale = sumOfMatrix*k;
axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(greyScale);




function almPath_Callback(hObject, eventdata, handles)
% hObject    handle to almPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of almPath as text
%        str2double(get(hObject,'String')) returns contents of almPath as a double


% --- Executes during object creation, after setting all properties.
function almPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to almPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

% this function is to get RGB Histogram Values from the image
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);
R = matrixRGB(:,:,1);
G = matrixRGB(:,:,2);
B = matrixRGB(:,:,3);

[yRed, x] = imhist(R);
[yGreen, x] = imhist(G);
[yBlue, x] = imhist(B);
axes(handles.histogram);
plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');



function redKoef_Callback(hObject, eventdata, handles)
% hObject    handle to redKoef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redKoef as text
%        str2double(get(hObject,'String')) returns contents of redKoef as a double


% --- Executes during object creation, after setting all properties.
function redKoef_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redKoef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function greenKoef_Callback(hObject, eventdata, handles)
% hObject    handle to greenKoef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of greenKoef as text
%        str2double(get(hObject,'String')) returns contents of greenKoef as a double


% --- Executes during object creation, after setting all properties.
function greenKoef_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenKoef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blueKoef_Callback(hObject, eventdata, handles)
% hObject    handle to blueKoef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blueKoef as text
%        str2double(get(hObject,'String')) returns contents of blueKoef as a double


% --- Executes during object creation, after setting all properties.
function blueKoef_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blueKoef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)

% this function is to convert RGB to Grayscale image 
% rumus = menginputkan sendiri koefisien x, y dan z
gambar = get(handles.almPath,'String');

matrixRGB = imread(gambar);
matrixR = matrixRGB(:,:,1);
matrixG = matrixRGB(:,:,2);
matrixB = matrixRGB(:,:,3);

koefRS = get(handles.redKoef, 'String');
koefGS = get(handles.greenKoef, 'String');
koefBS = get(handles.blueKoef, 'String');

koefR = str2double(koefRS);
koefG = str2double(koefGS);
koefB = str2double(koefBS);

greyScale = ((koefR*matrixR) + (koefG*matrixG) + (koefB*matrixB));

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(greyScale);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% this function is to Zoom In

gambar = get(handles.almPath,'String');

zoomIn = imread(gambar);

rows = size(zoomIn,1);
cols = size(zoomIn,2);


% out(1:2:end,1:2:end,:) = zoomIn; 
% out(2:2:end,1:2:end,:) = zoomIn; 
% out(1:2:end,2:2:end,:) = zoomIn; 
% out(2:2:end,2:2:end,:) = zoomIn; 

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(zoomIn(rows/4:rows*0.75, cols/4:cols*0.75,:));


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% this function is to Zoom Out
gambar = get(handles.almPath,'String');
zoomOut = imread(gambar);
padded = padarray(zoomOut,[100 100],'both');

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(padded);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% this function is to Inverse Image

gambar = get(handles.almPath,'String');
inv = imread(gambar);

out = 255 - inv

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(out);


% --- Executes on button press in brightplus.
function brightplus_Callback(hObject, eventdata, handles)
% hObject    handle to brightplus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
bright = imread(gambar);
a = get(handles.bright, 'String');
aa = str2double(a);
bright_plus = bright + aa;

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(bright_plus);


% --- Executes on button press in brightkali.
function brightkali_Callback(hObject, eventdata, handles)
% hObject    handle to brightkali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

gambar = get(handles.almPath,'String');
bright_mpx = imread(gambar);
a = get(handles.bright, 'String');
aa = str2double(a);
mpxOut = bright_mpx .* aa

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(mpxOut);


% --- Executes on button press in bright_min.
function bright_min_Callback(hObject, eventdata, handles)
% hObject    handle to bright_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
bright_min = imread(gambar);
a = get(handles.bright, 'String');
aa = str2double(a);
minOut = bright_min - aa

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(minOut);


% --- Executes on button press in bright_div.
function bright_div_Callback(hObject, eventdata, handles)
% hObject    handle to bright_div (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
bright_div = imread(gambar);
a = get(handles.bright, 'String');
aa = str2double(a);
divOut = bright_div ./ aa

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(divOut);


% --- Executes on button press in horz_flip.
function horz_flip_Callback(hObject, eventdata, handles)
% hObject    handle to horz_flip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

gambar = get(handles.almPath,'String');
horz_flip = imread(gambar);

kolom = size(horz_flip,2); %cols
horz_flip_new = horz_flip
j = kolom
for i = 1:kolom
    horz_flip_new(:,i,:) = horz_flip(:,j,:);
    j=j-1;
end

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(horz_flip_new);


% --- Executes on button press in vert_flip.
function vert_flip_Callback(hObject, eventdata, handles)
% hObject    handle to vert_flip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

gambar = get(handles.almPath,'String');
ver_flip = imread(gambar);

baris = size(ver_flip,1); %rows
ver_flip_new = ver_flip;

j = baris;
for i = 1:baris
    ver_flip_new(i,:,:) = ver_flip(j,:,:);
    j=j-1;
end
        
axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(ver_flip_new);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
crop = imread(gambar);


rows = size(crop,1);
cols = size(crop,2);

% cropped = zeros(101,101)
% 
% k = 1
% l = 1
% for i = (rows/2)-50:(rows/2)+50
%     cropped(k,l) = crop(i,j)
%     k=k+1
% end

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(crop((rows/2)-80:(rows/2)+80,(cols/2)-80:(cols/2)+80))



function bright_Callback(hObject, eventdata, handles)
% hObject    handle to bright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bright as text
%        str2double(get(hObject,'String')) returns contents of bright as a double


% --- Executes during object creation, after setting all properties.
function bright_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);
R = matrixRGB(:,:,1);

x = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255]
y = x*0

for i=1:size(R,1)
    for j=1:size(R,2)
        k = R(i,j);
        y(k+1) = y(k+1) + 1;
%         for k=1:256
%             if (R(i,j) == x(k))
%                 y(k) = y(k) + 1;
%             end
%         end
    end
end

axes(handles.Rhistmanual);
% plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
bar(x,y);


% --- Executes on button press in pushbutton18.

function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);
G = matrixRGB(:,:,2);

x = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255]
y = x*0

for i=1:size(G,1)
    for j=1:size(G,2)
        k = G(i,j);
        y(k+1) = y(k+1) + 1;
%         for k=1:256
%             if (G(i,j) == x(k))
%                 y(k) = y(k) + 1;
%             end
%         end
    end
end

axes(handles.Ghistmanual);
% plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
bar(x,y);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

B = matrixRGB(:,:,3);

x = [0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255]
y = x*0

for i=1:size(B,1)
    for j=1:size(B,2)
        k = B(i,j);
        y(k+1) = y(k+1) + 1;
%         for k=1:256
%             if (B(i,j) == x(k))
%                 y(k) = y(k) + 1;
%             end
%         end
    end
end

axes(handles.Bhistmanual);
% plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');
bar(x,y);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
ver_flip = imread(gambar);

baris = size(ver_flip,1); %rows
ver_flip_new = ver_flip;

j = baris;
for i = 1:baris
    ver_flip_new(i,:,:) = ver_flip(j,:,:);
    j=j-1;
end

rttTrans = permute(ver_flip_new,[2,1,3]);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(rttTrans);


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
horz_flip = imread(gambar);

kolom = size(horz_flip,2); %cols
horz_flip_new = horz_flip
j = kolom
for i = 1:kolom
    horz_flip_new(:,i,:) = horz_flip(:,j,:);
    j=j-1;
end

rttTrans = permute(horz_flip_new,[2,1,3]);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(rttTrans);


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
ver_flip = imread(gambar);

baris = size(ver_flip,1); %rows
ver_flip_new = ver_flip;

j = baris;
for i = 1:baris
    ver_flip_new(i,:,:) = ver_flip(j,:,:);
    j=j-1;
end

% rttTrans = permute(horz_flip_new,[2,1,3]);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(ver_flip_new);

% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

gambar = get(handles.almPath,'String');
ver_flip = imread(gambar);

baris = size(ver_flip,1); %rows
ver_flip_new = ver_flip;

j = baris;
for i = 1:baris
    ver_flip_new(i,:,:) = ver_flip(j,:,:);
    j=j-1;
end

kolom = size(ver_flip_new,2); %cols
horz_flip_new = ver_flip_new
j = kolom
for i = 1:kolom
    horz_flip_new(:,i,:) = ver_flip_new(:,j,:);
    j=j-1;
end

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(horz_flip_new);


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

matrixBlur = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
% matrixBlur = [0 -1 0; -1 5 -1; 0 -1 0];
yR = matrixRGB(:,:,1)*0;
yG = matrixRGB(:,:,2)*0;
yB = matrixRGB(:,:,3)*0;
sumR = 0;
sumG = 0;
sumB = 0;

matrixR = padarray(matrixRGB(:,:,1),[1 1],0);
matrixG = padarray(matrixRGB(:,:,2),[1 1],0);
matrixB = padarray(matrixRGB(:,:,3),[1 1],0);

for i=1:size(yR,1)
    for j=1:size(yR,2)
        cuttedR = matrixR(i:i+2,j:j+2);
        cuttedG = matrixG(i:i+2,j:j+2);
        cuttedB = matrixB(i:i+2,j:j+2);
        mpxR = double(cuttedR).*matrixBlur;
        mpxG = double(cuttedG).*matrixBlur;
        mpxB = double(cuttedB).*matrixBlur;
        sumR = sum(mpxR(:));
        sumG = sum(mpxG(:));
        sumB = sum(mpxB(:));
           
        yR(i,j) = sumR;
        yG(i,j) = sumG;
        yB(i,j) = sumB;
        sumR = 0;
        sumG = 0;
        sumB = 0;
    end
end
% y = conv2(matrixRGB,matrixBlur,'same');
y = cat(3,yR,yG,yB);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(y);


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

matrixSharp = [0 -1 0; -1 5 -1; 0 -1 0];
yR = matrixRGB(:,:,1)*0;
yG = matrixRGB(:,:,2)*0;
yB = matrixRGB(:,:,3)*0;
sumR = 0;
sumG = 0;
sumB = 0;

matrixR = padarray(matrixRGB(:,:,1),[1 1],0);
matrixG = padarray(matrixRGB(:,:,2),[1 1],0);
matrixB = padarray(matrixRGB(:,:,3),[1 1],0);

for i=1:size(yR,1)
    for j=1:size(yR,2)
        cuttedR = matrixR(i:i+2,j:j+2);
        cuttedG = matrixG(i:i+2,j:j+2);
        cuttedB = matrixB(i:i+2,j:j+2);
        mpxR = double(cuttedR).*matrixSharp;
        mpxG = double(cuttedG).*matrixSharp;
        mpxB = double(cuttedB).*matrixSharp;
        sumR = sum(mpxR(:));
        sumG = sum(mpxG(:));
        sumB = sum(mpxB(:));
           
        yR(i,j) = sumR;
        yG(i,j) = sumG;
        yB(i,j) = sumB;
        sumR = 0;
        sumG = 0;
        sumB = 0;
    end
end
% y = conv2(matrixRGB,matrixBlur,'same');
y = cat(3,yR,yG,yB);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(y);


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

% matrixED = [-1 -1 -1; -1 8 -1; -1 -1 -1];
matrixED = [1 1 1; 1 -8 1; 1 1 1];

yR = matrixRGB(:,:,1)*0;
yG = matrixRGB(:,:,2)*0;
yB = matrixRGB(:,:,3)*0;
sumR = 0;
sumG = 0;
sumB = 0;

matrixR = padarray(matrixRGB(:,:,1),[1 1],0);
matrixG = padarray(matrixRGB(:,:,2),[1 1],0);
matrixB = padarray(matrixRGB(:,:,3),[1 1],0);

for i=1:size(yR,1)
    for j=1:size(yR,2)
        cuttedR = matrixR(i:i+2,j:j+2);
        cuttedG = matrixG(i:i+2,j:j+2);
        cuttedB = matrixB(i:i+2,j:j+2);
        mpxR = double(cuttedR).*matrixED;
        mpxG = double(cuttedG).*matrixED;
        mpxB = double(cuttedB).*matrixED;
        sumR = sum(mpxR(:));
        sumG = sum(mpxG(:));
        sumB = sum(mpxB(:));
           
        yR(i,j) = sumR;
        yG(i,j) = sumG;
        yB(i,j) = sumB;
        sumR = 0;
        sumG = 0;
        sumB = 0;
    end
end
% y = conv2(matrixRGB,matrixBlur,'same');
y = cat(3,yR,yG,yB);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(y);


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

yR = matrixRGB(:,:,1)*0;
yG = matrixRGB(:,:,2)*0;
yB = matrixRGB(:,:,3)*0;

matrixR = padarray(matrixRGB(:,:,1),[1 1],0,'post');
matrixG = padarray(matrixRGB(:,:,2),[1 1],0,'post');
matrixB = padarray(matrixRGB(:,:,3),[1 1],0,'post');

for i=1:size(yR,1)
    for j=1:size(yR,2)
        cuttedR = matrixR(i:i+1,j:j+1);
        cuttedG = matrixG(i:i+1,j:j+1);
        cuttedB = matrixB(i:i+1,j:j+1);
        
        red = sort(cuttedR(:));
        green = sort(cuttedG(:));
        blue = sort(cuttedB(:));
        
        yR(i,j) = (red(2)+red(3))/2; %mencari median dari matrix
        yG(i,j) = (green(2)+green(3))/2;
        yB(i,j) = (blue(2)+blue(3))/2;
    end
end

y = cat(3,yR,yG,yB);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(y);


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

yR = matrixRGB(:,:,1)*0;
yG = matrixRGB(:,:,2)*0;
yB = matrixRGB(:,:,3)*0;

matrixR = padarray(matrixRGB(:,:,1),[1 1],0,'post');
matrixG = padarray(matrixRGB(:,:,2),[1 1],0,'post');
matrixB = padarray(matrixRGB(:,:,3),[1 1],0,'post');

for i=1:size(yR,1)
    for j=1:size(yR,2)
        cuttedR = matrixR(i:i+1,j:j+1);
        cuttedG = matrixG(i:i+1,j:j+1);
        cuttedB = matrixB(i:i+1,j:j+1);
        
        yR(i,j) = sum(cuttedR(:))/4; %mencari mean dari matrix
        yG(i,j) = sum(cuttedG(:))/4;
        yB(i,j) = sum(cuttedB(:))/4;
    end
end

y = cat(3,yR,yG,yB);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(y);


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

yR = matrixRGB(:,:,1)*0;
yG = matrixRGB(:,:,2)*0;
yB = matrixRGB(:,:,3)*0;

matrixR = padarray(matrixRGB(:,:,1),[1 1],0,'post');
matrixG = padarray(matrixRGB(:,:,2),[1 1],0,'post');
matrixB = padarray(matrixRGB(:,:,3),[1 1],0,'post');

for i=1:size(yR,1)
    for j=1:size(yR,2)
        cuttedR = matrixR(i:i+1,j:j+1);
        cuttedG = matrixG(i:i+1,j:j+1);
        cuttedB = matrixB(i:i+1,j:j+1);
        
        yR(i,j) = mode(cuttedR(:)); %mencari modus dari matrix
        yG(i,j) = mode(cuttedG(:));
        yB(i,j) = mode(cuttedB(:));
    end
end

y = cat(3,yR,yG,yB);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(y);


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

matrixR = matrixRGB(:,:,1);
matrixG = matrixRGB(:,:,2);
matrixB = matrixRGB(:,:,3);

matrixBaruR = matrixRGB(:,:,1)*0;
matrixBaruG = matrixRGB(:,:,1)*0;
matrixBaruB = matrixRGB(:,:,1)*0;

x = size(matrixRGB(:,:,1));
y = x(1) - 5
b = x(2) - 5

% matrixRGB = matrixRGB(:,:,1)
rK = randi([0 y],1);
rB = randi([0 b],1);

matrixRGB(rB,rK);

selesai = 0;
matrixBaruR(rB,rK) = matrixR(rB,rK);
matrixBaruG(rB,rK) = matrixG(rB,rK);
matrixBaruB(rB,rK) = matrixB(rB,rK);

while (selesai == 0) & (rB < x(2)) & (rK < x(1))
%     tK = rK + 1
%     tB = rB + 1
     for i=rB:size(matrixRGB,1)
         for j=rK:size(matrixRGB,2)
            if (matrixR(rB,rK) - 50 < matrixR(i,j) < matrixR(rB,rK) + 50)
                matrixBaruR(i,j) = matrixR(rB,rK);
                matrixBaruG(i,j) = matrixG(rB,rK);
                matrixBaruB(i,j) = matrixB(rB,rK);
                rB = rB + 1 
                rK = rK + 1
            else
                selesai = 1
            end
         end
     end

end
% selesai = 0
% while (selesai == 0) & (r < x)
%     t = r - 1
%     if (matrixR(r) - 80 < matrixR(t) < matrixR(r) + 80)
%         matrixBaruR(r) = matrixR(r);
%         matrixBaruG(r) = matrixG(r);
%         matrixBaruB(r) = matrixB(r);
%         r = r - 1  
%     else
%         selesai = 1
%     end
% 
% end
matrixBaru = cat(3,matrixBaruR,matrixBaruG,matrixBaruB);

axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(matrixBaru);


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
matrixRGB = imread(gambar);

matrixR = matrixRGB(:,:,1);
matrixG = matrixRGB(:,:,2);
matrixB = matrixRGB(:,:,3);

matrixBaruR = matrixRGB(:,:,1)*0;
matrixBaruG = matrixRGB(:,:,1)*0;
matrixBaruB = matrixRGB(:,:,1)*0;

atasred = str2double(get(handles.atasred, 'String'));
atasgreen = str2double(get(handles.atasgreen, 'String'));
atasblue = str2double(get(handles.atasblue, 'String'));

bawahred = str2double(get(handles.bawahred, 'String'));
bawahgreen = str2double(get(handles.bawahgreen, 'String'));
bawahblue = str2double(get(handles.bawahblue, 'String'));

for i=1:size(matrixR,1)
    for j=1:size(matrixR,2)
        if ((bawahred < matrixR(i,j) & matrixR(i,j) < atasred) & (bawahgreen < matrixG(i,j) & matrixG(i,j) < atasgreen) & (bawahblue < matrixB(i,j) & matrixB(i,j) < atasblue))
            disp(matrixR(i,j))
            disp(matrixG(i,j))
            disp(matrixB(i,j))
            matrixBaruR(i,j) = matrixR(i,j);
            matrixBaruG(i,j) = matrixG(i,j);
            matrixBaruB(i,j) = matrixB(i,j);
        end
    end
end

matrixBaru = cat(3,matrixBaruR,matrixBaruG,matrixBaruB);
axes(handles.axes3);
imshow(gambar);
axes(handles.picFrame);
imshow(matrixBaru);


function atasred_Callback(hObject, eventdata, handles)
% hObject    handle to atasred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of atasred as text
%        str2double(get(hObject,'String')) returns contents of atasred as a double


% --- Executes during object creation, after setting all properties.
function atasred_CreateFcn(hObject, eventdata, handles)
% hObject    handle to atasred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function atasgreen_Callback(hObject, eventdata, handles)
% hObject    handle to atasgreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of atasgreen as text
%        str2double(get(hObject,'String')) returns contents of atasgreen as a double


% --- Executes during object creation, after setting all properties.
function atasgreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to atasgreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function atasblue_Callback(hObject, eventdata, handles)
% hObject    handle to atasblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of atasblue as text
%        str2double(get(hObject,'String')) returns contents of atasblue as a double


% --- Executes during object creation, after setting all properties.
function atasblue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to atasblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bawahred_Callback(hObject, eventdata, handles)
% hObject    handle to bawahred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bawahred as text
%        str2double(get(hObject,'String')) returns contents of bawahred as a double


% --- Executes during object creation, after setting all properties.
function bawahred_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bawahred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bawahgreen_Callback(hObject, eventdata, handles)
% hObject    handle to bawahgreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bawahgreen as text
%        str2double(get(hObject,'String')) returns contents of bawahgreen as a double


% --- Executes during object creation, after setting all properties.
function bawahgreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bawahgreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bawahblue_Callback(hObject, eventdata, handles)
% hObject    handle to bawahblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bawahblue as text
%        str2double(get(hObject,'String')) returns contents of bawahblue as a double


% --- Executes during object creation, after setting all properties.
function bawahblue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bawahblue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
im = imread(gambar);

bw = im2bw(im,0.5);

matrixDilatasi = [1 1];

baru = bw*0;

matrixBW = padarray(bw,[1 1],0);

for i=1:size(bw,1)
    for j=1:size(bw,2)
        cut = matrixBW(i:i,j:j+1);
        if cut(1,1) == 1
            if (cut(1,1) == matrixDilatasi(1,1) || cut(1,2) == matrixDilatasi(1,2));
                baru(i,j+1) = 1;
            end
        end
    end
end
axes(handles.axes3);
imshow(bw);
axes(handles.picFrame);
imshow(baru);



% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
im = imread(gambar);

bw = im2bw(im,0.5);

matrixErosi = [1 1];

baru = bw*0;

matrixBW = padarray(bw,[1 1],0);

for i=1:size(bw,1)
    for j=1:size(bw,2)
        cut = matrixBW(i:i,j:j+1);
        if cut(1,1) == 1
            if (cut(1,1) == matrixErosi(1,1) && cut(1,2) == matrixErosi(1,2));
                baru(i,j+1) = 1;
            end
        end
    end
end
axes(handles.axes3);
imshow(bw);
axes(handles.picFrame);
imshow(baru);


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = get(handles.almPath,'String');
im = imread(gambar);
matrixR = im(:,:,1)
matrixG = im(:,:,2);
matrixB = im(:,:,3);

newMatrixR = matrixR * 0;
newMatrixG = matrixG * 0;
newMatrixB = matrixB * 0;


for i=1:size(matrixR,1)
    for j=1:size(matrixR,2)
        switch true
            case (0 <= matrixR(i,j)) && (matrixR(i,j) <= 10)
                newMatrixR(i,j) = 1;
            case (11 <= matrixR(i,j)) && (matrixR(i,j) <= 20)
                newMatrixR(i,j) = 2;
            case (21 <= matrixR(i,j)) && (matrixR(i,j) <= 30)
                newMatrixR(i,j) = 3;
            case (31 <= matrixR(i,j)) && (matrixR(i,j) <= 40)
                newMatrixR(i,j) = 4;
            case (41 <= matrixR(i,j)) && (matrixR(i,j) <= 50)
                newMatrixR(i,j) = 5;
            case (51 <= matrixR(i,j)) && (matrixR(i,j) <= 60)
                newMatrixR(i,j) = 6;
            case (61 <= matrixR(i,j)) && (matrixR(i,j) <= 70)
                newMatrixR(i,j) = 7;
            case (71 <= matrixR(i,j)) && (matrixR(i,j) <= 80)
                newMatrixR(i,j) = 8;
            case (81 <= matrixR(i,j)) && (matrixR(i,j) <= 90)
                newMatrixR(i,j) = 9;
            case (91 <= matrixR(i,j)) && (matrixR(i,j) <= 100)
                newMatrixR(i,j) = 10;
            case (101 <= matrixR(i,j)) && (matrixR(i,j) <= 110)
                newMatrixR(i,j) = 11;
            case (111 <= matrixR(i,j)) && (matrixR(i,j) <= 120)
                newMatrixR(i,j) = 12;
            case (121 <= matrixR(i,j)) && (matrixR(i,j) <= 130)
                newMatrixR(i,j) = 13;
            case (131 <= matrixR(i,j)) && (matrixR(i,j) <= 140)
                newMatrixR(i,j) = 14;
            case (141 <= matrixR(i,j)) && (matrixR(i,j) <= 150)
                newMatrixR(i,j) = 15;
            case (151 <= matrixR(i,j)) && (matrixR(i,j) <= 160)
                newMatrixR(i,j) = 16;
            case (161 <= matrixR(i,j)) && (matrixR(i,j) <= 170)
                newMatrixR(i,j) = 17;
            case (171 <= matrixR(i,j)) && (matrixR(i,j) <= 180)
                newMatrixR(i,j) = 18;
            case (181 <= matrixR(i,j)) && (matrixR(i,j) <= 190)
                newMatrixR(i,j) = 19;
            case (191 <= matrixR(i,j)) && (matrixR(i,j) <= 200)
                newMatrixR(i,j) = 20;
            case (201 <= matrixR(i,j)) && (matrixR(i,j) <= 210)
                newMatrixR(i,j) = 21;
            case (211 <= matrixR(i,j)) && (matrixR(i,j) <= 220)
                newMatrixR(i,j) = 22;
            case (221 <= matrixR(i,j)) && (matrixR(i,j) <= 230)
                newMatrixR(i,j) = 23;
            case (231 <= matrixR(i,j)) && (matrixR(i,j) <= 240)
                newMatrixR(i,j) = 24;
            case (241 <= matrixR(i,j)) && (matrixR(i,j) <= 250)
                newMatrixR(i,j) = 25;
            case (251 <= matrixR(i,j)) && (matrixR(i,j) <= 260)
                newMatrixR(i,j) = 26;
        end
        
        switch true
            case (0 <= matrixG(i,j)) && (matrixG(i,j) <= 10)
                newMatrixG(i,j) = 1;
            case (11 <= matrixG(i,j)) && (matrixG(i,j) <= 20)
                newMatrixG(i,j) = 2;
            case (21 <= matrixG(i,j)) && (matrixG(i,j) <= 30)
                newMatrixG(i,j) = 3;
            case (31 <= matrixG(i,j)) && (matrixG(i,j) <= 40)
                newMatrixG(i,j) = 4;
            case (41 <= matrixG(i,j)) && (matrixG(i,j) <= 50)
                newMatrixG(i,j) = 5;
            case (51 <= matrixG(i,j)) && (matrixG(i,j) <= 60)
                newMatrixG(i,j) = 6;
            case (61 <= matrixG(i,j)) && (matrixG(i,j) <= 70)
                newMatrixG(i,j) = 7;
            case (71 <= matrixG(i,j)) && (matrixG(i,j) <= 80)
                newMatrixG(i,j) = 8;
            case (81 <= matrixG(i,j)) && (matrixG(i,j) <= 90)
                newMatrixG(i,j) = 9;
            case (91 <= matrixG(i,j)) && (matrixG(i,j) <= 100)
                newMatrixG(i,j) = 10;
            case (101 <= matrixG(i,j)) && (matrixG(i,j) <= 110)
                newMatrixG(i,j) = 11;
            case (111 <= matrixG(i,j)) && (matrixG(i,j) <= 120)
                newMatrixG(i,j) = 12;
            case (121 <= matrixG(i,j)) && (matrixG(i,j) <= 130)
                newMatrixG(i,j) = 13;
            case (131 <= matrixG(i,j)) && (matrixG(i,j) <= 140)
                newMatrixG(i,j) = 14;
            case (141 <= matrixG(i,j)) && (matrixG(i,j) <= 150)
                newMatrixG(i,j) = 15;
            case (151 <= matrixG(i,j)) && (matrixG(i,j) <= 160)
                newMatrixG(i,j) = 16;
            case (161 <= matrixG(i,j)) && (matrixG(i,j) <= 170)
                newMatrixG(i,j) = 17;
            case (171 <= matrixG(i,j)) && (matrixG(i,j) <= 180)
                newMatrixG(i,j) = 18;
            case (181 <= matrixG(i,j)) && (matrixG(i,j) <= 190)
                newMatrixG(i,j) = 19;
            case (191 <= matrixG(i,j)) && (matrixG(i,j) <= 200)
                newMatrixG(i,j) = 20;
            case (201 <= matrixG(i,j)) && (matrixG(i,j) <= 210)
                newMatrixG(i,j) = 21;
            case (211 <= matrixG(i,j)) && (matrixG(i,j) <= 220)
                newMatrixG(i,j) = 22;
            case (221 <= matrixG(i,j)) && (matrixG(i,j) <= 230)
                newMatrixG(i,j) = 23;
            case (231 <= matrixG(i,j)) && (matrixG(i,j) <= 240)
                newMatrixG(i,j) = 24;
            case (241 <= matrixG(i,j)) && (matrixG(i,j) <= 250)
                newMatrixG(i,j) = 25;
            case (251 <= matrixG(i,j)) && (matrixG(i,j) <= 260)
                newMatrixG(i,j) = 26;
        end
        
        switch true
            case (0 <= matrixB(i,j)) && (matrixB(i,j) <= 10)
                newMatrixB(i,j) = 1;
            case (11 <= matrixB(i,j)) && (matrixB(i,j) <= 20)
                newMatrixB(i,j) = 2;
            case (21 <= matrixB(i,j)) && (matrixB(i,j) <= 30)
                newMatrixB(i,j) = 3;
            case (31 <= matrixB(i,j)) && (matrixB(i,j) <= 40)
                newMatrixB(i,j) = 4;
            case (41 <= matrixB(i,j)) && (matrixB(i,j) <= 50)
                newMatrixB(i,j) = 5;
            case (51 <= matrixB(i,j)) && (matrixB(i,j) <= 60)
                newMatrixB(i,j) = 6;
            case (61 <= matrixB(i,j)) && (matrixB(i,j) <= 70)
                newMatrixB(i,j) = 7;
            case (71 <= matrixB(i,j)) && (matrixB(i,j) <= 80)
                newMatrixB(i,j) = 8;
            case (81 <= matrixB(i,j)) && (matrixB(i,j) <= 90)
                newMatrixB(i,j) = 9;
            case (91 <= matrixB(i,j)) && (matrixB(i,j) <= 100)
                newMatrixB(i,j) = 10;
            case (101 <= matrixB(i,j)) && (matrixB(i,j) <= 110)
                newMatrixB(i,j) = 11;
            case (111 <= matrixB(i,j)) && (matrixB(i,j) <= 120)
                newMatrixB(i,j) = 12;
            case (121 <= matrixB(i,j)) && (matrixB(i,j) <= 130)
                newMatrixB(i,j) = 13;
            case (131 <= matrixB(i,j)) && (matrixB(i,j) <= 140)
                newMatrixB(i,j) = 14;
            case (141 <= matrixB(i,j)) && (matrixB(i,j) <= 150)
                newMatrixB(i,j) = 15;
            case (151 <= matrixB(i,j)) && (matrixB(i,j) <= 160)
                newMatrixB(i,j) = 16;
            case (161 <= matrixB(i,j)) && (matrixB(i,j) <= 170)
                newMatrixB(i,j) = 17;
            case (171 <= matrixB(i,j)) && (matrixB(i,j) <= 180)
                newMatrixB(i,j) = 18;
            case (181 <= matrixB(i,j)) && (matrixB(i,j) <= 190)
                newMatrixB(i,j) = 19;
            case (191 <= matrixB(i,j)) && (matrixB(i,j) <= 200)
                newMatrixB(i,j) = 20;
            case (201 <= matrixB(i,j)) && (matrixB(i,j) <= 210)
                newMatrixB(i,j) = 21;
            case (211 <= matrixB(i,j)) && (matrixB(i,j) <= 220)
                newMatrixB(i,j) = 22;
            case (221 <= matrixB(i,j)) && (matrixB(i,j) <= 230)
                newMatrixB(i,j) = 23;
            case (231 <= matrixB(i,j)) && (matrixB(i,j) <= 240)
                newMatrixB(i,j) = 24;
            case (241 <= matrixB(i,j)) && (matrixB(i,j) <= 250)
                newMatrixB(i,j) = 25;
            case (251 <= matrixB(i,j)) && (matrixB(i,j) <= 260)
                newMatrixB(i,j) = 26;
        end
    end
    
end

file = get(handles.almPath,'String');
[filepath,name,ext] = fileparts(file)
filepath = strcat(filepath,'/');
fileName = strcat(name,'_compressed');
filePath = strcat(filepath,fileName)
filePath = strcat(filePath,ext)
matrixBaru = cat(3,newMatrixR,newMatrixG,newMatrixB);
matrixBaru = matrixBaru * 10;
imwrite(matrixBaru,filePath);

axes(handles.axes3);
imshow(im);
axes(handles.picFrame);
imshow(matrixBaru);
