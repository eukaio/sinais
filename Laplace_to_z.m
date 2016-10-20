function varargout = Laplace_to_z(varargin)
% LAPLACE_TO_Z MATLAB code for Laplace_to_z.fig
%      LAPLACE_TO_Z, by itself, creates a new LAPLACE_TO_Z or raises the existing
%      singleton*.
%
%      H = LAPLACE_TO_Z returns the handle to a new LAPLACE_TO_Z or the handle to
%      the existing singleton*.
%
%      LAPLACE_TO_Z('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAPLACE_TO_Z.M with the given input arguments.
%
%      LAPLACE_TO_Z('Property','Value',...) creates a new LAPLACE_TO_Z or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Laplace_to_z_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Laplace_to_z_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Laplace_to_z

% Last Modified by GUIDE v2.5 16-Oct-2016 13:04:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Laplace_to_z_OpeningFcn, ...
                   'gui_OutputFcn',  @Laplace_to_z_OutputFcn, ...
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


% --- Executes just before Laplace_to_z is made visible.
function Laplace_to_z_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Laplace_to_z (see VARARGIN)

% Choose default command line output for Laplace_to_z
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Laplace_to_z wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Laplace_to_z_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in degrau.
function degrau_Callback(hObject, eventdata, handles)
numerador = get(handles.num,'String');
a = strsplit(numerador,' ');
A = str2double(a);

denominador = get(handles.deno,'String');
b = strsplit(denominador,' ');
B = str2double(b);

h = tf(A, B)
[nume,denom] = tfdata(h);

syms s t z
H = poly2sym(cell2mat(nume),s)/poly2sym(cell2mat(denom),s);
h1=ilaplace(H);
Z = ztrans(h1)
pretty(Z)
set(handles.txt_resposta,'String',char(Z));


[A1,B1] = eqtflength(A,B);
[z,p,k] = tf2zp(A1,B1)
zplane(z,p)
text(real(z)+.1,imag(z),'Zero')
text(real(p)+.1,imag(p),'Polo')
xlabel('Eixo real');
ylabel('Eixo imaginário');


% m = abs(p)   % to find distance from origin of poles 
% disp('Zeros are at');
% disp(z);            
% disp('poles are at');
% disp(p);            
% disp('gain constant');
% disp(k);            
% disp('Radius of poles');
% disp(m);
% sos = zp2sos(z,p,k);
% disp('Second order sections');
% disp(real(sos)); 







function num_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double


% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function deno_Callback(hObject, eventdata, handles)
% hObject    handle to deno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deno as text
%        str2double(get(hObject,'String')) returns contents of deno as a double


% --- Executes during object creation, after setting all properties.
function deno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in visualizar.
function visualizar_Callback(hObject, eventdata, handles)
numerador = get(handles.num,'String');
a = strsplit(numerador,' ');
A = str2double(a);

denominador = get(handles.deno,'String');
b = strsplit(denominador,' ');
B = str2double(b);

H = tf(A, B)
stepplot(H)
ylabel('');


% --- Executes on button press in zero_polos.
function zero_polos_Callback(hObject, eventdata, handles)
% hObject    handle to zero_polos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
