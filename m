Return-Path: <selinux+bounces-1676-lists+selinux=lfdr.de@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7095950F9C
	for <lists+selinux@lfdr.de>; Wed, 14 Aug 2024 00:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3330128345D
	for <lists+selinux@lfdr.de>; Tue, 13 Aug 2024 22:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D571AB50D;
	Tue, 13 Aug 2024 22:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmuOb7JL"
X-Original-To: selinux@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C201AAE2B
	for <selinux@vger.kernel.org>; Tue, 13 Aug 2024 22:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723587571; cv=none; b=UcIjzqt8XVrYZM0aQQV6r4h36COTAMvnSkWifqsl13q4tCArg9rGEVavwic9n7imIGoz00lQbWlw/ilTYhKh0/QJJRpjgCDR4Zt6SrSzZFeYOJQJMwOBhW61wL/jBiqAzup8ASqNPsBlSE5aC1NSfePOoYwN5IsGrDc/ERX04N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723587571; c=relaxed/simple;
	bh=nUuj1yFQwQctPZyeaZf8ffYlrw7QeFKprNsInQ+jTuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgpcPglcpJsMszeBI28HyYW/K8z89K1CY/nmDJ5KpEOm0DoVIT6LChsoRJZrhYKT9aVlA3Kz08zifnNkUUJ7BSX88EN6AysPt8dVR0XLq88eXzLJYr8e9c2qZU7HZGeG/M5eVyLnzw5fLcpLndxTGCr3j3ThbOwkef9GoDUk/xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XmuOb7JL; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-81f94ce22f2so226518039f.1
        for <selinux@vger.kernel.org>; Tue, 13 Aug 2024 15:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723587569; x=1724192369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QN8X+bBf4e4pg8ECVJmLV7aoGPPE4M9h9y5SfDnco4=;
        b=XmuOb7JLvyzRoKVkigT8zV8uE0biCueUrdLC+6pXN5AjqeaxqAFGWT1hU9rPNRvsDZ
         3fU5eBj4VHgEnvMbyOxDo4SlyF1dqm7T4zhNy+oWaV1J6qezOEKZ865/5a5QD6yf2zSE
         zsQq6zZ31fcYemRtrJa5mxHUIsD3W7QlY7Iahg5D168bjobssTF11yaUpsmZBmKP3QY6
         5ld4bJnVvmBPuUbevyZk00bRd5Lb1Yj1wt/HAHV8cdrDd/44dWqWllW0xGH36kY1+DHb
         i0Jm6spuAdClmzuVQhUe8wMeuVMAO2Cv8iEw7Ie6jVlsxGLfspWZBbVehKyGXuViZ+tw
         x0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723587569; x=1724192369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QN8X+bBf4e4pg8ECVJmLV7aoGPPE4M9h9y5SfDnco4=;
        b=hjdTpBIBgiDQH+qH39mZcLv3FP0zW+UHKbN0qNx9LyB5pkAJ52MY1DJ2gxr2Jnc5V5
         8ZAX971zmAUzXVXxR4UAlOJgBX9gaAqed8vPx45bYbaq76AwhhqPZTxqsCM9yISDwT8l
         nDUnpXUSerIhBtNRB1V9iqixnslwa1B89gEbhmMnxhctQ+J49rWerdQMvoOet/D4fizG
         3P3OUqndyWuZ3TOSOClF/KLDPN9JcQcgi7gCVAC0M9LyYYe0F8Km1o5qWM7TwcGYS0ki
         +TRG9LPPozpqoaklrQ3Q3qpDmJmdqRvdP44FKLXAzyNC2qodIx8Bg206+H2UfFQ83GEC
         L4cw==
X-Forwarded-Encrypted: i=1; AJvYcCWpL3P84NmOJ9vEsXcBnqY0ljjyG+K5WNesPdRhd+vonncD46ryEO06oF6fcYPcBA33wQlhO6It@vger.kernel.org
X-Gm-Message-State: AOJu0YwSr7EakWAVvKfHjuF1yfg17jYjCOfb2JCKjiaGY8tY+MVOqbnd
	VAKPGuDauis7xO+FSWY1/WZjo2Rak21cZSKjv+kFzTtBNXty9Fe6kx05qHwQ0w==
