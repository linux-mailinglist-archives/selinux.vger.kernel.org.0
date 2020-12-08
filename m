Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FAE2D2DD2
	for <lists+selinux@lfdr.de>; Tue,  8 Dec 2020 16:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbgLHPFL (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 8 Dec 2020 10:05:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729640AbgLHPFL (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 8 Dec 2020 10:05:11 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FA9C061749
        for <selinux@vger.kernel.org>; Tue,  8 Dec 2020 07:04:31 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id y74so19633883oia.11
        for <selinux@vger.kernel.org>; Tue, 08 Dec 2020 07:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/XJBsJYKjzT8L1YAMYJ7res005YGOfF+TVopwK61aQ=;
        b=n8gI+Elo6bP8fGxg1wTUE6CWvty6HOnGHF/fQu5szirTiMX+7WkjVK4AAc3Kre5juT
         kj3x6SwuCiv6bbmPXyPma8MEsgm6j79OaxtTVfpCjM0oCHNv5hVbXG8RsBJwnt5Zv/Ph
         npDovkSipf4bNF95w9B4Lc7R0U9wMb6MC4XTP1NIEWi8/lXwSDqqnJFH/lHs2GhDk3ZA
         NNIvbQebrM053xsUCd2YHy/LKJQuadSPoT5G51r+EwvEb8CQe610X6JKs/PmoISaQUSA
         Y25PC0AmIcGMJ8JwemdATYZoXJSsbQnhqMl8/ufD2GlnU97PUqQ5YBazGsEzV21/cuZS
         mLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/XJBsJYKjzT8L1YAMYJ7res005YGOfF+TVopwK61aQ=;
        b=s0A3R9NoRBSiltGIqlq2zO17cooyRdTo+k8q5JeB61+0xPjpu1E2wfDeX7OFDfCWJR
         PXsbhgMxYMiZg1eYU3LTz2uoWelbtdBG6+oE+cnGrfco2W1T+0PvOQ8bswLjxC3jMbbr
         HRJDLnflKRqM2dL9CpjQp+H3qnt1JAiGHNukxzO1OqF5e95QRlh4tgu6aqSZbRXpmL8D
         nD6DXvitXOo53lRcsHC6xUjj1eg7NPAjazxaIrRCgkNmD1IcPxx5rYSc7h5jxf+ChYnU
         uFOrDrJOrVhMaE36vR75am3dkQGlnO0T/0B3+t02Nf2YDRaBG9+7HOnyTcuXjsxcufOz
         ZaTg==
X-Gm-Message-State: AOAM530n9j2WM4+CKZTXIpI2ftLhdITB+9dcYg2G1+hg/n1pl1IIaoga
        9dKy3kPhTickn9RlDGdbZvPa6CJzVNz9hmkFWc0=
X-Google-Smtp-Source: ABdhPJxm3+rBf+mWC3gyvLfst5ZZzujzTOND0BH8qk849yuwGZ3ZQNN+ffiRTU4zFfUZQhLo9MzDcnILHTxldUs9sFM=
X-Received: by 2002:aca:b902:: with SMTP id j2mr3003679oif.138.1607439870563;
 Tue, 08 Dec 2020 07:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20201206222922.421485-1-nicolas.iooss@m4x.org> <CAJfZ7==8UL-DfdU4jCG_D_qMAXDNJfS2U5EL90F1_tOHz_okOA@mail.gmail.com>
In-Reply-To: <CAJfZ7==8UL-DfdU4jCG_D_qMAXDNJfS2U5EL90F1_tOHz_okOA@mail.gmail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Tue, 8 Dec 2020 10:04:19 -0500
Message-ID: <CAP+JOzSWeZ7yNuH1Xdf0=ZEkZ7gV0JNaY4LtCaLgPEfr5x+8TA@mail.gmail.com>
Subject: Re: [PATCH] libsepol/cil: always destroy the lexer state
To:     Nicolas Iooss <nicolas.iooss@m4x.org>
Cc:     SElinux list <selinux@vger.kernel.org>,
        Evgeny Vereshchagin <evvers@ya.ru>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

It looks good to me as well.

Thanks,
Applied.

Jim


On Sun, Dec 6, 2020 at 5:35 PM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
>
> On Sun, Dec 6, 2020 at 11:31 PM Nicolas Iooss <nicolas.iooss@m4x.org> wrote:
> >
> > From: Evgeny Vereshchagin <evvers@ya.ru>
> >
> > It was found in https://github.com/google/oss-fuzz/pull/4790:
> > ```
> > Invalid token '' at line 2 of fuzz
> >         NEW_FUNC[1/2]: 0x67fff0 in yy_get_previous_state /src/selinux/libsepol/src/../cil/src/cil_lexer.c:1143
> >         NEW_FUNC[2/2]: 0x6803e0 in yy_try_NUL_trans /src/selinux/libsepol/src/../cil/src/cil_lexer.c:1176
> > =================================================================
> > ==12==ERROR: AddressSanitizer: heap-use-after-free on address 0x602000007992 at pc 0x000000681800 bp 0x7ffccddee530 sp 0x7ffccddee528
> > WRITE of size 1 at 0x602000007992 thread T0
> > SCARINESS: 41 (1-byte-write-heap-use-after-free)
> >     #0 0x6817ff in cil_yy_switch_to_buffer /src/selinux/libsepol/src/../cil/src/cil_lexer.c:1315:17
> >     #1 0x6820cc in cil_yy_scan_buffer /src/selinux/libsepol/src/../cil/src/cil_lexer.c:1571:2
> >     #2 0x682662 in cil_lexer_setup /src/selinux/libsepol/src/../cil/src/cil_lexer.l:73:6
> >     #3 0x5cf2ae in cil_parser /src/selinux/libsepol/src/../cil/src/cil_parser.c:220:2
> >     #4 0x56d5e2 in cil_add_file /src/selinux/libsepol/src/../cil/src/cil.c:514:7
> >     #5 0x556e91 in LLVMFuzzerTestOneInput /src/secilc-fuzzer.c:434:7
> >     #6 0x459ab1 in fuzzer::Fuzzer::ExecuteCallback(unsigned char const*, unsigned long) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:599:15
> >     #7 0x45a755 in fuzzer::Fuzzer::TryDetectingAMemoryLeak(unsigned char const*, unsigned long, bool) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:675:3
> >     #8 0x45acd9 in fuzzer::Fuzzer::MutateAndTestOne() /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:747:5
> >     #9 0x45b875 in fuzzer::Fuzzer::Loop(std::__Fuzzer::vector<fuzzer::SizedFile, fuzzer::fuzzer_allocator<fuzzer::SizedFile> >&) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:883:5
> >     #10 0x4499fb in fuzzer::FuzzerDriver(int*, char***, int (*)(unsigned char const*, unsigned long)) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerDriver.cpp:906:6
> >     #11 0x473a32 in main /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerMain.cpp:20:10
> >     #12 0x7f982296d83f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2083f)
> >     #13 0x41e758 in _start (/out/secilc-fuzzer+0x41e758)
> >
> > DEDUP_TOKEN: cil_yy_switch_to_buffer--cil_yy_scan_buffer--cil_lexer_setup
> > 0x602000007992 is located 2 bytes inside of 4-byte region [0x602000007990,0x602000007994)
> > freed by thread T0 here:
> >     #0 0x521ef2 in free /src/llvm-project/compiler-rt/lib/asan/asan_malloc_linux.cpp:127:3
> >     #1 0x56d630 in cil_add_file /src/selinux/libsepol/src/../cil/src/cil.c:526:2
> >     #2 0x556e91 in LLVMFuzzerTestOneInput /src/secilc-fuzzer.c:434:7
> >     #3 0x459ab1 in fuzzer::Fuzzer::ExecuteCallback(unsigned char const*, unsigned long) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:599:15
> >     #4 0x458fba in fuzzer::Fuzzer::RunOne(unsigned char const*, unsigned long, bool, fuzzer::InputInfo*, bool, bool*) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:505:3
> >     #5 0x45acc7 in fuzzer::Fuzzer::MutateAndTestOne() /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:745:19
> >     #6 0x45b875 in fuzzer::Fuzzer::Loop(std::__Fuzzer::vector<fuzzer::SizedFile, fuzzer::fuzzer_allocator<fuzzer::SizedFile> >&) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:883:5
> >     #7 0x4499fb in fuzzer::FuzzerDriver(int*, char***, int (*)(unsigned char const*, unsigned long)) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerDriver.cpp:906:6
> >     #8 0x473a32 in main /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerMain.cpp:20:10
> >     #9 0x7f982296d83f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2083f)
> >
> > DEDUP_TOKEN: free--cil_add_file--LLVMFuzzerTestOneInput
> > previously allocated by thread T0 here:
> >     #0 0x52215d in malloc /src/llvm-project/compiler-rt/lib/asan/asan_malloc_linux.cpp:145:3
> >     #1 0x5cecb8 in cil_malloc /src/selinux/libsepol/src/../cil/src/cil_mem.c:39:14
> >     #2 0x56d584 in cil_add_file /src/selinux/libsepol/src/../cil/src/cil.c:510:11
> >     #3 0x556e91 in LLVMFuzzerTestOneInput /src/secilc-fuzzer.c:434:7
> >     #4 0x459ab1 in fuzzer::Fuzzer::ExecuteCallback(unsigned char const*, unsigned long) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:599:15
> >     #5 0x458fba in fuzzer::Fuzzer::RunOne(unsigned char const*, unsigned long, bool, fuzzer::InputInfo*, bool, bool*) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:505:3
> >     #6 0x45acc7 in fuzzer::Fuzzer::MutateAndTestOne() /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:745:19
> >     #7 0x45b875 in fuzzer::Fuzzer::Loop(std::__Fuzzer::vector<fuzzer::SizedFile, fuzzer::fuzzer_allocator<fuzzer::SizedFile> >&) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerLoop.cpp:883:5
> >     #8 0x4499fb in fuzzer::FuzzerDriver(int*, char***, int (*)(unsigned char const*, unsigned long)) /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerDriver.cpp:906:6
> >     #9 0x473a32 in main /src/llvm-project/compiler-rt/lib/fuzzer/FuzzerMain.cpp:20:10
> >     #10 0x7f982296d83f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2083f)
> >
> > DEDUP_TOKEN: malloc--cil_malloc--cil_add_file
> > SUMMARY: AddressSanitizer: heap-use-after-free /src/selinux/libsepol/src/../cil/src/cil_lexer.c:1315:17 in cil_yy_switch_to_buffer
> > Shadow bytes around the buggy address:
> >   0x0c047fff8ee0: fa fa fd fa fa fa fd fd fa fa fd fa fa fa fd fd
> >   0x0c047fff8ef0: fa fa fd fa fa fa fd fd fa fa fd fa fa fa fd fd
> >   0x0c047fff8f00: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fd
> >   0x0c047fff8f10: fa fa fd fa fa fa fd fd fa fa fd fa fa fa fd fd
> >   0x0c047fff8f20: fa fa fd fa fa fa fd fd fa fa fd fa fa fa fd fa
> > =>0x0c047fff8f30: fa fa[fd]fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x0c047fff8f40: fa fa fd fa fa fa fd fa fa fa fd fa fa fa fd fa
> >   0x0c047fff8f50: fa fa fd fa fa fa fd fd fa fa fd fa fa fa fd fa
> >   0x0c047fff8f60: fa fa fd fd fa fa fd fa fa fa fd fd fa fa fd fa
> >   0x0c047fff8f70: fa fa 00 00 fa fa 02 fa fa fa 02 fa fa fa 00 fa
> >   0x0c047fff8f80: fa fa 03 fa fa fa 00 fa fa fa 03 fa fa fa 00 fa
> > Shadow byte legend (one shadow byte represents 8 application bytes):
> >   Addressable:           00
> >   Partially addressable: 01 02 03 04 05 06 07
> >   Heap left redzone:       fa
> >   Freed heap region:       fd
> >   Stack left redzone:      f1
> >   Stack mid redzone:       f2
> >   Stack right redzone:     f3
> >   Stack after return:      f5
> >   Stack use after scope:   f8
> >   Global redzone:          f9
> >   Global init order:       f6
> >   Poisoned by user:        f7
> >   Container overflow:      fc
> >   Array cookie:            ac
> >   Intra object redzone:    bb
> >   ASan internal:           fe
> >   Left alloca redzone:     ca
> >   Right alloca redzone:    cb
> >   Shadow gap:              cc
> > ==12==ABORTING
> > ```
> >
> > Signed-off-by: Evgeny Vereshchagin <evvers@ya.ru>
> > ---
> > Patch forwarded from https://github.com/SELinuxProject/selinux/pull/274
>
> Oops, I forgot to Cc the orginal author of the patch. Adding him now, with my:
>
> Acked-by: Nicolas Iooss <nicolas.iooss@m4x.org>
>
> Nicolas
>
> > ---
> >  libsepol/cil/src/cil_parser.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/libsepol/cil/src/cil_parser.c b/libsepol/cil/src/cil_parser.c
> > index 585ea7704eeb..a8af1dce2c4b 100644
> > --- a/libsepol/cil/src/cil_parser.c
> > +++ b/libsepol/cil/src/cil_parser.c
> > @@ -310,6 +310,7 @@ exit:
> >         while (!cil_stack_is_empty(stack)) {
> >                 pop_hll_info(stack, &hll_lineno, &hll_expand);
> >         }
> > +       cil_lexer_destroy();
> >         cil_stack_destroy(&stack);
> >
> >         return SEPOL_ERR;
> > --
> > 2.29.2
> >
>
