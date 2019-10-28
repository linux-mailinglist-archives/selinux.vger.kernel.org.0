Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D450E73C5
	for <lists+selinux@lfdr.de>; Mon, 28 Oct 2019 15:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728898AbfJ1Ogk (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 28 Oct 2019 10:36:40 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:44767 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbfJ1Ogk (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 28 Oct 2019 10:36:40 -0400
Received: by mail-oi1-f175.google.com with SMTP id s71so6030740oih.11
        for <selinux@vger.kernel.org>; Mon, 28 Oct 2019 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dCmyY1o0egbxYfbPP3wjFQXyVH+QV6kGOwg7GDGCtck=;
        b=ILN58YgrY7cugfYgJw0uFmgYYxkI//HeourbUc8XJUiYsGSu75CLnxuE77ld27h/3m
         6dsma0FyrctCoh6PiDXT4dHBPIZrHHNTwXmmh6FhGISFmGASmJBO1iWRO2ih3YK964sr
         b6Aspl24JckoBpdItFtoeU26c0psdK71TAUFAoLRtKa7WXk4SAxrRhEjLxfT7oOZ9cvR
         kVxP4Q4vvYD1Wjgdz9WNJVNoAyZ20V5RR0lG3/RaES580IRjq1LQCMnith1o008UNAuS
         uqzJMUb+Jx6KOUn/+/iHvyhZ9gUt8A9ftiIdl9Oahi5tWoqtr422A5UipUd17q3ruLnX
         ky1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dCmyY1o0egbxYfbPP3wjFQXyVH+QV6kGOwg7GDGCtck=;
        b=Ifj8qVF4Y9PVMUl3/XgkrX8XfAN3UTIlgHX0O5CeuJHmPiyVjYeWNnocrKzm+knCgj
         n5XnhQK7M+8GneyPqKCZPa4YqWtKlfdaXkJcCYtqJQghs/D1B9otmC8I8/+hr69iDAZE
         Vb16oNJmwX+xAZQGCFUvLj0U7kSaP+TRVQchPu6txdSBIHFYfJYbe67OOz4FVjlIUxq1
         mJhSExOklrtSPfM5gqrFjfoFdHImfTve/5absYzTotEfD5afi8MsZzKBBTGsy6EK3psV
         exa5iBVHdXsZj5D9VzqW+yWw5GLYmXBmQ7XNg+ZGDDdSD5aX6zgd8r6YHtAL6EsUOkng
         Nmyg==
X-Gm-Message-State: APjAAAX88NlM8/wV7yH1AuK9YdHDbxff+KZdXrypseLIdsiU7bNj1kTv
        gp6o6Rwm9aiA/0YZjjp3Errm3Z9a
X-Google-Smtp-Source: APXvYqwH1HXgNYxxTt/JPwhi+/t/w5KNbGjamGBQbkj7WSQvQqszlQnjeBnXLvuVQNUYl70rAZmGog==
X-Received: by 2002:aca:7595:: with SMTP id q143mr244516oic.103.1572273398802;
        Mon, 28 Oct 2019 07:36:38 -0700 (PDT)
Received: from ian.penurio.us ([2605:6000:8c8b:a4fa:222:4dff:fe4f:c7ed])
        by smtp.gmail.com with ESMTPSA id x7sm3126529oie.12.2019.10.28.07.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2019 07:36:38 -0700 (PDT)
Subject: Re: Add portcon rule to existing policy module
To:     Nicolas Iooss <nicolas.iooss@m4x.org>
Cc:     SElinux list <selinux@vger.kernel.org>
References: <bded2b55-30eb-e039-19cd-4e834ad5ca28@gmail.com>
 <CAJfZ7==g3ZWQxUnJKiYt1wZrviZYVgqhu5Kaya3ncPvHUZ9o7Q@mail.gmail.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <7e5c3a6c-45af-2c5f-962c-0203a21aacb9@gmail.com>
Date:   Mon, 28 Oct 2019 09:36:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAJfZ7==g3ZWQxUnJKiYt1wZrviZYVgqhu5Kaya3ncPvHUZ9o7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On 10/28/19 5:11 AM, Nicolas Iooss wrote:
> I have not tested whether these statements are supported in policy
> modules other that in the "base" module (if I remember correctly,
> "base" is no longer a special module but there could be things I
> missed). What led you to state that "portcon" rules can only be done
> in CIL? (For example did you encounter an error while building the .pp
> module?)

https://danwalsh.livejournal.com/10607.html
https://www.spinics.net/lists/selinux/msg21663.html

-- 
========================================================================
Ian Pilcher                                         arequipeno@gmail.com
-------- "I grew up before Mark Zuckerberg invented friendship" --------
========================================================================
