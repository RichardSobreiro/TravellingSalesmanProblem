int n = 250;
range cities = 1..n;

float t[cities][cities] = ...;
float d[cities][cities] = ...;

dvar boolean x[cities][cities];
dvar int Q;

minimize sum(i in cities, j in cities: j != i)(d[i][j] * x[i][j]);

subject to{
	forall(i in cities, j in cities: i == j){
		x[i][j] == 0;
	}

	forall(j in cities){
		sum(i in cities: i != j)(x[i][j]) == 1;	
	}
	
	forall(i in cities){
		sum(j in cities: i != j)(x[i][j]) == 1;	
	}
	
	sum(i in cities, j in cities: i != j)(x[i][j]) <= Q - 1;
	
	Q <= n;
	Q >= 2;
	
	/*forall(i in cities, j in cities: i != j){
		x[i][j] >= 0;
		x[i][j] <= 1;
	}*/
}

execute{
	for(var i in cities){
		for(var j in cities){
			if(x[i][j] == 1){
				writeln("Cidade ",i," para a cidade ",j);					
			}
		}
	}
}
