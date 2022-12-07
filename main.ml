https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
let main argv =
  if Array.length argv <> 2 then (
    prerr_endline "interpreter: You must specify one LLVM IR file";
    prerr_endline "Usage: interpreter [LLVM IR file]";
    exit 1);
  let llctx = Llvm.create_context () in
  let llmem = Llvm.MemoryBuffer.of_file argv.(1) in
  let llm = Llvm_irreader.parse_ir llctx llmem in
  let main_func = Llvmutils.find_main llm in
  let entry = Llvm.entry_block main_func in
  Semantics.execute_block None entry Domain.Memory.empty

let _ = main Sys.argv
