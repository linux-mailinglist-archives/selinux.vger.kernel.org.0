Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0FC217E1BE
	for <lists+selinux@lfdr.de>; Mon,  9 Mar 2020 14:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgCIN4z (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 9 Mar 2020 09:56:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37281 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgCIN4z (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 9 Mar 2020 09:56:55 -0400
Received: by mail-ot1-f65.google.com with SMTP id b3so9610922otp.4
        for <selinux@vger.kernel.org>; Mon, 09 Mar 2020 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9z+IiuRZTrGIssf2m8frhmfRojqQuNab/ASrhBUnMek=;
        b=JvjYkboOPGVxfYprfFxaaIGukupbbtxADZpV1dlwJvZYB5jSpnmayOImhGW8hso8Zo
         BCIqVKQjeYen/4UeVG3LLpKn4DDLuDBg5GZSQaMQFI651E4nEuj+gXBGFkWku1Fpeiee
         C7pgJCwMdRFaglX8fd2MZWbg5CB7bxYVVQeJVnp8v6Uxlw7hCZBSN9fxQMESPAruVIeS
         UqALtM0paqgGbQpDCIIK/1OnKPq0NYKeJWOgKf4paDQebt4J3fFuRMdSbbRElaB9uWvk
         oFU6kfPjeCKh9T0ddR3Bk0t8GaFB5CBCbvtkpMmDme1uWNNKhRK7XhhOiEoZi5FbskTF
         ruPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9z+IiuRZTrGIssf2m8frhmfRojqQuNab/ASrhBUnMek=;
        b=jlQ+QMKClKDSS1w8gQEI1KT6up5TrgM3GcjLIH4OcqcAoJfQsFxcDxqSmsJdZOzz2u
         KjYN2Mpr7jScOm9BqfTijI5gKBhFMuNUnJUKMgRpihl/RPUZNB10Ug/DD/V9uYH/hZ9J
         awpDXMkq2MbluGLuoYri6hPBsxfZSzVDWGmwCSD2VtBoY/ynzTWJLOCU+n/6PdWKBgG3
         S/ZRHuIf3fVjK67ZznAYyh9rOeQdPnV2UhWXDZY+4uUzI9kgOtf6JAiS/YD5v8NV8cx/
         baRWdIxF7G6V5wrNW7biTZNqIZn2NoC3HDGTgrjFRTCWciD65pzpNvcNNWmHHoaTD55G
         hqQQ==
X-Gm-Message-State: ANhLgQ2tGLwdsHL8t+8uVWugNAnIvMhjfeG5440RWq4GEU+yggFo/UrT
        n0Y+Yob0v1W+qTEf9NbszTWHHKqSg3zwEbyykcbElg==
X-Google-Smtp-Source: ADFU+vt0JRuxPVQYADHMig0cs8l7trF/VEXkJ60awQOdy/He9ve81FYlrstCZHFV6ujddAGc+UzzbYpy//2KpbbjmE4=
X-Received: by 2002:a9d:67c3:: with SMTP id c3mr4748514otn.340.1583762214700;
 Mon, 09 Mar 2020 06:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200305184034.165554-1-dburgener@linux.microsoft.com>
In-Reply-To: <20200305184034.165554-1-dburgener@linux.microsoft.com>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Mon, 9 Mar 2020 09:58:31 -0400
Message-ID: <CAEjxPJ6gTLzW451DKHhiSaRRUyx-E=ov_meKnHv1j_U7TykHTA@mail.gmail.com>
Subject: Re: [PATCH] checkpolicy: Add --werror flag to checkmodule and
 checkpolicy to treat warnings as errors.
To:     Daniel Burgener <dburgener@linux.microsoft.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Mar 5, 2020 at 1:40 PM Daniel Burgener
<dburgener@linux.microsoft.com> wrote:
>
> When the lexer encounters an unexpected character in a policy source file=
, it prints a warning, discards the character and moves on.  In some build =
environments, these characters could be a symptom of an earlier problem, su=
ch as unintended results of expansion of preprocessor macros, and the abili=
ty to have the compiler halt on such issues would be helpful for diagnosis.
>
> Signed-off-by: Daniel Burgener <Daniel.Burgener@microsoft.com>

Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
