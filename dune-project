(lang dune 2.9)
(name generics)

(version dev)
(authors "Daniel Vlasits" "Patrick Reader")
(maintainers "Daniel Vlasits <dvlasits@gmail.com>")
(source (github modular-implicits/generics))
(homepage http://github.com/modular-implicits/generics)
(bug_reports http://github.com/modular-implicits/generics/issues)

(package
  (name generics-core)
  (synopsis "Experimental generics library using modular implicits (dependency-free core)")
  (depends
    (ocaml-variants
      (or
        (= "4.02.1+modular-implicits")
        (= "4.02.1+modular-implicits-ber")
        (= "4.02.1+modular-implicits+let_syntax")))))

(package
  (name generics)
  (synopsis "Experimental generics library using modular implicits (batteries-included)")
  (depends
    (generics-core (= :version))
    imp))

(generate_opam_files)
