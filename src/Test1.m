function varargout = Test1(varargin)
% TEST1 MATLAB code for Test1.fig
%      TEST1, by itself, creates a new TEST1 or raises the existing
%      singleton*.
%
%      H = TEST1 returns the handle to a new TEST1 or the handle to
%      the existing singleton*.
%
%      TEST1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST1.M with the given input arguments.
%
%      TEST1('Property','Value',...) creates a new TEST1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Test1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Test1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Test1

% Last Modified by GUIDE v2.5 05-Jun-2016 10:39:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Test1_OpeningFcn, ...
                   'gui_OutputFcn',  @Test1_OutputFcn, ...
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

end

% --- Executes just before Test1 is made visible.
function Test1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Test1 (see VARARGIN)

% Choose default command line output for Test1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Test1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Clear all variables
clear all;

% Debug tekniks
dbstop if error

%ChangeLog
imaqreset;
global colorVid; 
global depthVid; 
% global motion;
% global motiontemp;
global stop;
global skecor;
global skecorpixel;
global frame1;
global depthMetaData;
% global rested;
% global delay;
global executing;
global recordsample;
global Mode;
Mode = 'none';
stop = 0;

colorVid = videoinput('kinect',1);
depthVid = videoinput('kinect',2);
triggerconfig(depthVid,'manual');
triggerconfig(colorVid,'manual');
colorVid.FramesPerTrigger = 1;
colorVid.TriggerRepeat = inf;
depthVid.FramesPerTrigger = 1;
depthVid.TriggerRepeat = inf;
src = getselectedsource(colorVid);
set(getselectedsource(depthVid),'TrackingMode','Skeleton');  
Fs = 25;
global t; t = timer('TimerFcn',{@trig,gcf}, 'Period', 1/Fs,...
    'executionMode','fixedRate');

frameRates = set(src, 'FrameRate')



% % Form
% handles.Image = image(zeros(480,640,3),'Parent',handles.axes1);

end

% --- Outputs from this function are returned to the command line.
function varargout = Test1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

function trig(hobj,event,fignum)
tic
dbstop if error

% Variables 
global colorVid; 
global depthVid; 
global motion;
global skecor;
global skecorpixel;
global frame1;
global depthMetaData;
global motionrest;

% Trigger colorVid and depthVid of Kinect
handles = guidata(fignum);
trigger(depthVid);
trigger(colorVid);
frame1 = getdata(colorVid);
[frame2, ts2, depthMetaData] = getdata(depthVid);
% axes(handles.axes1);
% imshow(frame1); 


% Start Skeleton Tracking
idx = find(depthMetaData.IsSkeletonTracked);

if(idx ~= 0) % Skeleton detected
    % Getting skeleton joints coordinates
    skecor = depthMetaData.JointWorldCoordinates(:,:,idx);
    skecorpixel = depthMetaData.JointImageIndices(:,:,idx);
end


end

% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global colorVid; 
global depthVid;  
global stop;
global motion;
% global motiontemp;
% global executing;
% global rested;
% global delay;
global recordsample;
start([colorVid depthVid]);
% global skecor;
% global skecorpixel;
% global frame1;
global depthMetaData;
global motionrest;
global modechoice;
% global t;
% start(t);
timestamp = [];
delay = 0;
rested = zeros(1,8);
motion = [];
motiontemp = [];
executing = 0;
featurenum = 1;
name = 'Huy';
alreadygetdata = 0;

while (stop==0)
% tic
    tic
    trigger(colorVid);
    trigger(depthVid);
    frame1 = getdata(colorVid);
    [frame2, ts2, depthMetaData] = getdata(depthVid);
    timestamp = [timestamp,ts2];
    t = toc
    
    % Show image
    % time = 0.006
    imagesc(frame1, 'Parent', handles.axes1);   
    
    
    % Start Skeleton Tracking
    idx = find(depthMetaData.IsSkeletonTracked);

    if(length(idx)==1 ) % Skeleton detected
