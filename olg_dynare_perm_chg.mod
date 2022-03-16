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

parameters bet alp delK g_n g_new A;
	 bet 	= .60;	// Equiv to .99 in 1 year period
	 alp 	= .33;		// Capital Share Cobb Douglas
	 delK 	= 0.8040;	// Equiv to .017 in 1 year period
	 g_n	= 0.2;	// Equiv to 0.007 in 1 year period
	 g_new = 0.3;
	 A 		= 1;   		// TFP

% -- Defining the model
model;
	// Consumptions (1)
	c1 + s = w;

	// Capital Return (2)
	r 	= alp * A * (1/k)^(1-alp)-delK;	

	// Wage (3)
	w 	= (1-alp)*A*(k)^alp;

	// Euler Equation (4)
	c2(+1)/c1 = bet * (1+r(+1));

	// Production Function (5)
	y 	= A * k^alp;

	// Economy wide feasibility (6)
	c1 + c2/(1+g_new) = A * k^alp - k(+1)*(1+g_new) + (1-delK) * k;

	// Saving function (7)
	s 	= (bet * w)/(1+bet);

	// Aggregate Consumption
	C 	= c1 + c2/(1+g_new);
end;

% -- Initial Steady State --
k_ss = ((bet * (1-alp)*A)/((1+g_n)*(1+bet))) ^ (1/(1-alp));
r_ss = alp * A * (1/k_ss)^(1-alp)-delK; 
w_ss = (1-alp)*A*(k_ss)^alp;
s_ss = (bet * w_ss)/(1+bet);
y_ss = A * k_ss^alp;
c1_ss = w_ss - s_ss;	
c2_ss = s_ss * (1+r_ss);
C_ss =  c1_ss + c2_ss/(1+g_n);

initval;
		c1	= c1_ss;
		c2	= c2_ss;
		C 	= C_ss;	
		y 	= y_ss;	
		k 	= k_ss;	
		r 	= r_ss;	
		w 	= w_ss;	
		s	= s_ss;	
end;

% steady;

% -- Permant increase in the population growth rate  and new SS --
k_ss_2 = ((bet * (1-alp))/((1+g_new)*(1+bet))) ^ (1/(1-alp));
r_ss_2 = alp * A * (1/k_ss_2)^(1-alp)-delK; 
w_ss_2 = (1-alp)*A*(k_ss_2)^alp;
s_ss_2 = (bet * w_ss_2)/(1+bet);
y_ss_2 = A * k_ss_2^alp;
c1_ss_2 = w_ss_2 - s_ss_2;	
c2_ss_2 = s_ss_2 * (1+r_ss_2);
C_ss_2 =  c1_ss_2 + c2_ss_2/(1+g_new);

endval;
		c1	= c1_ss_2;
		c2	= c2_ss_2;
		C 	= C_ss_2;	
		y 	= y_ss_2;	
		k 	= k_ss_2;	
		r 	= r_ss_2;	
		w 	= w_ss_2;	
		s	= s_ss_2;	
end;

% steady;

check;
perfect_foresight_setup(periods=30);
perfect_foresight_solver;

