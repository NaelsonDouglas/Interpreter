#Manoela Cassia
#Naelson Douglas
memoria = Any[1,2,"HALT",2,3,"DEC",3,4,"ADD","HALT",2,4,"MUL",3,17,"SUB",4,5,"(*$&$","10",19]

function  interpretar(memoria::Any=memoria, endereco_inicial::Int=1)
	if (length(memoria[endereco_inicial:length(memoria)]) < 3)	
		info("Input Error\n")
		return false	
	end
	reg_a = memoria[endereco_inicial]
	reg_b =	memoria[endereco_inicial+1]
	tipo_inst = memoria[endereco_inicial+2]
	execucao = executar(reg_a,reg_b,tipo_inst)
	if (execucao == false)
		return false
	end
	print(execucao)
	print("\n")
	return true
end

function check_halt(reg_a,reg_b,tipo_inst)
	if (reg_a == "HALT")
		return true
	end
	if (reg_b == "HALT")
		return true
	end
	if (tipo_inst == "HALT")
		return true
	end
	return false
end 


function interpretar_lista(memoria=memoria::Any, endereco_inicial=1::Int)
	loop_bit = true
	PC = endereco_inicial

	while (loop_bit)
		loop_bit = interpretar(memoria, PC)
		PC = PC+3
	end	
end

function executar(reg_a, reg_b, tipo_inst)
	if (check_halt(reg_a,reg_b,tipo_inst))
		info("Halted\n")		
		return false
	end

	if (tipo_inst == "MUL")
		return (reg_a*reg_b)
	end
	if (tipo_inst == "ADD")
		return (reg_a+reg_b)
	end
	if (tipo_inst == "DEC")
		return (reg_a-reg_b)
	end
	if (tipo_inst == "DIV")
		return (reg_a/reg_b)
	end

	info("input error\n")
	return true
end