%         disp('TRACKING')
        
        % Get skeleton
        skecor = depthMetaData.JointWorldCoordinates(:,:,idx);
       % skecorpixel = depthMetaData.JointImageIndices(:,:,idx);
        
        
%         % Show skeleton
%         % t ~= 0.04
%         skeletonViewer(skecorpixel,frame1);
        

        % Features extraction
        % t ~= 3.e^-04
        if(featurenum==1)
            feature = FeatureExtract(skecor);
        else
            feature = FeatureExtract2(skecor);
        end

        
        % Save features within 10 frames
        % t ~= 5.e^-05
        if(size(motiontemp,1)<=20)
           motiontemp = [motiontemp; feature];
        else
           motiontemp(1,:) = [];
           motiontemp = [motiontemp; feature];
        end    

%         rvec = skecor(9,:) - skecor(5,:);
%         rvec = rvec/norm(rvec);
%         condition1 = abs(rvec(3))<0.05;  
%         if(condition1)
%             disp('Saving motion')
%             % Save motion within 300 frames
%             if(size(motion,1)<=300)
%                motion = [motion; feature];
%             else
%                motion(1,:) = [];
%                motion = [motion; feature];
%             end       
%         end
        
%         % Plot features
%         phi = motion(:,1:8);
%         theta = motion(:,9:16);
%         axes(handles.axes2);        
%         plot(phi(:,3));     
%         ylim([0,120]);
%         axes(handles.axes3);       
%         plot(phi(:,4));
%         ylim([0,120]);
        
        if(~strcmp(modechoice,'RestConfig'))
            % Check if is in rest state
            % If load file: 0.0025 - not load file: 0.0005
            if(checkRest(feature,name,featurenum))
               disp('REST - YES');
               rested = [rested(2:length(rested)),1];
            else
                disp('REST - N0');
                rested = [rested(2:length(rested)),0];
            end
         end
        
        % If recording samples
        % Always 0.0002
        if(recordsample)
            [executing,motion,delay] = recordSample(executing,rested,motion,motiontemp,feature,delay,name);
        end

        
        % Rest Configuration mode
        % When saving: 0.005
        if(strcmp(modechoice,'RestConfig'))     
            [motionrest,saved] = RestConfig(skecor,feature,motionrest,name);
            if(saved)
               modechoice = 'none'; 
               set(handles.text2,'String','Rest configuration saved.');
            end
        end
          
%     load('Samples\Huy\restconfig.mat');
%     plotFunc(motionrest);         
%         load('Samples\Huy\sample4  0.mat');
%         plotFunc(motion);
        
        
    else
%         disp('NOT TRACK');
    end
        
% timeused = toc;
% if(timeused<1/30)
%     pause(1/30-timeused);
% end

end

axes(handles.axes2);    
plot(timestamp,'x');
xlabel('Frame Index');
ylabel('Time(s)');
diffFrameTime = diff(timestamp);
axes(handles.axes3);    
plot(diffFrameTime, 'x');
xlabel('Frame Index');
ylabel('Time Difference(s)');
ylim([0 .2]);
avgTime = mean(diffFrameTime)
expRate = 1/avgTime


end


% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global motion;
global stop;
stop = 1;

motion
save('sample.mat','motion');

end


% --- Executes on button press in Record.
function Record_Callback(hObject, eventdata, handles)
% hObject    handle to Record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global recordsample;
    recordsample = 1;
    set(handles.text2,'String',{'Starting recording movement';'Please start from rest.'});


end

% --- Executes on button press in RestConfig.
function RestConfig_Callback(hObject, eventdata, handles)
% hObject    handle to RestConfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global modechoice;
global motionrest;
modechoice = 'RestConfig';
motionrest = [];
set(handles.text2,'String',{'Recordind rest config.';' Please stand still.'});
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
