fun digitsSum num =
	if num = 0
		then 0
	else
		digitsSum(num div 10) + num mod 10;

fun additivePersistence  num = 
	if 9>=num
		then 0
	else
		additivePersistence(digitsSum(num))+1;
fun digitalRoot num = 
	if 9>=num
		then num
	else
		digitalRoot(digitsSum num);
		
	









