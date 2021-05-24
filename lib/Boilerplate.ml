(**
   Boilerplate to be used as a template when mapping the javascript CST
   to another type of tree.
*)

(* Disable warnings against unused variables *)
[@@@warning "-26-27"]

(* Disable warning against unused 'rec' *)
[@@@warning "-39"]

type env = unit

let token (env : env) (_tok : Tree_sitter_run.Token.t) =
  failwith "not implemented"

let blank (env : env) () =
  failwith "not implemented"

let todo (env : env) _ =
   failwith "not implemented"

let map_semgrep_metavar (env : env) (tok : CST.semgrep_metavar) =
  token env tok (* pattern \$[a-zA-Z_][a-zA-Z_0-9]* *)

let map_imm_tok_pat_3a2a380 (env : env) (tok : CST.imm_tok_pat_3a2a380) =
  token env tok (* pattern "[^\"\\\\]+" *)

let map_identifier (env : env) (tok : CST.identifier) =
  token env tok (* identifier *)

let map_jsx_identifier (env : env) (tok : CST.jsx_identifier) =
  token env tok (* pattern [a-zA-Z_$][a-zA-Z\d_$]*-[a-zA-Z\d_$\-]* *)

let map_regex_flags (env : env) (tok : CST.regex_flags) =
  token env tok (* pattern [a-z]+ *)

