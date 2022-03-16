var
	c1		// Consumption of the young	(1)
	c2		// Consumption of the old	(2)
	C 		// Aggregate consumption 	(3)
	y 		// Output					(4)
	k 		// Capital - labor			(5)
	r 		// interest					(6)
	w 		// Wage						(7)
	s		// Saving   				(8)
;
predetermined_variables k;
varexo	A;		% Technology level

parameters bet alp delK AA n ;
	 bet 	= .60;	// Equiv to .99 in 1 year period
	 alp 	= .33;		// Capital Share Cobb Douglas
	 delK 	= 0.8040;	// Equiv to .017 in 1 year period
	 AA		= 1;   		// Initial TFP
	 n 	 	= 0.2;

% -- Defining the model
model;
	// Consumptions (1)
	c1 + s = w;

	// Capital Return (2)
	r 	= alp * A* (1/k)^(1-alp)-delK;	

	// Wage (3)
	w 	= (1-alp)*A*(k)^alp;

	// Euler Equation (4)
	c2(+1)/c1 = bet * (1+r(+1));

	// Production Function (5)
	y 	= A * k^alp;

	// Economy wide feasibility (6)
	c1 + c2/(1+n) = A * k^alp - k(+1)*(1+n) + (1-delK) * k;

	// Saving function (7)
	s 	= (bet * w)/(1+bet);

	// Aggregate Consumption
	C 	= c1 + c2/(1+n);
end;

% -- Values of population growth --
shocks;
	var A;
	periods 1;
	values 1.5;
end;

% -- Initial Steady State --
k_ss = ((bet * (1-alp)*A)/(1+n*(1+bet))) ^ (1/(1-alp));
r_ss = alp * A * (1/k_ss)^(1-alp)-delK; 
w_ss = (1-alp)*A*(k_ss)^alp;
s_ss = (bet * w_ss)/(1+bet);
y_ss = A * k_ss^alp;
c1_ss = w_ss - s_ss;	
c2_ss = s_ss * (1+r_ss);
C_ss =  c1_ss + c2_ss/(1+n);

initval;
		A = AA;
%		c1	= c1_ss;
%		c2	= c2_ss;
%		C 	= C_ss;	
%		y 	= y_ss;	
%		k 	= k_ss;	
%		r 	= r_ss;	
%		w 	= w_ss;	
%		s	= s_ss;	
		k = ((bet * (1-alp)*A)/((1+n)*(1+bet))) ^ (1/(1-alp));
		r = alp * A * (1/k)^(1-alp)-delK; 
		w = (1-alp)*A*(k)^alp;
		s = (bet * w)/(1+bet);
		y = A * k^alp;
		c1 = w - s;	
		c2 = s * (1+r);
		C =  c1 + c2/(1+n);

end;

steady;
check;

perfect_foresight_setup(periods=30);
perfect_foresight_solver;



