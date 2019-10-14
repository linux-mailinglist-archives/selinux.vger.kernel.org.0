Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC13D67C3
	for <lists+selinux@lfdr.de>; Mon, 14 Oct 2019 18:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388056AbfJNQyl (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 14 Oct 2019 12:54:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45162 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388043AbfJNQyl (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 14 Oct 2019 12:54:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id u12so8242832pls.12
        for <selinux@vger.kernel.org>; Mon, 14 Oct 2019 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LYebUPfyNzPvvFP6j5p7uvU8uZK4poYJs3oTBiRKm0g=;
        b=yHO5dTtAuvHOPwCvhm/oWcoY2hcMLNAkmng6d4K3ooyyc8zFnTpjyWc9bK7HKdw1eF
         uhd/5dQxKHkqFVLlVXpfn4EdvctySb+we4N53Caoh1g2VXNi0pMG0qKb3Z8UqTC95VEv
         mxyZBN43b74Lp/RypZ2DXb9hata5FSUyE2Yxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LYebUPfyNzPvvFP6j5p7uvU8uZK4poYJs3oTBiRKm0g=;
        b=eJ5Cq2oMGJTzbl7PPq1I9xd0jO+ect03bxZNZ0Of/Y+S1SAkiVZ10vKWPHvuCW48VV
         67YkDnEgmBug5IegWhcENUC7Kf3LNQwyFo+rSc1Aq7iMXlYIoQFOHOSVNk7UK2KYJVSR
         Sqt9XAD9d3FUEv3epNjJapYbwjDhoOXfOK86YTretCDIrGO+bMPnEfKi1COb9ifMMzBK
         n0ySX0h3JYneLxNLpeTjaYOSxYs3ra+tXQkhSDz+s2bI7sHM/mUN9QyD84mGdr0ZFjoy
         PznMu8GmK7DSVDDzNNrANGB31r5TV3z0LcjX+8TBQbLNGwiHfLzU8SyC5LN6cwSzl6WG
         ucqQ==
X-Gm-Message-State: APjAAAWraL0QcsVZFDaj5/lbQBm3axyUM3I/8dynK5aXgE3mbNlveBka
        d9Ij3RbKNj4JF14KyqNZdRHgSw==
X-Google-Smtp-Source: APXvYqyKVWUXBeWglNde3TqlO343XuFeYMHzVKt0SNBc79A0whQtME9EbjWCNDqvZmCRkvRhU7Yjbw==
X-Received: by 2002:a17:902:a712:: with SMTP id w18mr31527230plq.304.1571072080087;
        Mon, 14 Oct 2019 09:54:40 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id i7sm14063475pjs.1.2019.10.14.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:54:39 -0700 (PDT)
Date:   Mon, 14 Oct 2019 12:54:38 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, rostedt@goodmis.org,
        primiano@google.com, rsavitski@google.com, jeffv@google.com,
        kernel-team@android.com, Alexei Starovoitov <ast@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Ingo Molnar <mingo@redhat.com>,
        James Morris <jmorris@namei.org>, Jiri Olsa <jolsa@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        linux-security-module@vger.kernel.org,
        Matthew Garrett <matthewgarrett@google.com>,
        Namhyung Kim <namhyung@kernel.org>, selinux@vger.kernel.org,
        Song Liu <songliubraving@fb.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Yonghong Song <yhs@fb.com>
Subject: Re: [PATCH] perf_event: Add support for LSM and SELinux checks
Message-ID: <20191014165438.GB105106@google.com>
References: <20191011160330.199604-1-joel@joelfernandes.org>
 <20191014093544.GB2328@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014093544.GB2328@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Mon, Oct 14, 2019 at 11:35:44AM +0200, Peter Zijlstra wrote:
> On Fri, Oct 11, 2019 at 12:03:30PM -0400, Joel Fernandes (Google) wrote:
> 
> > @@ -4761,6 +4762,7 @@ int perf_event_release_kernel(struct perf_event *event)
> >  	}
> >  
> >  no_ctx:
> > +	security_perf_event_free(event);
> >  	put_event(event); /* Must be the 'last' reference */
> >  	return 0;
> >  }
> 
> > @@ -10553,11 +10568,16 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
> >  		}
> >  	}
> >  
> > +	err = security_perf_event_alloc(event);
> > +	if (err)
> > +		goto err_security;
> > +
> >  	/* symmetric to unaccount_event() in _free_event() */
> >  	account_event(event);
> >  
> >  	return event;
> >  
> > +err_security:
> >  err_addr_filters:
> >  	kfree(event->addr_filter_ranges);
> >  
> 
> There's a bunch of problems here I think:
> 
>  - err_security is named wrong; the naming scheme is to name the label
>    after the last thing that succeeded / first thing that needs to be
>    undone.
> 
>  - per that, you're forgetting to undo 'get_callchain_buffers()'

Yes, you're right. Tested your fix below. Sorry to miss this.

>  - perf_event_release_kernel() is not a full match to
>    perf_event_alloc(), inherited events get created by
>    perf_event_alloc() but never pass through
>    perf_event_release_kernel().

Oh, through inherit_event(). Thanks for pointing this semantic out, did not
know that.

> I'm thinking the below patch on top should ammend these issues; please
> verify.

Yes, applied your diff below and verified that the events are getting freed
as they were in my initial set of tests. The diff also looks good to me.

I squashed your diff below and will resend as v3. Since you modified this
patch a lot, I will add your Co-developed-by tag as well.

thanks, Peter!

 - Joel


> ---
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -4540,6 +4540,8 @@ static void _free_event(struct perf_even
>  
>  	unaccount_event(event);
>  
> +	security_perf_event_free(event);
> +
>  	if (event->rb) {
>  		/*
>  		 * Can happen when we close an event with re-directed output.
> @@ -4774,7 +4776,6 @@ int perf_event_release_kernel(struct per
>  	}
>  
>  no_ctx:
> -	security_perf_event_free(event);
>  	put_event(event); /* Must be the 'last' reference */
>  	return 0;
>  }
> @@ -10595,14 +10596,18 @@ perf_event_alloc(struct perf_event_attr
>  
>  	err = security_perf_event_alloc(event);
>  	if (err)
> -		goto err_security;
> +		goto err_callchain_buffer;
>  
>  	/* symmetric to unaccount_event() in _free_event() */
>  	account_event(event);
>  
>  	return event;
>  
> -err_security:
> +err_callchain_buffer:
> +	if (!event->parent) {
> +		if (event->attr.sample_type & PERF_SAMPLE_CALLCHAIN)
> +			put_callchain_buffers();
> +	}
>  err_addr_filters:
>  	kfree(event->addr_filter_ranges);
>  