let map_hash_bang_line (env : env) (tok : CST.hash_bang_line) =
  token env tok (* pattern #!.* *)

let map_import (env : env) (tok : CST.import) =
  token env tok (* import *)

let map_number (env : env) (tok : CST.number) =
  token env tok (* number *)

let map_automatic_semicolon (env : env) (tok : CST.automatic_semicolon) =
  token env tok (* automatic_semicolon *)

let map_regex_pattern (env : env) (tok : CST.regex_pattern) =
  token env tok (* regex_pattern *)

let map_reserved_identifier (env : env) (x : CST.reserved_identifier) =
  (match x with
  | `Get tok -> token env tok (* "get" *)
  | `Set tok -> token env tok (* "set" *)
  | `Async tok -> token env tok (* "async" *)
  | `Static tok -> token env tok (* "static" *)
  | `Export tok -> token env tok (* "export" *)
  )

let map_anon_choice_PLUSPLUS_e498e28 (env : env) (x : CST.anon_choice_PLUSPLUS_e498e28) =
  (match x with
  | `PLUSPLUS tok -> token env tok (* "++" *)
  | `DASHDASH tok -> token env tok (* "--" *)
  )

let map_jsx_text (env : env) (tok : CST.jsx_text) =
  token env tok (* pattern [^{}<>]+ *)

let map_escape_sequence (env : env) (tok : CST.escape_sequence) =
  token env tok (* escape_sequence *)

let map_template_chars (env : env) (tok : CST.template_chars) =
  token env tok (* template_chars *)

let map_imm_tok_pat_dc28280 (env : env) (tok : CST.imm_tok_pat_dc28280) =
  token env tok (* pattern "[^'\\\\]+" *)

let map_import_export_specifier (env : env) ((v1, v2) : CST.import_export_specifier) =
  let v1 = token env v1 (* identifier *) in
  let v2 =
    (match v2 with
    | Some (v1, v2) ->
        let v1 = token env v1 (* "as" *) in
        let v2 = token env v2 (* identifier *) in
        todo env (v1, v2)
    | None -> todo env ())
  in
  todo env (v1, v2)

let rec map_anon_choice_id_b8f8ced (env : env) (x : CST.anon_choice_id_b8f8ced) =
  (match x with
  | `Id tok -> token env tok (* identifier *)
  | `Deco_member_exp x ->
      map_decorator_member_expression env x
  )

and map_decorator_member_expression (env : env) ((v1, v2, v3) : CST.decorator_member_expression) =
  let v1 = map_anon_choice_id_b8f8ced env v1 in
  let v2 = token env v2 (* "." *) in
  let v3 = token env v3 (* identifier *) in
  todo env (v1, v2, v3)

let map_namespace_import (env : env) ((v1, v2, v3) : CST.namespace_import) =
  let v1 = token env v1 (* "*" *) in
  let v2 = token env v2 (* "as" *) in
  let v3 = token env v3 (* identifier *) in
  todo env (v1, v2, v3)

let rec map_nested_identifier (env : env) ((v1, v2, v3) : CST.nested_identifier) =
  let v1 =
    (match v1 with
    | `Id tok -> token env tok (* identifier *)
    | `Nested_id x -> map_nested_identifier env x
    )
  in
  let v2 = token env v2 (* "." *) in
  let v3 = token env v3 (* identifier *) in
  todo env (v1, v2, v3)

let map_jsx_identifier_ (env : env) (x : CST.jsx_identifier_) =
  (match x with
  | `Jsx_id tok ->
      token env tok (* pattern [a-zA-Z_$][a-zA-Z\d_$]*-[a-zA-Z\d_$\-]* *)
  | `Id tok -> token env tok (* identifier *)
  )

let map_semicolon (env : env) (x : CST.semicolon) =
  (match x with
  | `Auto_semi tok -> token env tok (* automatic_semicolon *)
  | `SEMI tok -> token env tok (* ";" *)
  )

let map_anon_choice_rese_id_9a83200 (env : env) (x : CST.anon_choice_rese_id_9a83200) =
  (match x with
  | `Choice_get x -> map_reserved_identifier env x
  | `Id tok -> token env tok (* identifier *)
  )

let map_anon_choice_id_0e3c97f (env : env) (x : CST.anon_choice_id_0e3c97f) =
  (match x with
  | `Id tok -> token env tok (* identifier *)
  | `Choice_get x -> map_reserved_identifier env x
  )

let map_string_ (env : env) (x : CST.string_) =
  (match x with
  | `DQUOT_rep_choice_imm_tok_pat_3a2a380_DQUOT (v1, v2, v3) ->
      let v1 = token env v1 (* "\"" *) in
      let v2 =
        List.map (fun x ->
          (match x with
          | `Imm_tok_pat_3a2a380 tok ->
              token env tok (* pattern "[^\"\\\\]+" *)
          | `Esc_seq tok -> token env tok (* escape_sequence *)
          )
        ) v2
      in
      let v3 = token env v3 (* "\"" *) in
      todo env (v1, v2, v3)
  | `SQUOT_rep_choice_imm_tok_pat_dc28280_SQUOT (v1, v2, v3) ->
      let v1 = token env v1 (* "'" *) in
      let v2 =
        List.map (fun x ->
          (match x with
          | `Imm_tok_pat_dc28280 tok ->
              token env tok (* pattern "[^'\\\\]+" *)
          | `Esc_seq tok -> token env tok (* escape_sequence *)
          )
        ) v2
      in
      let v3 = token env v3 (* "'" *) in
      todo env (v1, v2, v3)
  )

let map_anon_import_export_spec_rep_COMMA_import_export_spec_3a1421d (env : env) ((v1, v2) : CST.anon_import_export_spec_rep_COMMA_import_export_spec_3a1421d) =
  let v1 = map_import_export_specifier env v1 in
  let v2 =
    List.map (fun (v1, v2) ->
      let v1 = token env v1 (* "," *) in
      let v2 = map_import_export_specifier env v2 in
      todo env (v1, v2)
    ) v2
  in
  todo env (v1, v2)

let map_jsx_namespace_name (env : env) ((v1, v2, v3) : CST.jsx_namespace_name) =
  let v1 = map_jsx_identifier_ env v1 in
  let v2 = token env v2 (* ":" *) in
  let v3 = map_jsx_identifier_ env v3 in
  todo env (v1, v2, v3)

let map_from_clause (env : env) ((v1, v2) : CST.from_clause) =
  let v1 = token env v1 (* "from" *) in
  let v2 =
    (match v2 with
    | `Str x -> map_string_ env x
    | `Semg_meta tok ->
        token env tok (* pattern \$[a-zA-Z_][a-zA-Z_0-9]* *)
    )
  in
  todo env (v1, v2)

let map_named_imports (env : env) ((v1, v2, v3, v4) : CST.named_imports) =
  let v1 = token env v1 (* "{" *) in
  let v2 =
    (match v2 with
    | Some x ->
        map_anon_import_export_spec_rep_COMMA_import_export_spec_3a1421d env x
    | None -> todo env ())
  in
  let v3 =
    (match v3 with
    | Some tok -> token env tok (* "," *)
    | None -> todo env ())
  in
  let v4 = token env v4 (* "}" *) in
  todo env (v1, v2, v3, v4)

let map_export_clause (env : env) ((v1, v2, v3, v4) : CST.export_clause) =
  let v1 = token env v1 (* "{" *) in
  let v2 =
    (match v2 with
    | Some x ->
        map_anon_import_export_spec_rep_COMMA_import_export_spec_3a1421d env x
    | None -> todo env ())
  in
  let v3 =
    (match v3 with
    | Some tok -> token env tok (* "," *)
    | None -> todo env ())
  in
  let v4 = token env v4 (* "}" *) in
  todo env (v1, v2, v3, v4)

let map_jsx_attribute_name (env : env) (x : CST.jsx_attribute_name) =
  (match x with
  | `Choice_jsx_id x -> map_jsx_identifier_ env x
  | `Jsx_name_name x -> map_jsx_namespace_name env x
  )

let map_jsx_element_name (env : env) (x : CST.jsx_element_name) =
  (match x with
  | `Choice_jsx_id x -> map_jsx_identifier_ env x
  | `Nested_id x -> map_nested_identifier env x
  | `Jsx_name_name x -> map_jsx_namespace_name env x
  )

let map_import_clause (env : env) (x : CST.import_clause) =
  (match x with
  | `Name_import x -> map_namespace_import env x
  | `Named_imports x -> map_named_imports env x
  | `Id_opt_COMMA_choice_name_import (v1, v2) ->
      let v1 = token env v1 (* identifier *) in
      let v2 =
        (match v2 with
        | Some (v1, v2) ->
            let v1 = token env v1 (* "," *) in
            let v2 =
              (match v2 with
              | `Name_import x -> map_namespace_import env x
              | `Named_imports x -> map_named_imports env x
              )
            in
            todo env (v1, v2)
        | None -> todo env ())
      in
      todo env (v1, v2)
  )

let map_jsx_closing_element (env : env) ((v1, v2, v3, v4) : CST.jsx_closing_element) =
  let v1 = token env v1 (* "<" *) in
  let v2 = token env v2 (* "/" *) in
  let v3 = map_jsx_element_name env v3 in
  let v4 = token env v4 (* ">" *) in
  todo env (v1, v2, v3, v4)

let rec map_anon_choice_exp_9818c1b (env : env) (x : CST.anon_choice_exp_9818c1b) =
  (match x with
  | `Exp x -> map_expression env x
  | `Spread_elem x -> map_spread_element env x
  )

and map_anon_choice_exp_9cd0ed5 (env : env) (x : CST.anon_choice_exp_9cd0ed5) =
  (match x with
  | `Exp x -> map_expression env x
  | `Prim_exp x -> map_primary_expression env x
  )

and map_anon_choice_id_940079a (env : env) (x : CST.anon_choice_id_940079a) =
  (match x with
  | `Id tok -> token env tok (* identifier *)
  | `Dest_pat x -> map_destructuring_pattern env x
  )

and map_anon_choice_pair_fa39041 (env : env) (x : CST.anon_choice_pair_fa39041) =
  (match x with
  | `Pair (v1, v2, v3) ->
      let v1 = map_property_name env v1 in
      let v2 = token env v2 (* ":" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Spread_elem x -> map_spread_element env x
  | `Meth_defi x -> map_method_definition env x
  | `Choice_id x -> map_anon_choice_id_0e3c97f env x
  | `Semg_dots tok -> token env tok (* "..." *)
  )

and map_anon_choice_pair_pat_3ff9cbe (env : env) (x : CST.anon_choice_pair_pat_3ff9cbe) =
  (match x with
  | `Pair_pat (v1, v2, v3) ->
      let v1 = map_property_name env v1 in
      let v2 = token env v2 (* ":" *) in
      let v3 = map_pattern env v3 in
      todo env (v1, v2, v3)
  | `Rest_pat x -> map_rest_pattern env x
  | `Obj_assign_pat (v1, v2, v3) ->
      let v1 =
        (match v1 with
        | `Choice_choice_get x ->
            map_anon_choice_rese_id_9a83200 env x
        | `Dest_pat x -> map_destructuring_pattern env x
        )
      in
      let v2 = token env v2 (* "=" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Choice_id x -> map_anon_choice_id_0e3c97f env x
  )

and map_anon_choice_pat_3297d92 (env : env) (x : CST.anon_choice_pat_3297d92) =
  (match x with
  | `Pat x -> map_pattern env x
  | `Assign_pat x -> map_assignment_pattern env x
  )

and map_anon_opt_opt_choice_exp_rep_COMMA_opt_choice_exp_208ebb4 (env : env) (opt : CST.anon_opt_opt_choice_exp_rep_COMMA_opt_choice_exp_208ebb4) =
  (match opt with
  | Some (v1, v2) ->
      let v1 =
        (match v1 with
        | Some x -> map_anon_choice_exp_9818c1b env x
        | None -> todo env ())
      in
      let v2 = map_anon_rep_COMMA_opt_choice_exp_ca698a5 env v2 in
      todo env (v1, v2)
  | None -> todo env ())

and map_anon_rep_COMMA_opt_choice_exp_ca698a5 (env : env) (xs : CST.anon_rep_COMMA_opt_choice_exp_ca698a5) =
  List.map (fun (v1, v2) ->
    let v1 = token env v1 (* "," *) in
    let v2 =
      (match v2 with
      | Some x -> map_anon_choice_exp_9818c1b env x
      | None -> todo env ())
    in
    todo env (v1, v2)
  ) xs

and map_arguments (env : env) ((v1, v2, v3) : CST.arguments) =
  let v1 = token env v1 (* "(" *) in
  let v2 =
    map_anon_opt_opt_choice_exp_rep_COMMA_opt_choice_exp_208ebb4 env v2
  in
  let v3 = token env v3 (* ")" *) in
  todo env (v1, v2, v3)

and map_assignment_pattern (env : env) ((v1, v2, v3) : CST.assignment_pattern) =
  let v1 = map_pattern env v1 in
  let v2 = token env v2 (* "=" *) in
  let v3 = map_expression env v3 in
  todo env (v1, v2, v3)

and map_augmented_assignment_lhs (env : env) (x : CST.augmented_assignment_lhs) =
  (match x with
  | `Member_exp x -> map_member_expression env x
  | `Subs_exp x -> map_subscript_expression env x
  | `Choice_get x -> map_reserved_identifier env x
  | `Id tok -> token env tok (* identifier *)
  | `Paren_exp x -> map_parenthesized_expression env x
  )

and map_binary_expression (env : env) (x : CST.binary_expression) =
  (match x with
  | `Exp_AMPAMP_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "&&" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_BARBAR_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "||" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_GTGT_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* ">>" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_GTGTGT_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* ">>>" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_LTLT_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "<<" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_AMP_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "&" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_HAT_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "^" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_BAR_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "|" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_PLUS_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "+" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_DASH_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "-" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_STAR_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "*" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_SLASH_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "/" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_PERC_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "%" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_STARSTAR_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "**" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_LT_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "<" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_LTEQ_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "<=" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_EQEQ_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "==" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_EQEQEQ_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "===" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_BANGEQ_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "!=" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_BANGEQEQ_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "!==" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_GTEQ_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* ">=" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_GT_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* ">" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_QMARKQMARK_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "??" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_inst_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "instanceof" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Exp_in_exp (v1, v2, v3) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "in" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  )

and map_call_expression (env : env) (x : CST.call_expression) =
  (match x with
  | `Exp_choice_args (v1, v2) ->
      let v1 = map_expression env v1 in
      let v2 =
        (match v2 with
        | `Args x -> map_arguments env x
        | `Temp_str x -> map_template_string env x
        )
      in
      todo env (v1, v2)
  | `Prim_exp_QMARKDOT_args (v1, v2, v3) ->
      let v1 = map_primary_expression env v1 in
      let v2 = token env v2 (* "?." *) in
      let v3 = map_arguments env v3 in
      todo env (v1, v2, v3)
  )

and map_call_signature (env : env) (x : CST.call_signature) =
  map_formal_parameters env x

and map_catch_clause (env : env) ((v1, v2, v3) : CST.catch_clause) =
  let v1 = token env v1 (* "catch" *) in
  let v2 =
    (match v2 with
    | Some (v1, v2, v3) ->
        let v1 = token env v1 (* "(" *) in
        let v2 = map_anon_choice_id_940079a env v2 in
        let v3 = token env v3 (* ")" *) in
        todo env (v1, v2, v3)
    | None -> todo env ())
  in
  let v3 = map_statement_block env v3 in
  todo env (v1, v2, v3)

and map_class_body (env : env) ((v1, v2, v3) : CST.class_body) =
  let v1 = token env v1 (* "{" *) in
  let v2 =
    List.map (fun x ->
      (match x with
      | `Meth_defi_opt_SEMI (v1, v2) ->
          let v1 = map_method_definition env v1 in
          let v2 =
            (match v2 with
            | Some tok -> token env tok (* ";" *)
            | None -> todo env ())
          in
          todo env (v1, v2)
      | `Public_field_defi_choice_auto_semi (v1, v2) ->
          let v1 = map_public_field_definition env v1 in
          let v2 = map_semicolon env v2 in
          todo env (v1, v2)
      | `Semg_dots tok -> token env tok (* "..." *)
      )
    ) v2
  in
  let v3 = token env v3 (* "}" *) in
  todo env (v1, v2, v3)

and map_class_heritage (env : env) ((v1, v2) : CST.class_heritage) =
  let v1 = token env v1 (* "extends" *) in
  let v2 = map_expression env v2 in
  todo env (v1, v2)

and map_declaration (env : env) (x : CST.declaration) =
  (match x with
  | `Func_decl (v1, v2, v3, v4, v5, v6) ->
      let v1 =
        (match v1 with
        | Some tok -> token env tok (* "async" *)
        | None -> todo env ())
      in
      let v2 = token env v2 (* "function" *) in
      let v3 = token env v3 (* identifier *) in
      let v4 = map_call_signature env v4 in
      let v5 = map_statement_block env v5 in
      let v6 =
        (match v6 with
        | Some tok -> token env tok (* automatic_semicolon *)
        | None -> todo env ())
      in
      todo env (v1, v2, v3, v4, v5, v6)
  | `Gene_func_decl (v1, v2, v3, v4, v5, v6, v7) ->
      let v1 =
        (match v1 with
        | Some tok -> token env tok (* "async" *)
        | None -> todo env ())
      in
      let v2 = token env v2 (* "function" *) in
      let v3 = token env v3 (* "*" *) in
      let v4 = token env v4 (* identifier *) in
      let v5 = map_call_signature env v5 in
      let v6 = map_statement_block env v6 in
      let v7 =
        (match v7 with
        | Some tok -> token env tok (* automatic_semicolon *)
        | None -> todo env ())
      in
      todo env (v1, v2, v3, v4, v5, v6, v7)
  | `Class_decl (v1, v2, v3, v4, v5, v6) ->
      let v1 = List.map (map_decorator env) v1 in
      let v2 = token env v2 (* "class" *) in
      let v3 = token env v3 (* identifier *) in
      let v4 =
        (match v4 with
        | Some x -> map_class_heritage env x
        | None -> todo env ())
      in
      let v5 = map_class_body env v5 in
      let v6 =
        (match v6 with
        | Some tok -> token env tok (* automatic_semicolon *)
        | None -> todo env ())
      in
      todo env (v1, v2, v3, v4, v5, v6)
  | `Lexi_decl x -> map_lexical_declaration env x
  | `Var_decl x -> map_variable_declaration env x
  )

and map_decorator (env : env) ((v1, v2) : CST.decorator) =
  let v1 = token env v1 (* "@" *) in
  let v2 =
    (match v2 with
    | `Id tok -> token env tok (* identifier *)
    | `Deco_member_exp x ->
        map_decorator_member_expression env x
    | `Deco_call_exp x -> map_decorator_call_expression env x
    )
  in
  todo env (v1, v2)

and map_decorator_call_expression (env : env) ((v1, v2) : CST.decorator_call_expression) =
  let v1 = map_anon_choice_id_b8f8ced env v1 in
  let v2 = map_arguments env v2 in
  todo env (v1, v2)

and map_destructuring_pattern (env : env) (x : CST.destructuring_pattern) =
  (match x with
  | `Obj_pat (v1, v2, v3) ->
      let v1 = token env v1 (* "{" *) in
      let v2 =
        (match v2 with
        | Some (v1, v2) ->
            let v1 =
              (match v1 with
              | Some x -> map_anon_choice_pair_pat_3ff9cbe env x
              | None -> todo env ())
            in
            let v2 =
              List.map (fun (v1, v2) ->
                let v1 = token env v1 (* "," *) in
                let v2 =
                  (match v2 with
                  | Some x -> map_anon_choice_pair_pat_3ff9cbe env x
                  | None -> todo env ())
                in
                todo env (v1, v2)
              ) v2
            in
            todo env (v1, v2)
        | None -> todo env ())
      in
      let v3 = token env v3 (* "}" *) in
      todo env (v1, v2, v3)
  | `Array_pat (v1, v2, v3) ->
      let v1 = token env v1 (* "[" *) in
      let v2 =
        (match v2 with
        | Some (v1, v2) ->
            let v1 =
              (match v1 with
              | Some x -> map_anon_choice_pat_3297d92 env x
              | None -> todo env ())
            in
            let v2 =
              List.map (fun (v1, v2) ->
                let v1 = token env v1 (* "," *) in
                let v2 =
                  (match v2 with
                  | Some x -> map_anon_choice_pat_3297d92 env x
                  | None -> todo env ())
                in
                todo env (v1, v2)
              ) v2
            in
            todo env (v1, v2)
        | None -> todo env ())
      in
      let v3 = token env v3 (* "]" *) in
      todo env (v1, v2, v3)
  )

and map_else_clause (env : env) ((v1, v2) : CST.else_clause) =
  let v1 = token env v1 (* "else" *) in
  let v2 = map_statement env v2 in
  todo env (v1, v2)

and map_export_statement (env : env) (x : CST.export_statement) =
  (match x with
  | `Export_choice_STAR_from_clause_choice_auto_semi (v1, v2) ->
      let v1 = token env v1 (* "export" *) in
      let v2 =
        (match v2 with
        | `STAR_from_clause_choice_auto_semi (v1, v2, v3) ->
            let v1 = token env v1 (* "*" *) in
            let v2 = map_from_clause env v2 in
            let v3 = map_semicolon env v3 in
            todo env (v1, v2, v3)
        | `Export_clause_from_clause_choice_auto_semi (v1, v2, v3) ->
            let v1 = map_export_clause env v1 in
            let v2 = map_from_clause env v2 in
            let v3 = map_semicolon env v3 in
            todo env (v1, v2, v3)
        | `Export_clause_choice_auto_semi (v1, v2) ->
            let v1 = map_export_clause env v1 in
            let v2 = map_semicolon env v2 in
            todo env (v1, v2)
        )
      in
      todo env (v1, v2)
  | `Rep_deco_export_choice_decl (v1, v2, v3) ->
      let v1 = List.map (map_decorator env) v1 in
      let v2 = token env v2 (* "export" *) in
      let v3 =
        (match v3 with
        | `Decl x -> map_declaration env x
        | `Defa_choice_decl (v1, v2) ->
            let v1 = token env v1 (* "default" *) in
            let v2 =
              (match v2 with
              | `Decl x -> map_declaration env x
              | `Exp_choice_auto_semi (v1, v2) ->
                  let v1 = map_expression env v1 in
                  let v2 = map_semicolon env v2 in
                  todo env (v1, v2)
              )
            in
            todo env (v1, v2)
        )
      in
      todo env (v1, v2, v3)
  )

and map_expression (env : env) (x : CST.expression) =
  (match x with
  | `Prim_exp x -> map_primary_expression env x
  | `Choice_jsx_elem x -> map_jsx_element_ env x
  | `Jsx_frag x -> map_jsx_fragment env x
  | `Assign_exp (v1, v2, v3) ->
      let v1 =
        (match v1 with
        | `Paren_exp x -> map_parenthesized_expression env x
        | `Choice_member_exp x -> map_lhs_expression env x
        )
      in
      let v2 = token env v2 (* "=" *) in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Augm_assign_exp (v1, v2, v3) ->
      let v1 = map_augmented_assignment_lhs env v1 in
      let v2 =
        (match v2 with
        | `PLUSEQ tok -> token env tok (* "+=" *)
        | `DASHEQ tok -> token env tok (* "-=" *)
        | `STAREQ tok -> token env tok (* "*=" *)
        | `SLASHEQ tok -> token env tok (* "/=" *)
        | `PERCEQ tok -> token env tok (* "%=" *)
        | `HATEQ tok -> token env tok (* "^=" *)
        | `AMPEQ tok -> token env tok (* "&=" *)
        | `BAREQ tok -> token env tok (* "|=" *)
        | `GTGTEQ tok -> token env tok (* ">>=" *)
        | `GTGTGTEQ tok -> token env tok (* ">>>=" *)
        | `LTLTEQ tok -> token env tok (* "<<=" *)
        | `STARSTAREQ tok -> token env tok (* "**=" *)
        | `AMPAMPEQ tok -> token env tok (* "&&=" *)
        | `BARBAREQ tok -> token env tok (* "||=" *)
        | `QMARKQMARKEQ tok -> token env tok (* "??=" *)
        )
      in
      let v3 = map_expression env v3 in
      todo env (v1, v2, v3)
  | `Await_exp (v1, v2) ->
      let v1 = token env v1 (* "await" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  | `Un_exp x -> map_unary_expression env x
  | `Bin_exp x -> map_binary_expression env x
  | `Tern_exp (v1, v2, v3, v4, v5) ->
      let v1 = map_expression env v1 in
      let v2 = token env v2 (* "?" *) in
      let v3 = map_expression env v3 in
      let v4 = token env v4 (* ":" *) in
      let v5 = map_expression env v5 in
      todo env (v1, v2, v3, v4, v5)
  | `Update_exp x -> map_update_expression env x
  | `New_exp (v1, v2, v3) ->
      let v1 = token env v1 (* "new" *) in
      let v2 = map_primary_expression env v2 in
      let v3 =
        (match v3 with
        | Some x -> map_arguments env x
        | None -> todo env ())
      in
      todo env (v1, v2, v3)
  | `Yield_exp (v1, v2) ->
      let v1 = token env v1 (* "yield" *) in
      let v2 =
        (match v2 with
        | `STAR_exp (v1, v2) ->
            let v1 = token env v1 (* "*" *) in
            let v2 = map_expression env v2 in
            todo env (v1, v2)
        | `Opt_exp opt ->
            (match opt with
            | Some x -> map_expression env x
            | None -> todo env ())
        )
      in
      todo env (v1, v2)
  )

and map_expression_statement (env : env) ((v1, v2) : CST.expression_statement) =
  let v1 = map_expressions env v1 in
  let v2 = map_semicolon env v2 in
  todo env (v1, v2)

and map_expressions (env : env) (x : CST.expressions) =
  (match x with
  | `Exp x -> map_expression env x
  | `Seq_exp x -> map_sequence_expression env x
  )

and map_finally_clause (env : env) ((v1, v2) : CST.finally_clause) =
  let v1 = token env v1 (* "finally" *) in
  let v2 = map_statement_block env v2 in
  todo env (v1, v2)

and map_for_header (env : env) ((v1, v2, v3, v4, v5) : CST.for_header) =
  let v1 = token env v1 (* "(" *) in
  let v2 =
    (match v2 with
    | `Choice_choice_member_exp x ->
        (match x with
        | `Choice_member_exp x -> map_lhs_expression env x
        | `Paren_exp x -> map_parenthesized_expression env x
        )
    | `Choice_var_choice_id (v1, v2) ->
        let v1 =
          (match v1 with
          | `Var tok -> token env tok (* "var" *)
          | `Let tok -> token env tok (* "let" *)
          | `Const tok -> token env tok (* "const" *)
          )
        in
        let v2 = map_anon_choice_id_940079a env v2 in
        todo env (v1, v2)
    )
  in
  let v3 =
    (match v3 with
    | `In tok -> token env tok (* "in" *)
    | `Of tok -> token env tok (* "of" *)
    )
  in
  let v4 = map_expressions env v4 in
  let v5 = token env v5 (* ")" *) in
  todo env (v1, v2, v3, v4, v5)

and map_formal_parameter (env : env) (x : CST.formal_parameter) =
  (match x with
  | `Pat x -> map_pattern env x
  | `Assign_pat x -> map_assignment_pattern env x
  | `Semg_dots tok -> token env tok (* "..." *)
  )

and map_formal_parameters (env : env) ((v1, v2, v3) : CST.formal_parameters) =
  let v1 = token env v1 (* "(" *) in
  let v2 =
    (match v2 with
    | Some (v1, v2, v3) ->
        let v1 = map_formal_parameter env v1 in
        let v2 =
          List.map (fun (v1, v2) ->
            let v1 = token env v1 (* "," *) in
            let v2 = map_formal_parameter env v2 in
            todo env (v1, v2)
          ) v2
        in
        let v3 =
          (match v3 with
          | Some tok -> token env tok (* "," *)
          | None -> todo env ())
        in
        todo env (v1, v2, v3)
    | None -> todo env ())
  in
  let v3 = token env v3 (* ")" *) in
  todo env (v1, v2, v3)

and map_initializer_ (env : env) ((v1, v2) : CST.initializer_) =
  let v1 = token env v1 (* "=" *) in
  let v2 = map_expression env v2 in
  todo env (v1, v2)

and map_jsx_attribute_ (env : env) (x : CST.jsx_attribute_) =
  (match x with
  | `Jsx_attr (v1, v2) ->
      let v1 = map_jsx_attribute_name env v1 in
      let v2 =
        (match v2 with
        | Some (v1, v2) ->
            let v1 = token env v1 (* "=" *) in
            let v2 = map_jsx_attribute_value env v2 in
            todo env (v1, v2)
        | None -> todo env ())
      in
      todo env (v1, v2)
  | `Jsx_exp x -> map_jsx_expression env x
  | `Semg_dots tok -> token env tok (* "..." *)
  )

and map_jsx_attribute_value (env : env) (x : CST.jsx_attribute_value) =
  (match x with
  | `Str x -> map_string_ env x
  | `Jsx_exp x -> map_jsx_expression env x
  | `Choice_jsx_elem x -> map_jsx_element_ env x
  | `Jsx_frag x -> map_jsx_fragment env x
  | `Semg_dots tok -> token env tok (* "..." *)
  | `Semg_meta tok ->
      token env tok (* pattern \$[a-zA-Z_][a-zA-Z_0-9]* *)
  )

and map_jsx_child (env : env) (x : CST.jsx_child) =
  (match x with
  | `Jsx_text tok -> token env tok (* pattern [^{}<>]+ *)
  | `Choice_jsx_elem x -> map_jsx_element_ env x
  | `Jsx_frag x -> map_jsx_fragment env x
  | `Jsx_exp x -> map_jsx_expression env x
  )

and map_jsx_element_ (env : env) (x : CST.jsx_element_) =
  (match x with
  | `Jsx_elem (v1, v2, v3) ->
      let v1 = map_jsx_opening_element env v1 in
      let v2 = List.map (map_jsx_child env) v2 in
      let v3 = map_jsx_closing_element env v3 in
      todo env (v1, v2, v3)
  | `Jsx_self_clos_elem (v1, v2, v3, v4, v5) ->
      let v1 = token env v1 (* "<" *) in
      let v2 = map_jsx_element_name env v2 in
      let v3 = List.map (map_jsx_attribute_ env) v3 in
      let v4 = token env v4 (* "/" *) in
      let v5 = token env v5 (* ">" *) in
      todo env (v1, v2, v3, v4, v5)
  )

and map_jsx_expression (env : env) ((v1, v2, v3) : CST.jsx_expression) =
  let v1 = token env v1 (* "{" *) in
  let v2 =
    (match v2 with
    | Some x ->
        (match x with
        | `Exp x -> map_expression env x
        | `Seq_exp x -> map_sequence_expression env x
        | `Spread_elem x -> map_spread_element env x
        )
    | None -> todo env ())
  in
  let v3 = token env v3 (* "}" *) in
  todo env (v1, v2, v3)

and map_jsx_fragment (env : env) ((v1, v2, v3, v4, v5, v6) : CST.jsx_fragment) =
  let v1 = token env v1 (* "<" *) in
  let v2 = token env v2 (* ">" *) in
  let v3 = List.map (map_jsx_child env) v3 in
  let v4 = token env v4 (* "<" *) in
  let v5 = token env v5 (* "/" *) in
  let v6 = token env v6 (* ">" *) in
  todo env (v1, v2, v3, v4, v5, v6)

and map_jsx_opening_element (env : env) ((v1, v2, v3, v4) : CST.jsx_opening_element) =
  let v1 = token env v1 (* "<" *) in
  let v2 = map_jsx_element_name env v2 in
  let v3 = List.map (map_jsx_attribute_ env) v3 in
  let v4 = token env v4 (* ">" *) in
  todo env (v1, v2, v3, v4)

and map_lexical_declaration (env : env) ((v1, v2, v3, v4) : CST.lexical_declaration) =
  let v1 =
    (match v1 with
    | `Let tok -> token env tok (* "let" *)
    | `Const tok -> token env tok (* "const" *)
    )
  in
  let v2 = map_variable_declarator env v2 in
  let v3 =
    List.map (fun (v1, v2) ->
      let v1 = token env v1 (* "," *) in
      let v2 = map_variable_declarator env v2 in
      todo env (v1, v2)
    ) v3
  in
  let v4 = map_semicolon env v4 in
  todo env (v1, v2, v3, v4)

and map_lhs_expression (env : env) (x : CST.lhs_expression) =
  (match x with
  | `Member_exp x -> map_member_expression env x
  | `Subs_exp x -> map_subscript_expression env x
  | `Id tok -> token env tok (* identifier *)
  | `Choice_get x -> map_reserved_identifier env x
  | `Dest_pat x -> map_destructuring_pattern env x
  )

and map_member_expression (env : env) ((v1, v2, v3) : CST.member_expression) =
  let v1 = map_anon_choice_exp_9cd0ed5 env v1 in
  let v2 =
    (match v2 with
    | `DOT tok -> token env tok (* "." *)
    | `QMARKDOT tok -> token env tok (* "?." *)
    )
  in
  let v3 =
    (match v3 with
    | `Id tok -> token env tok (* identifier *)
    | `Semg_dots tok -> token env tok (* "..." *)
    )
  in
  todo env (v1, v2, v3)

and map_method_definition (env : env) ((v1, v2, v3, v4, v5, v6, v7) : CST.method_definition) =
  let v1 = List.map (map_decorator env) v1 in
  let v2 =
    (match v2 with
    | Some tok -> token env tok (* "static" *)
    | None -> todo env ())
  in
  let v3 =
    (match v3 with
    | Some tok -> token env tok (* "async" *)
    | None -> todo env ())
  in
  let v4 =
    (match v4 with
    | Some x ->
        (match x with
        | `Get tok -> token env tok (* "get" *)
        | `Set tok -> token env tok (* "set" *)
        | `STAR tok -> token env tok (* "*" *)
        )
    | None -> todo env ())
  in
  let v5 = map_property_name env v5 in
  let v6 = map_call_signature env v6 in
  let v7 = map_statement_block env v7 in
  todo env (v1, v2, v3, v4, v5, v6, v7)

and map_parenthesized_expression (env : env) ((v1, v2, v3) : CST.parenthesized_expression) =
  let v1 = token env v1 (* "(" *) in
  let v2 = map_expressions env v2 in
  let v3 = token env v3 (* ")" *) in
  todo env (v1, v2, v3)

and map_pattern (env : env) (x : CST.pattern) =
  (match x with
  | `Id tok -> token env tok (* identifier *)
  | `Choice_get x -> map_reserved_identifier env x
  | `Dest_pat x -> map_destructuring_pattern env x
  | `Rest_pat x -> map_rest_pattern env x
  )

and map_primary_expression (env : env) (x : CST.primary_expression) =
  (match x with
  | `Subs_exp x -> map_subscript_expression env x
  | `Member_exp x -> map_member_expression env x
  | `Paren_exp x -> map_parenthesized_expression env x
  | `Id tok -> token env tok (* identifier *)
  | `Choice_get x -> map_reserved_identifier env x
  | `This tok -> token env tok (* "this" *)
  | `Super tok -> token env tok (* "super" *)
  | `Num tok -> token env tok (* number *)
  | `Str x -> map_string_ env x
  | `Temp_str x -> map_template_string env x
  | `Regex (v1, v2, v3, v4) ->
      let v1 = token env v1 (* "/" *) in
      let v2 = token env v2 (* regex_pattern *) in
      let v3 = token env v3 (* "/" *) in
      let v4 =
        (match v4 with
        | Some tok -> token env tok (* pattern [a-z]+ *)
        | None -> todo env ())
      in
      todo env (v1, v2, v3, v4)
  | `True tok -> token env tok (* "true" *)
  | `False tok -> token env tok (* "false" *)
  | `Null tok -> token env tok (* "null" *)
  | `Unde tok -> token env tok (* "undefined" *)
  | `Import tok -> token env tok (* import *)
  | `Obj (v1, v2, v3) ->
      let v1 = token env v1 (* "{" *) in
      let v2 =
        (match v2 with
        | Some (v1, v2) ->
            let v1 =
              (match v1 with
              | Some x -> map_anon_choice_pair_fa39041 env x
              | None -> todo env ())
            in
            let v2 =
              List.map (fun (v1, v2) ->
                let v1 = token env v1 (* "," *) in
                let v2 =
                  (match v2 with
                  | Some x -> map_anon_choice_pair_fa39041 env x
                  | None -> todo env ())
                in
                todo env (v1, v2)
              ) v2
            in
            todo env (v1, v2)
        | None -> todo env ())
      in
      let v3 = token env v3 (* "}" *) in
      todo env (v1, v2, v3)
  | `Array (v1, v2, v3) ->
      let v1 = token env v1 (* "[" *) in
      let v2 =
        map_anon_opt_opt_choice_exp_rep_COMMA_opt_choice_exp_208ebb4 env v2
      in
      let v3 = token env v3 (* "]" *) in
      todo env (v1, v2, v3)
  | `Func (v1, v2, v3, v4, v5) ->
      let v1 =
        (match v1 with
        | Some tok -> token env tok (* "async" *)
        | None -> todo env ())
      in
      let v2 = token env v2 (* "function" *) in
      let v3 =
        (match v3 with
        | Some tok -> token env tok (* identifier *)
        | None -> todo env ())
      in
      let v4 = map_call_signature env v4 in
      let v5 = map_statement_block env v5 in
      todo env (v1, v2, v3, v4, v5)
  | `Arrow_func (v1, v2, v3, v4) ->
      let v1 =
        (match v1 with
        | Some tok -> token env tok (* "async" *)
        | None -> todo env ())
      in
      let v2 =
        (match v2 with
        | `Choice_choice_get x ->
            map_anon_choice_rese_id_9a83200 env x
        | `Formal_params x -> map_call_signature env x
        )
      in
      let v3 = token env v3 (* "=>" *) in
      let v4 =
        (match v4 with
        | `Exp x -> map_expression env x
        | `Stmt_blk x -> map_statement_block env x
        )
      in
      todo env (v1, v2, v3, v4)
  | `Gene_func (v1, v2, v3, v4, v5, v6) ->
      let v1 =
        (match v1 with
        | Some tok -> token env tok (* "async" *)
        | None -> todo env ())
      in
      let v2 = token env v2 (* "function" *) in
      let v3 = token env v3 (* "*" *) in
      let v4 =
        (match v4 with
        | Some tok -> token env tok (* identifier *)
        | None -> todo env ())
      in
      let v5 = map_call_signature env v5 in
      let v6 = map_statement_block env v6 in
      todo env (v1, v2, v3, v4, v5, v6)
  | `Class (v1, v2, v3, v4, v5) ->
      let v1 = List.map (map_decorator env) v1 in
      let v2 = token env v2 (* "class" *) in
      let v3 =
        (match v3 with
        | Some tok -> token env tok (* identifier *)
        | None -> todo env ())
      in
      let v4 =
        (match v4 with
        | Some x -> map_class_heritage env x
        | None -> todo env ())
      in
      let v5 = map_class_body env v5 in
      todo env (v1, v2, v3, v4, v5)
  | `Meta_prop (v1, v2, v3) ->
      let v1 = token env v1 (* "new" *) in
      let v2 = token env v2 (* "." *) in
      let v3 = token env v3 (* "target" *) in
      todo env (v1, v2, v3)
  | `Call_exp x -> map_call_expression env x
  | `Semg_dots tok -> token env tok (* "..." *)
  | `Semg_deep_exp (v1, v2, v3) ->
      let v1 = token env v1 (* "<..." *) in
      let v2 = map_expression env v2 in
      let v3 = token env v3 (* "...>" *) in
      todo env (v1, v2, v3)
  )

and map_property_name (env : env) (x : CST.property_name) =
  (match x with
  | `Choice_id x -> map_anon_choice_id_0e3c97f env x
  | `Str x -> map_string_ env x
  | `Num tok -> token env tok (* number *)
  | `Comp_prop_name (v1, v2, v3) ->
      let v1 = token env v1 (* "[" *) in
      let v2 = map_expression env v2 in
      let v3 = token env v3 (* "]" *) in
      todo env (v1, v2, v3)
  )

and map_public_field_definition (env : env) ((v1, v2, v3, v4) : CST.public_field_definition) =
  let v1 = List.map (map_decorator env) v1 in
  let v2 =
    (match v2 with
    | Some tok -> token env tok (* "static" *)
    | None -> todo env ())
  in
  let v3 = map_property_name env v3 in
  let v4 =
    (match v4 with
    | Some x -> map_initializer_ env x
    | None -> todo env ())
  in
  todo env (v1, v2, v3, v4)

and map_rest_pattern (env : env) ((v1, v2) : CST.rest_pattern) =
  let v1 = token env v1 (* "..." *) in
  let v2 = map_anon_choice_id_940079a env v2 in
  todo env (v1, v2)

and map_sequence_expression (env : env) ((v1, v2, v3) : CST.sequence_expression) =
  let v1 = map_expression env v1 in
  let v2 = token env v2 (* "," *) in
  let v3 =
    (match v3 with
    | `Seq_exp x -> map_sequence_expression env x
    | `Exp x -> map_expression env x
    )
  in
  todo env (v1, v2, v3)

and map_spread_element (env : env) ((v1, v2) : CST.spread_element) =
  let v1 = token env v1 (* "..." *) in
  let v2 = map_expression env v2 in
  todo env (v1, v2)

and map_statement (env : env) (x : CST.statement) =
  (match x with
  | `Export_stmt x -> map_export_statement env x
  | `Import_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "import" *) in
      let v2 =
        (match v2 with
        | `Import_clause_from_clause (v1, v2) ->
            let v1 = map_import_clause env v1 in
            let v2 = map_from_clause env v2 in
            todo env (v1, v2)
        | `Str x -> map_string_ env x
        )
      in
      let v3 = map_semicolon env v3 in
      todo env (v1, v2, v3)
  | `Debu_stmt (v1, v2) ->
      let v1 = token env v1 (* "debugger" *) in
      let v2 = map_semicolon env v2 in
      todo env (v1, v2)
  | `Exp_stmt x -> map_expression_statement env x
  | `Decl x -> map_declaration env x
  | `Stmt_blk x -> map_statement_block env x
  | `If_stmt (v1, v2, v3, v4) ->
      let v1 = token env v1 (* "if" *) in
      let v2 = map_parenthesized_expression env v2 in
      let v3 = map_statement env v3 in
      let v4 =
        (match v4 with
        | Some x -> map_else_clause env x
        | None -> todo env ())
      in
      todo env (v1, v2, v3, v4)
  | `Switch_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "switch" *) in
      let v2 = map_parenthesized_expression env v2 in
      let v3 = map_switch_body env v3 in
      todo env (v1, v2, v3)
  | `For_stmt (v1, v2, v3, v4, v5, v6, v7) ->
      let v1 = token env v1 (* "for" *) in
      let v2 = token env v2 (* "(" *) in
      let v3 =
        (match v3 with
        | `Lexi_decl x -> map_lexical_declaration env x
        | `Var_decl x -> map_variable_declaration env x
        | `Exp_stmt x -> map_expression_statement env x
        | `Empty_stmt tok -> token env tok (* ";" *)
        )
      in
      let v4 =
        (match v4 with
        | `Exp_stmt x -> map_expression_statement env x
        | `Empty_stmt tok -> token env tok (* ";" *)
        )
      in
      let v5 =
        (match v5 with
        | Some x -> map_expressions env x
        | None -> todo env ())
      in
      let v6 = token env v6 (* ")" *) in
      let v7 = map_statement env v7 in
      todo env (v1, v2, v3, v4, v5, v6, v7)
  | `For_in_stmt (v1, v2, v3, v4) ->
      let v1 = token env v1 (* "for" *) in
      let v2 =
        (match v2 with
        | Some tok -> token env tok (* "await" *)
        | None -> todo env ())
      in
      let v3 = map_for_header env v3 in
      let v4 = map_statement env v4 in
      todo env (v1, v2, v3, v4)
  | `While_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "while" *) in
      let v2 = map_parenthesized_expression env v2 in
      let v3 = map_statement env v3 in
      todo env (v1, v2, v3)
  | `Do_stmt (v1, v2, v3, v4, v5) ->
      let v1 = token env v1 (* "do" *) in
      let v2 = map_statement env v2 in
      let v3 = token env v3 (* "while" *) in
      let v4 = map_parenthesized_expression env v4 in
      let v5 = map_semicolon env v5 in
      todo env (v1, v2, v3, v4, v5)
  | `Try_stmt (v1, v2, v3, v4) ->
      let v1 = token env v1 (* "try" *) in
      let v2 = map_statement_block env v2 in
      let v3 =
        (match v3 with
        | Some x -> map_catch_clause env x
        | None -> todo env ())
      in
      let v4 =
        (match v4 with
        | Some x -> map_finally_clause env x
        | None -> todo env ())
      in
      todo env (v1, v2, v3, v4)
  | `With_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "with" *) in
      let v2 = map_parenthesized_expression env v2 in
      let v3 = map_statement env v3 in
      todo env (v1, v2, v3)
  | `Brk_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "break" *) in
      let v2 =
        (match v2 with
        | Some tok -> token env tok (* identifier *)
        | None -> todo env ())
      in
      let v3 = map_semicolon env v3 in
      todo env (v1, v2, v3)
  | `Cont_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "continue" *) in
      let v2 =
        (match v2 with
        | Some tok -> token env tok (* identifier *)
        | None -> todo env ())
      in
      let v3 = map_semicolon env v3 in
      todo env (v1, v2, v3)
  | `Ret_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "return" *) in
      let v2 =
        (match v2 with
        | Some x -> map_expressions env x
        | None -> todo env ())
      in
      let v3 = map_semicolon env v3 in
      todo env (v1, v2, v3)
  | `Throw_stmt (v1, v2, v3) ->
      let v1 = token env v1 (* "throw" *) in
      let v2 = map_expressions env v2 in
      let v3 = map_semicolon env v3 in
      todo env (v1, v2, v3)
  | `Empty_stmt tok -> token env tok (* ";" *)
  | `Labe_stmt (v1, v2, v3) ->
      let v1 = map_anon_choice_id_0e3c97f env v1 in
      let v2 = token env v2 (* ":" *) in
      let v3 = map_statement env v3 in
      todo env (v1, v2, v3)
  | `Semg_for (v1, v2, v3, v4, v5) ->
      let v1 = token env v1 (* "for" *) in
      let v2 = token env v2 (* "(" *) in
      let v3 = token env v3 (* "..." *) in
      let v4 = token env v4 (* ")" *) in
      let v5 = map_statement env v5 in
      todo env (v1, v2, v3, v4, v5)
  )

and map_statement_block (env : env) ((v1, v2, v3, v4) : CST.statement_block) =
  let v1 = token env v1 (* "{" *) in
  let v2 = List.map (map_statement env) v2 in
  let v3 = token env v3 (* "}" *) in
  let v4 =
    (match v4 with
    | Some tok -> token env tok (* automatic_semicolon *)
    | None -> todo env ())
  in
  todo env (v1, v2, v3, v4)

and map_subscript_expression (env : env) ((v1, v2, v3, v4, v5) : CST.subscript_expression) =
  let v1 = map_anon_choice_exp_9cd0ed5 env v1 in
  let v2 =
    (match v2 with
    | Some tok -> token env tok (* "?." *)
    | None -> todo env ())
  in
  let v3 = token env v3 (* "[" *) in
  let v4 = map_expressions env v4 in
  let v5 = token env v5 (* "]" *) in
  todo env (v1, v2, v3, v4, v5)

and map_switch_body (env : env) ((v1, v2, v3) : CST.switch_body) =
  let v1 = token env v1 (* "{" *) in
  let v2 =
    List.map (fun x ->
      (match x with
      | `Switch_case x -> map_switch_case env x
      | `Switch_defa x -> map_switch_default env x
      )
    ) v2
  in
  let v3 = token env v3 (* "}" *) in
  todo env (v1, v2, v3)

and map_switch_case (env : env) ((v1, v2, v3, v4) : CST.switch_case) =
  let v1 = token env v1 (* "case" *) in
  let v2 = map_expressions env v2 in
  let v3 = token env v3 (* ":" *) in
  let v4 = List.map (map_statement env) v4 in
  todo env (v1, v2, v3, v4)

and map_switch_default (env : env) ((v1, v2, v3) : CST.switch_default) =
  let v1 = token env v1 (* "default" *) in
  let v2 = token env v2 (* ":" *) in
  let v3 = List.map (map_statement env) v3 in
  todo env (v1, v2, v3)

and map_template_string (env : env) ((v1, v2, v3) : CST.template_string) =
  let v1 = token env v1 (* "`" *) in
  let v2 =
    List.map (fun x ->
      (match x with
      | `Temp_chars tok -> token env tok (* template_chars *)
      | `Esc_seq tok -> token env tok (* escape_sequence *)
      | `Temp_subs x -> map_template_substitution env x
      )
    ) v2
  in
  let v3 = token env v3 (* "`" *) in
  todo env (v1, v2, v3)

and map_template_substitution (env : env) ((v1, v2, v3) : CST.template_substitution) =
  let v1 = token env v1 (* "${" *) in
  let v2 = map_expressions env v2 in
  let v3 = token env v3 (* "}" *) in
  todo env (v1, v2, v3)

and map_unary_expression (env : env) (x : CST.unary_expression) =
  (match x with
  | `BANG_exp (v1, v2) ->
      let v1 = token env v1 (* "!" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  | `TILDE_exp (v1, v2) ->
      let v1 = token env v1 (* "~" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  | `DASH_exp (v1, v2) ->
      let v1 = token env v1 (* "-" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  | `PLUS_exp (v1, v2) ->
      let v1 = token env v1 (* "+" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  | `Typeof_exp (v1, v2) ->
      let v1 = token env v1 (* "typeof" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  | `Void_exp (v1, v2) ->
      let v1 = token env v1 (* "void" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  | `Delete_exp (v1, v2) ->
      let v1 = token env v1 (* "delete" *) in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  )

and map_update_expression (env : env) (x : CST.update_expression) =
  (match x with
  | `Exp_choice_PLUSPLUS (v1, v2) ->
      let v1 = map_expression env v1 in
      let v2 = map_anon_choice_PLUSPLUS_e498e28 env v2 in
      todo env (v1, v2)
  | `Choice_PLUSPLUS_exp (v1, v2) ->
      let v1 = map_anon_choice_PLUSPLUS_e498e28 env v1 in
      let v2 = map_expression env v2 in
      todo env (v1, v2)
  )

and map_variable_declaration (env : env) ((v1, v2, v3, v4) : CST.variable_declaration) =
  let v1 = token env v1 (* "var" *) in
  let v2 = map_variable_declarator env v2 in
  let v3 =
    List.map (fun (v1, v2) ->
      let v1 = token env v1 (* "," *) in
      let v2 = map_variable_declarator env v2 in
      todo env (v1, v2)
    ) v3
  in
  let v4 = map_semicolon env v4 in
  todo env (v1, v2, v3, v4)

and map_variable_declarator (env : env) ((v1, v2) : CST.variable_declarator) =
  let v1 = map_anon_choice_id_940079a env v1 in
  let v2 =
    (match v2 with
    | Some x -> map_initializer_ env x
    | None -> todo env ())
  in
  todo env (v1, v2)

let map_semgrep_partial (env : env) (x : CST.semgrep_partial) =
  (match x with
  | `Opt_async_func_id_formal_params (v1, v2, v3, v4) ->
      let v1 =
        (match v1 with
        | Some tok -> token env tok (* "async" *)
        | None -> todo env ())
      in
      let v2 = token env v2 (* "function" *) in
      let v3 = token env v3 (* identifier *) in
      let v4 = map_call_signature env v4 in
      todo env (v1, v2, v3, v4)
  | `Rep_deco_class_id_opt_class_heri (v1, v2, v3, v4) ->
      let v1 = List.map (map_decorator env) v1 in
      let v2 = token env v2 (* "class" *) in
      let v3 = token env v3 (* identifier *) in
      let v4 =
        (match v4 with
        | Some x -> map_class_heritage env x
        | None -> todo env ())
      in
      todo env (v1, v2, v3, v4)
  | `If_paren_exp (v1, v2) ->
      let v1 = token env v1 (* "if" *) in
      let v2 = map_parenthesized_expression env v2 in
      todo env (v1, v2)
  | `Try_stmt_blk (v1, v2) ->
      let v1 = token env v1 (* "try" *) in
      let v2 = map_statement_block env v2 in
      todo env (v1, v2)
  | `Catch_clause x -> map_catch_clause env x
  | `Fina_clause x -> map_finally_clause env x
  )

let map_program (env : env) ((v1, v2) : CST.program) =
  let v1 =
    (match v1 with
    | Some tok -> token env tok (* pattern #!.* *)
    | None -> todo env ())
  in
  let v2 =
    (match v2 with
    | `Rep_choice_export_stmt xs ->
        List.map (map_statement env) xs
    | `X___SEMGREP_PARTIAL_semg_part (v1, v2) ->
        let v1 = token env v1 (* "__SEMGREP_PARTIAL" *) in
        let v2 = map_semgrep_partial env v2 in
        todo env (v1, v2)
    )
  in
  todo env (v1, v2)