X-Google-Smtp-Source: AGHT+IH+Vc3rvDiFEg5ElrB7bMI7N4hpSdsoFZYx8k23AbxObZpcHIjRmC/uICTdWR81lxtCEKl/zQ==
X-Received: by 2002:a05:6602:27c1:b0:824:d58c:ec9 with SMTP id ca18e2360f4ac-824dad3f48bmr165323439f.10.1723587568538;
        Tue, 13 Aug 2024 15:19:28 -0700 (PDT)
Received: from google.com (194.225.68.34.bc.googleusercontent.com. [34.68.225.194])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ca769f9d7dsm2773101173.118.2024.08.13.15.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 15:19:28 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:19:25 -0700
From: Justin Stitt <justinstitt@google.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
	ebiederm@xmission.com, alexei.starovoitov@gmail.com, rostedt@goodmis.org, 
	catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v6 7/9] tracing: Replace strncpy() with strscpy()
Message-ID: <hbjxkyhugi27mbrj5zo2thfdg2gotz6syz6qoeows6l6qwbzkt@c3yb26z4pn62>
References: <20240812022933.69850-1-laoar.shao@gmail.com>
 <20240812022933.69850-8-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: selinux@vger.kernel.org
List-Id: <selinux.vger.kernel.org>
List-Subscribe: <mailto:selinux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:selinux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812022933.69850-8-laoar.shao@gmail.com>

Hi,

On Mon, Aug 12, 2024 at 10:29:31AM GMT, Yafang Shao wrote:
> Using strscpy() to read the task comm ensures that the name is
> always NUL-terminated, regardless of the source string. This approach also
> facilitates future extensions to the task comm.

Thanks for sending patches replacing str{n}cpy's!

I believe there's at least two more instances of strncpy in trace.c as
well as in trace_events_hist.c (for a grand total of 6 instances in the
files you've touched in this specific patch).

It'd be great if you could replace those instances in this patch as well :>)

This would help greatly with [1].

> 
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/trace/trace.c             | 2 +-
>  kernel/trace/trace_events_hist.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 578a49ff5c32..1b2577f9d734 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -1907,7 +1907,7 @@ __update_max_tr(struct trace_array *tr, struct task_struct *tsk, int cpu)
>  	max_data->critical_start = data->critical_start;
>  	max_data->critical_end = data->critical_end;
>  
> -	strncpy(max_data->comm, tsk->comm, TASK_COMM_LEN);
> +	strscpy(max_data->comm, tsk->comm, TASK_COMM_LEN);

If max_data->comm wants to be NUL-terminated then this is the right
replacement. Without knowing how the trace stack works at all, it's hard
for me to tell if that is the case.

There's a length-supplied format specifier for which this comm field is
used with; Either this is just another safeguard against spilling over
the buffer or this field really doesn't care about NUL-termination.
| seq_printf(m, "#    | task: %.16s-%d "
|       "(uid:%d nice:%ld policy:%ld rt_prio:%ld)\n",
|       data->comm, data->pid,

In the event this field doesn't need to be NUL-terminated then we are
introducing an off-by-one error where we are copying one less useful
byte with strscpy -- Linus pointed out earlier [2] that these things all
just want to be c-strings so this is probably the right change :>)

>  	max_data->pid = tsk->pid;
>  	/*
>  	 * If tsk == current, then use current_uid(), as that does not use
> diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
> index 6ece1308d36a..4cd24c25ce05 100644
> --- a/kernel/trace/trace_events_hist.c
> +++ b/kernel/trace/trace_events_hist.c
> @@ -1599,7 +1599,7 @@ static inline void save_comm(char *comm, struct task_struct *task)
>  		return;
>  	}
>  
> -	strncpy(comm, task->comm, TASK_COMM_LEN);
> +	strscpy(comm, task->comm, TASK_COMM_LEN);
>  }
>  
>  static void hist_elt_data_free(struct hist_elt_data *elt_data)
> -- 
> 2.43.5
> 

Link: https://github.com/KSPP/linux/issues/90 [1]
Link: https://lore.kernel.org/all/CAHk-=whWtUC-AjmGJveAETKOMeMFSTwKwu99v7+b6AyHMmaDFA@mail.gmail.com/ [2]

Thanks
Justin

