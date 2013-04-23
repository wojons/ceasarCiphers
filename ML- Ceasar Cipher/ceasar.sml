fun ceasar (stringL:string, shift:int, choice:int) = 
	let 
		fun test(letter, shift) =
		if ((ord(letter) + shift >= 64  andalso ord(letter) + shift <= 90))
		then true
		else false;
		val convert = String.explode(stringL);
		
		fun upper(nil) =nil
			|upper(covert as x::xs) =
			if ord(x) >= 64 andalso ord(x) <= 90 then
			chr(ord(x)) :: upper(xs)
			else
			chr(ord(x) - 32) :: upper(xs);
		
		val input = upper(convert);
		
		
		fun encrpt(nil, shift) = nil
		|encrpt(input as x::xs, shift) =
		if (test(x,shift) = true) then 
		chr(ord(x) + shift) :: encrpt(xs, shift)
		else 
		chr((ord(x) + shift)-26) :: encrpt(xs, shift);
		
		fun dencrpt(nil, shift) = nil
		|dencrpt(input as x::xs, shift) =
		if (test(x,shift) = true) then 
		chr((ord(x) - shift)) :: dencrpt(xs, shift)
		else 
		chr(ord(x)+25) :: dencrpt(xs, shift);
		
		fun allprint(input, x:int) =
		"Caesar " ^ Int.toString(x) ^": " ^ String.implode(encrpt(input,x)) ^ "\n";
		
		
		fun looper (input, x:int) =
		if (x = 0) then
			allprint(input,x)
		else 
			allprint(input, x) ^ looper(input,x-1); 
	in
	if (choice =1) then 
	print(String.implode(encrpt(input, shift)) ^ "\n")
	else if (choice = 2) then print(String.implode(dencrpt(input, shift)) ^ "\n")
	else if (choice = 3) then print ((looper(input, 26)) ^ "\n")
	else print("bluh")
end;
(*fun ceasolver (stringU:string, shiftU: int) = 

end;*)