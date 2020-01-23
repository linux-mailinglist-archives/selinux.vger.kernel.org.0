Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 075EE147397
	for <lists+selinux@lfdr.de>; Thu, 23 Jan 2020 23:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAWWIz (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Thu, 23 Jan 2020 17:08:55 -0500
Received: from mail-lj1-f169.google.com ([209.85.208.169]:42044 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgAWWIz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Thu, 23 Jan 2020 17:08:55 -0500
Received: by mail-lj1-f169.google.com with SMTP id y4so49414ljj.9
        for <selinux@vger.kernel.org>; Thu, 23 Jan 2020 14:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=d0DAmBfbt7UZSB7dxoiZ/lrp6AqpBzqagelLSW9k8o8=;
        b=R7lHPzycb9p6b4FlwI1VndryeV2zqiEwekNSv+B15QXyHPzxTFpVqikqJr4xVVODly
         pLu/pGlnsI18DJ9oXxPF4FUsA13CvWZa63X72JeEq9xjwG9F1RZD5Y6JiOegCmPmXEAr
         e6x7Y0ABHxiQgnAwvTWBnmvP2yB/f4dpQhYqUkuiplfSlf1FjVazKOz084ZvKqoziBxC
         8SfJ3FB3ZVIHs7B/6epS0SobUJ6THhL4gi715D/xOaFGvNBMZh8Il2a6QwjMPQOMy/GF
         1Y1k+U53w0LliwZdOlIWrv2LtLAmFhgE9uAt0xTn9DoRMHsrTMCnLmLNfAwGmaTaJDN7
         OHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=d0DAmBfbt7UZSB7dxoiZ/lrp6AqpBzqagelLSW9k8o8=;
        b=EswY1SwX0MnNy3na42lgSN157JytB+EngEIvTo2QaoqGLislc1IFl64lFAgEndWpVy
         a03nQE8Yw9UNHQ0WnR0K0qgqRwxyT7hpMtOsy6bYgRA6jaTU329ExuvBqz0sZDKaPvnt
         Ts0Is0xdt5qySzb0cxCpUEWG8v8vJbcXKYF0mldSUACGnZnea6HLU9FuwZlLFnz5gZ8e
         v/omkyL2vpHpqa4M35Zi3rJoMicUZglZ69adsihJ+Q7WM000iZPm1fzIf/ZgXDnHLMZR
         N8KEVlJiW6TGUXm9Fae177VMSiheShAfwDfPcbFzSreDDjcLbYz/49O7i9yby+1xzFny
         MArg==
X-Gm-Message-State: APjAAAWiYOGALazxQ/6uPyfl6orCbgqUStBl0ScxH0lYd3gaLM+eZcuU
        qa+9Eq6O6AhibKsQBMkpgc/G6Ji042X4QkYOOIPCMBrLCg==
X-Google-Smtp-Source: APXvYqzyPhAKHD+SUnJ9nmM21BSj+JtY0I8jdLEr39jQzDesOss7qk2TEqNGZVNBJ+F4AqAQPRkK/4kZ479Ksp1/Dgo=
X-Received: by 2002:a2e:b52b:: with SMTP id z11mr305229ljm.155.1579817333166;
 Thu, 23 Jan 2020 14:08:53 -0800 (PST)
MIME-Version: 1.0
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 23 Jan 2020 17:08:42 -0500
Message-ID: <CAHC9VhR=SFfWz6OC72fBw=Y9+6LpkZg-ZY=2iZzF-0-QLAedhA@mail.gmail.com>
Subject: Problems with the selinux-testsuite and GCC v10?
To:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Is anyone else seeing the failure below?  I haven't dug into it too
much, but I believe it happened when my test system was updated to GCC
v10 (Fedora Rawhide).

make[2]: Entering directory '/root/sources/selinux-testsuite/tests/binder'
cc -g -O0 -Wall -D_GNU_SOURCE -DHAVE_BPF -DHAVE_BINDERFS
check_binder.c binder_common.c binder_common.h ../bpf/bpf_common.c
../bpf/bpf_common.h  -lselinux -lrt -lbpf -o check_binder
/usr/bin/ld: /tmp/ccZwlOfx.o:/root/sources/selinux-testsuite/tests/binder/binder_common.h:45:
multiple definition of `verbose';
/tmp/ccET4A6w.o:/root/sources/selinux-testsuite/tests/binder/binder_common.h:
45: first defined here
/usr/bin/ld: /tmp/ccZwlOfx.o:/root/sources/selinux-testsuite/tests/binder/binder_common.h:56:
multiple definition of `fd_type';
/tmp/ccET4A6w.o:/root/sources/selinux-testsuite/tests/binder/binder_common.h:
56: first defined here
/usr/bin/ld: /tmp/ccZwlOfx.o:/root/sources/selinux-testsuite/tests/binder/binder_common.h:57:
multiple definition of `fd_type_str';
/tmp/ccET4A6w.o:/root/sources/selinux-testsuite/tests/binder/binder_commo
n.h:57: first defined here
collect2: error: ld returned 1 exit status

-- 
paul moore
www.paul-moore.com
