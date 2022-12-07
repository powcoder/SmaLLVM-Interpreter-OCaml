https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
open Domain

exception Unsupported

let eval e mem =
  let kind = Llvm.classify_value e in
  match kind with
  | Llvm.ValueKind.ConstantInt -> (* constant *) failwith "Not implemented"
  | Llvm.ValueKind.Instruction _ -> (* variable *) failwith "Not implemented"
  | _ -> raise Unsupported

let rec execute_block prev blk memory =
  let instr = Llvm.instr_begin blk in
  execute_instr prev instr memory

and execute_instr prev instr memory =
  match instr with
  | Llvm.At_end _ -> memory
  | Llvm.Before instr -> transfer prev instr memory

and transfer prev instr memory =
  let curr_blk = Llvm.instr_parent instr in
  match Llvm.instr_opcode instr with
  | Llvm.Opcode.Ret -> memory
  | Llvm.Opcode.Call when Llvmutils.is_input instr -> failwith "Not implemented"
  | Llvm.Opcode.Call when Llvmutils.is_print instr -> failwith "Not implemented"
  | Llvm.Opcode.PHI ->
      let incoming_blk, incoming_mem = Option.get prev in
      let incoming_exp =
        Llvm.incoming instr
        |> List.find (fun (_, blk) -> blk = incoming_blk)
        |> fst
      in
      (* copy the value of the incoming variable from the incoming memory to the destination variable *)
      failwith "Not implemented"
  | Llvm.Opcode.Add -> failwith "Not implemented"
  | Llvm.Opcode.Sub -> failwith "Not implemented"
  | Llvm.Opcode.Mul -> failwith "Not implemented"
  | Llvm.Opcode.UDiv | Llvm.Opcode.SDiv -> failwith "Not implemented"
  | Llvm.Opcode.Br -> (
      match Llvm.get_branch instr with
      | Some (`Conditional (cond, b1, b2)) ->
          (* conditional branch *)
          failwith "Not implemented"
      | Some (`Unconditional b) ->
          (* unconditional jump *)
          failwith "Not implemented"
      | _ -> raise Unsupported)
  | Llvm.Opcode.ICmp -> failwith "Not implemented"
  | _ -> raise Unsupported
