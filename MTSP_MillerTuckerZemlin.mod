int n = 5;
range cities = 1..n;

float t[cities][cities] = ...;
float d[cities][cities] = ...;

dvar boolean x[cities][cities];
dvar int u[cities];
dvar int Q;

minimize sum(i in cities, j in cities: j != i)(t[i][j] * x[i][j]);

subject to{
	forall(j in cities){
		sum(i in cities: i != j)(x[i][j]) == 1;	
	}
	
	forall(i in cities){
		sum(j in cities: i != j)(x[i][j]) == 1;	
	}
	
	forall(i in cities, j in cities : i >= 2 && i != j && j <= n){
		u[i] - u[j] + n * x[i][j] <= (n - 1);	
	};
	Q == sum(i in cities, j in cities: i != j)(x[i][j]);
	forall(i in cities: i >= 2 && i <= n){
		u[i] >= 0;
		u[i] <= (n - 1);
	}
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
