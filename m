Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22ADC2334F8
	for <lists+selinux@lfdr.de>; Thu, 30 Jul 2020 17:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgG3PFD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+selinux@lfdr.de>); Thu, 30 Jul 2020 11:05:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729092AbgG3PFD (ORCPT <rfc822;selinux@vger.kernel.org>);
        Thu, 30 Jul 2020 11:05:03 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F5FE2070B;
        Thu, 30 Jul 2020 15:05:01 +0000 (UTC)
Date:   Thu, 30 Jul 2020 11:04:59 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     peter enderborg <peter.enderborg@sony.com>
Cc:     =?UTF-8?B?VGhpw6liYXVk?= Weksteen <tweek@google.com>,
        Paul Moore <paul@paul-moore.com>,
        Nick Kralevich <nnk@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Paris <eparis@parisplace.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <selinux@vger.kernel.org>
Subject: Re: [PATCH] RFC: selinux avc trace
Message-ID: <20200730110459.5bf0b0df@oasis.local.home>
In-Reply-To: <80a23580-5067-93b0-53fa-3bd53253c056@sony.com>
References: <20200724091520.880211-1-tweek@google.com>
        <20200724095232.5f9d3f17@oasis.local.home>
        <80a23580-5067-93b0-53fa-3bd53253c056@sony.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, 30 Jul 2020 16:29:12 +0200
peter enderborg <peter.enderborg@sony.com> wrote:

> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM avc
> +
> +#if !defined(_TRACE_AVC_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_AVC_H
> +
> +#include <linux/tracepoint.h>
> +TRACE_EVENT(avc_data,
> +        TP_PROTO(u32 requested,
> +             u32 denied,
> +             u32 audited,
> +             int result,
> +             const char *msg
> +             ),
> +
> +        TP_ARGS(requested, denied, audited, result,msg),
> +
> +        TP_STRUCT__entry(
> +             __field(u32, requested)
> +             __field(u32, denied)
> +             __field(u32, audited)
> +             __field(int, result)
> +             __array(char, msg, 255)

You want to use __string() here, otherwise you are wasting a lot of
buffer space.

		__string( msg, msg)

> +                 ),
> +
> +        TP_fast_assign(
> +               __entry->requested    = requested;
> +               __entry->denied    = denied;
> +               __entry->audited    = audited;
> +               __entry->result    = result;
> +               memcpy(__entry->msg, msg, 255);

Not to mention, the above is a bug. As the msg being passed in, is
highly unlikely to be 255 bytes. You just leaked all that memory after
the sting to user space.

Where you want here:

		__assign_str( msg, msg );


-- Steve



> +    ),
> +
> +        TP_printk("requested=0x%x denied=%d audited=%d result=%d
> msg=%s",
> +              __entry->requested, __entry->denied, __entry->audited,
> __entry->result, __entry->msg
> +              )
