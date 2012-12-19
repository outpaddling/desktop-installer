--- gcc/config/rs6000/freebsd.h.orig	2009-08-10 13:23:57.000000000 -0500
+++ gcc/config/rs6000/freebsd.h	2011-03-22 10:45:25.000000000 -0500
@@ -1,5 +1,5 @@
 /* Definitions for PowerPC running FreeBSD using the ELF format
-   Copyright (C) 2001, 2003, 2007, 2009 Free Software Foundation, Inc.
+   Copyright (C) 2001, 2003, 2007, 2009, 2011 Free Software Foundation, Inc.
    Contributed by David E. O'Brien <obrien@FreeBSD.org> and BSDi.
 
    This file is part of GCC.
@@ -72,3 +72,8 @@
 /* Define SVR4_ASM_SPEC, we use GAS by default. See svr4.h for details.  */
 #define SVR4_ASM_SPEC \
   "%{v:-V} %{Wa,*:%*}"
+/* We don't need to generate entries in .fixup, except when
+   -mrelocatable or -mrelocatable-lib is given.  */
+#undef RELOCATABLE_NEEDS_FIXUP
+#define RELOCATABLE_NEEDS_FIXUP	\
+  (target_flags & target_flags_explicit & MASK_RELOCATABLE)
