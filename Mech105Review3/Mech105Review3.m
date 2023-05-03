%%Calculates the volume of water in a specific tank. (Tank was specified in
%%problem to be a cylinder for the first 18 meters and then take on the
%%shape of a cone for the next 14 meters with a diameter of 46)

% Specify the height of the water
h = 20
%%height of cylinder
h_cylinder=19; %%height of cylinder
%Radius
r=12.5;
%%radius of the cone at varius heights
r_h=(r+((h-19)/tand(54.5)));
%%height of the entire cone
h_2=(r_h)*tand(54.5);
h_3=r*tand(54.5);
%%Checks for height of the shape and uses the correct formula based on the
%%height
if h <=19
   v= pi*r^2*h
elseif h < 0 || h >33
   error('Cannot compute volume bigger or smaller than container')
else
    v=pi*r^2*h_cylinder + pi*r_h^2*(h_2/3)-pi*r^2*((h_3)/3);
end
fprintf('Volume of Water; %.2f m^3',v);