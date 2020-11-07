Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968C92AA4D4
	for <lists+selinux@lfdr.de>; Sat,  7 Nov 2020 12:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgKGL5M (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Sat, 7 Nov 2020 06:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgKGL5M (ORCPT
        <rfc822;selinux@vger.kernel.org>); Sat, 7 Nov 2020 06:57:12 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059C2C0613CF
        for <selinux@vger.kernel.org>; Sat,  7 Nov 2020 03:57:11 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id x7so3961555wrl.3
        for <selinux@vger.kernel.org>; Sat, 07 Nov 2020 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=eBa2TpTCKUW9R1L9QkDr0B8phYMbrlIkb9o8PiVmZlc=;
        b=Mok9tTOH2FMdQySe85GY1LTZDKlY3PfUt8w0k5hpKm3o0L47CdAUFtzIeI2m7SG9hJ
         VvxpFAUc6C1SlW2jSaSDbwnyB/sH4cJswsYuLEzYiZc6dcUSv/kQbYtNPsG3xghTe252
         j3kJI4N1UY8TRTNIxs8Eiar11zlNPuDZktoO2GINw0XjJE2zXlyXEsZTjiwD5nlY/3mS
         DQUhUj0UDLbJTe6zQhcuE0CPE/5zMzbIpDhHa68tkhAGgJ1nq2wYYZwA2GN+ZwZUEzGY
         ICz/VQB0eMp7rWBCnOv+33mTQyHwqXnZhJtdgDR6Jt8JDLClELAuoZ8RJ0LYu4vOhRK0
         R8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=eBa2TpTCKUW9R1L9QkDr0B8phYMbrlIkb9o8PiVmZlc=;
        b=jbTMAggWCnxnRjfECwUdSQ6upPXdkJfcnDce4AwdJkT6SiESwlC+/wHsBaA1QTnzo5
         y8Ta5V4VtahX45ktBI4slaJ0vhFthaIfD8oT+Ho/fJKTvpH9y8OP9Fz1DZuLsy3exsbe
         Iqcag5G0Abwm7eutqhF9BsIWcf89etQ4i3tbIrNAyPcosyte0VtH/xwtrKkKtxOUXuy6
         XdGAE7rVM41W0sFSKzw8A2BhN8khfTW+nmxRn1ja0OAZNDSfKyl3G2lgMIm0YIBQGezp
         7naJM44Vuv23715pqdeK91r9wSnVGYq9JrMdr2Db0ppHFJTjvA6KH1DK0Ry59xyL16S8
         imKw==
X-Gm-Message-State: AOAM533cRLKjJzh1Pnv9V5OIePZLx9OlJPCxttJi6iznDzJhVzLqFzL/
        PtL9Cp89huUDKRPazczhfe1VdN3NhChaBBYucQjWBhREgsS9vg==
X-Google-Smtp-Source: ABdhPJw008i6V3m7k0+2aaPwbZfLqqHXX4jR6NG39mfTrRiqIMdlgl969zxTGR1o9WetaAMZFr8o1stKc9qGngOXTxY=
X-Received: by 2002:adf:ce01:: with SMTP id p1mr7165233wrn.33.1604750230310;
 Sat, 07 Nov 2020 03:57:10 -0800 (PST)
MIME-Version: 1.0
From:   Ashish Mishra <ashishm@mvista.com>
Date:   Sat, 7 Nov 2020 17:26:59 +0530
Message-ID: <CAP2Ojcgr2NkjZxL3_Fcu2Tj00ahCOqvx+i0qzn2mcsrNE-iFrA@mail.gmail.com>
Subject: Inputs for error " libselinux.so.1: cannot open shared object file:
 No such file or directory "
To:     SElinux list <selinux@vger.kernel.org>, paul@paul-moore.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

Hi Senior Member's  ,

I am trying to get the SELINUX on one of our evaluation boards (MIPS based).
The SDK running is custom makefile based & kernel is linux-4.9 series.

1) To get the selinux , i have enabled the kernel configuration w.r.t SELINUX
     I can see the entry created under /sys folder
            ~ # ls /sys/fs/selinux/

2) But when i run command of selinux  like selinuxenabled , i am getting
     Error message of :
     selinuxenabled: error while loading shared libraries:
libselinux.so.1: cannot open shared object file: No such file or
directory

     But i can see the library at /lib folder
          ~ # find / -name libselinux
          ~ # find / -name 'libselinux*'
                    /lib/libselinux.so
                    /lib/libselinux.so.1

Can members please provide any input as to which package is missing
here or probable areas to look to solve the problem.
Idea was to build a selinux setup

Thanks ,
Ashish
