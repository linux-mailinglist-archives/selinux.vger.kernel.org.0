Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFC8380C9D
	for <lists+selinux@lfdr.de>; Fri, 14 May 2021 17:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhENPOA (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 14 May 2021 11:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55189 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233476AbhENPN7 (ORCPT
        <rfc822;selinux@vger.kernel.org>); Fri, 14 May 2021 11:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621005167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AkHME70kHapakIw7CRgJRPOWZzglf6T+F1wcWtPMY7A=;
        b=cBTNA0qekuLpjT034gEw52g0AcPxGzu9qmCZYuI7q963nwiCuZHco/E3fBH1VExLmZT+0A
        UYXqLBDVMYRMbxGtk5oiyDed48nlyf6m6qeuJANdg3j6hv1vq9IWATYvQ7EojiJKYJsfQc
        FN6w8vd/omSyH3+NBcddtmghoNe1RI8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-GIsSCizqMTCy_OFcLHrRZw-1; Fri, 14 May 2021 11:12:45 -0400
X-MC-Unique: GIsSCizqMTCy_OFcLHrRZw-1
Received: by mail-yb1-f200.google.com with SMTP id w80-20020a25df530000b02904f953b5241bso11462443ybg.18
        for <selinux@vger.kernel.org>; Fri, 14 May 2021 08:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AkHME70kHapakIw7CRgJRPOWZzglf6T+F1wcWtPMY7A=;
        b=I8AMLlL29cXkePYnnT0fAqn3Kf5ExyZdGnHlCyYQWB7RocGCrNADCF86wO7Y2bpv3E
         7+2NchvpV60M99lQgPKLefa3Bk7vzgr/XOc/gB1rsSHIf9QOj58ZDQH3nYEEVRZavNbT
         SYkmRMJ+UVYqz7fY/s2xkVmGiRA2iETgNRT63zaj/zq5+56q+3DNG1mRoJrJ9sH+HNHj
         FtRBkVLY3U2cjAP8iBD7Gn/hi21tw/eOsAz4ZfaE28LFTq709KvNsNjoyXZkYYQLJFqM
         wjIZ9MZzMf5EtFL6nDnYL/k6rwtExJdiEVyZaPClwrwjIhdDLxCIiTxAi9K9Z0azLLe7
         oD3Q==
X-Gm-Message-State: AOAM531uGjWiWcbvG3fbEI1kd5WaUSukvo/q1LNlZx6ycbxi0l2dIsiU
        AfdwHjRW4vsaxoclVUlLcEAktMKJCIQmBn6Es/28xU03ZsaquYfwRkx4ROAWp+gxVgRUUAe4qLg
        CUyqhdgA4KQvytYr9C3SArYbbXH2VqmmyDw==
X-Received: by 2002:a25:ac8:: with SMTP id 191mr25315346ybk.340.1621005164882;
        Fri, 14 May 2021 08:12:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL1mXJ7d9HtSJrVleCUkPJqNWN1MdEFCe2c0AgTo7ju6c1V+5y2225Y5Rl8Es0Bx2mLBfC0ZdbM3YgvlXFEnc=
X-Received: by 2002:a25:ac8:: with SMTP id 191mr25315294ybk.340.1621005164543;
 Fri, 14 May 2021 08:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210507114048.138933-1-omosnace@redhat.com> <a8d138a6-1d34-1457-9266-4abeddb6fdba@schaufler-ca.com>
 <CAFqZXNtr1YjzRg7fTm+j=0oZF+7C5xEu5J0mCZynP-dgEzvyUg@mail.gmail.com>
 <24a61ff1-e415-adf8-17e8-d212364d4b97@schaufler-ca.com> <CAFqZXNvB-EyPz1Qz3cCRTr1u1+D+xT-dp7cUxFocYM1AOYSuxw@mail.gmail.com>
 <e8d60664-c7ad-61de-bece-8ab3316f77bc@schaufler-ca.com>
In-Reply-To: <e8d60664-c7ad-61de-bece-8ab3316f77bc@schaufler-ca.com>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Fri, 14 May 2021 17:12:31 +0200
Message-ID: <CAFqZXNu_DW1FgnVvtA+CnBMtdRDrzYo5B3_=SzKV7-o1CaV0RA@mail.gmail.com>
Subject: Re: [PATCH] lockdown,selinux: fix bogus SELinux lockdown permission checks
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        James Morris <jmorris@namei.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        SElinux list <selinux@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>, network dev <netdev@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000003f45805c24badf9"
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

--00000000000003f45805c24badf9
Content-Type: text/plain; charset="UTF-8"

On Wed, May 12, 2021 at 7:12 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> On 5/12/2021 9:44 AM, Ondrej Mosnacek wrote:
> > On Wed, May 12, 2021 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 5/12/2021 6:21 AM, Ondrej Mosnacek wrote:
> >>> On Sat, May 8, 2021 at 12:17 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>> On 5/7/2021 4:40 AM, Ondrej Mosnacek wrote:
> >>>>> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
> >>>>> lockdown") added an implementation of the locked_down LSM hook to
> >>>>> SELinux, with the aim to restrict which domains are allowed to perform
> >>>>> operations that would breach lockdown.
> >>>>>
> >>>>> However, in several places the security_locked_down() hook is called in
> >>>>> situations where the current task isn't doing any action that would
> >>>>> directly breach lockdown, leading to SELinux checks that are basically
> >>>>> bogus.
> >>>>>
> >>>>> Since in most of these situations converting the callers such that
> >>>>> security_locked_down() is called in a context where the current task
> >>>>> would be meaningful for SELinux is impossible or very non-trivial (and
> >>>>> could lead to TOCTOU issues for the classic Lockdown LSM
> >>>>> implementation), fix this by adding a separate hook
> >>>>> security_locked_down_globally()
> >>>> This is a poor solution to the stated problem. Rather than adding
> >>>> a new hook you should add the task as a parameter to the existing hook
> >>>> and let the security modules do as they will based on its value.
> >>>> If the caller does not have an appropriate task it should pass NULL.
> >>>> The lockdown LSM can ignore the task value and SELinux can make its
> >>>> own decision based on the task value passed.
> >>> The problem with that approach is that all callers would then need to
> >>> be updated and I intended to keep the patch small as I'd like it to go
> >>> to stable kernels as well.
> >>>
> >>> But it does seem to be a better long-term solution - would it work for
> >>> you (and whichever maintainer would be taking the patch(es)) if I just
> >>> added another patch that refactors it to use the task parameter?
> >> I can't figure out what you're suggesting. Are you saying that you
> >> want to add a new hook *and* add the task parameter?
> > No, just to keep this patch as-is (and let it go to stable in this
> > form) and post another (non-stable) patch on top of it that undoes the
> > new hook and re-implements the fix using your suggestion. (Yeah, it'll
> > look weird, but I'm not sure how better to handle such situation - I'm
> > open to doing it whatever different way the maintainers prefer.)
>
> James gets to make the call on this one. If it was my call I would
> tell you to make the task parameter change and accept the backport
> pain. I think that as a security developer community we spend way too
> much time and effort trying to avoid being noticed in source trees.

Hm... actually, what about this attached patch? It switches to a
single hook with a cred argument (I figured cred makes more sense than
task_struct, since the rest of task_struct should be irrelevant for
the LSM, anyway...) right from the start and keeps the original
security_locked_down() function only as a simple wrapper around the
main hook.

At that point I think converting the other callers to call
security_cred_locked_down() directly isn't really worth it, since the
resulting calls would just be more verbose without much benefit. So
I'm tempted to just leave the security_locked_down() helper as is, so
that the more common pattern can be still achieved with a simpler
call.

What do you think?

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

--00000000000003f45805c24badf9
Content-Type: application/x-patch; 
	name="0001-lockdown-selinux-avoid-bogus-SELinux-lockdown-permis.patch"
Content-Disposition: attachment; 
	filename="0001-lockdown-selinux-avoid-bogus-SELinux-lockdown-permis.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kooaquuh0>
X-Attachment-Id: f_kooaquuh0

RnJvbSA3OTJhMTMxYTU2MTk0NTBiYWJmNjM2YzdkZGIyOTkyMWUwNzFmMmExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbmRyZWogTW9zbmFjZWsgPG9tb3NuYWNlQHJlZGhhdC5jb20+
CkRhdGU6IFR1ZSwgNCBNYXkgMjAyMSAxNDo0MzowMSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGxv
Y2tkb3duLHNlbGludXg6IGF2b2lkIGJvZ3VzIFNFTGludXggbG9ja2Rvd24gcGVybWlzc2lvbgog
Y2hlY2tzCgpDb21taXQgNTk0MzhiNDY0NzFhICgic2VjdXJpdHksbG9ja2Rvd24sc2VsaW51eDog
aW1wbGVtZW50IFNFTGludXgKbG9ja2Rvd24iKSBhZGRlZCBhbiBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUgbG9ja2VkX2Rvd24gTFNNIGhvb2sgdG8KU0VMaW51eCwgd2l0aCB0aGUgYWltIHRvIHJlc3Ry
aWN0IHdoaWNoIGRvbWFpbnMgYXJlIGFsbG93ZWQgdG8gcGVyZm9ybQpvcGVyYXRpb25zIHRoYXQg
d291bGQgYnJlYWNoIGxvY2tkb3duLgoKSG93ZXZlciwgaW4gc2V2ZXJhbCBwbGFjZXMgdGhlIHNl
Y3VyaXR5X2xvY2tlZF9kb3duKCkgaG9vayBpcyBjYWxsZWQgaW4Kc2l0dWF0aW9ucyB3aGVyZSB0
aGUgY3VycmVudCB0YXNrIGlzbid0IGRvaW5nIGFueSBhY3Rpb24gdGhhdCB3b3VsZApkaXJlY3Rs
eSBicmVhY2ggbG9ja2Rvd24sIGxlYWRpbmcgdG8gU0VMaW51eCBjaGVja3MgdGhhdCBhcmUgYmFz
aWNhbGx5CmJvZ3VzLgoKU2luY2UgaW4gbW9zdCBvZiB0aGVzZSBzaXR1YXRpb25zIGNvbnZlcnRp
bmcgdGhlIGNhbGxlcnMgc3VjaCB0aGF0CnNlY3VyaXR5X2xvY2tlZF9kb3duKCkgaXMgY2FsbGVk
IGluIGEgY29udGV4dCB3aGVyZSB0aGUgY3VycmVudCB0YXNrCndvdWxkIGJlIG1lYW5pbmdmdWwg
Zm9yIFNFTGludXggaXMgaW1wb3NzaWJsZSBvciB2ZXJ5IG5vbi10cml2aWFsIChhbmQKY291bGQg
bGVhZCB0byBUT0NUT1UgaXNzdWVzIGZvciB0aGUgY2xhc3NpYyBMb2NrZG93biBMU00KaW1wbGVt
ZW50YXRpb24pLCBmaXggdGhpcyBieSBtb2RpZnlpbmcgdGhlIGhvb2sgdG8gYWNjZXB0IGEgc3Ry
dWN0IGNyZWQKcG9pbnRlciBhcyBhcmd1bWVudCwgd2hlcmUgTlVMTCB3aWxsIGJlIGludGVycHJl
dGVkIGFzIGEgcmVxdWVzdCBmb3IgYQoiZ2xvYmFsIiwgdGFzay1pbmRlcGVuZGVudCBsb2NrZG93
biBkZWNpc2lvbiBvbmx5LiBUaGVuIG1vZGlmeSBTRUxpbnV4CnRvIGlnbm9yZSBjYWxscyB3aXRo
IGNyZWQgPT0gTlVMTC4KClNpbmNlIG1vc3QgY2FsbGVycyB3aWxsIGp1c3Qgd2FudCB0byBwYXNz
IGN1cnJlbnRfY3JlZCgpIGFzIHRoZSBjcmVkCnBhcmFtZXRlciwgcmVuYW1lIHRoZSBob29rIHRv
IHNlY3VyaXR5X2NyZWRfbG9ja2VkX2Rvd24oKSBhbmQgcHJvdmlkZQp0aGUgb3JpZ2luYWwgc2Vj
dXJpdHlfbG9ja2VkX2Rvd24oKSBmdW5jdGlvbiBhcyBhIHNpbXBsZSB3cmFwcGVyIGFyb3VuZAp0
aGUgbmV3IGhvb2suCgpUaGUgY2FsbGVycyBtaWdyYXRlZCB0byB0aGUgbmV3IGhvb2ssIHBhc3Np
bmcgTlVMTCBhcyBjcmVkOgoxLiBhcmNoL3Bvd2VycGMveG1vbi94bW9uLmMKICAgICBIZXJlIHRo
ZSBob29rIHNlZW1zIHRvIGJlIGNhbGxlZCBmcm9tIG5vbi10YXNrIGNvbnRleHQgYW5kIGlzIG9u
bHkKICAgICB1c2VkIGZvciByZWRhY3Rpbmcgc29tZSBzZW5zaXRpdmUgdmFsdWVzIGZyb20gb3V0
cHV0IHNlbnQgdG8KICAgICB1c2Vyc3BhY2UuCjIuIGZzL3RyYWNlZnMvaW5vZGUuYzp0cmFjZWZz
X2NyZWF0ZV9maWxlKCkKICAgICBIZXJlIHRoZSBjYWxsIGlzIHVzZWQgdG8gcHJldmVudCBjcmVh
dGluZyBuZXcgdHJhY2VmcyBlbnRyaWVzIHdoZW4KICAgICB0aGUga2VybmVsIGlzIGxvY2tlZCBk
b3duLiBBc3N1bWVzIHRoYXQgbG9ja2luZyBkb3duIGlzIG9uZS13YXkgLQogICAgIGkuZS4gaWYg
dGhlIGhvb2sgcmV0dXJucyBub24temVybyBvbmNlLCBpdCB3aWxsIG5ldmVyIHJldHVybiB6ZXJv
CiAgICAgYWdhaW4sIHRodXMgbm8gcG9pbnQgaW4gY3JlYXRpbmcgdGhlc2UgZmlsZXMuCjMuIGtl
cm5lbC90cmFjZS9icGZfdHJhY2UuYzpicGZfcHJvYmVfcmVhZF9rZXJuZWx7LF9zdHJ9X2NvbW1v
bigpCiAgICAgQ2FsbGVkIHdoZW4gYSBCUEYgcHJvZ3JhbSBjYWxscyBhIGhlbHBlciB0aGF0IGNv
dWxkIGxlYWsga2VybmVsCiAgICAgbWVtb3J5LiBUaGUgdGFzayBjb250ZXh0IGlzIG5vdCByZWxl
dmFudCBoZXJlLCBzaW5jZSB0aGUgcHJvZ3JhbQogICAgIG1heSB2ZXJ5IHdlbGwgYmUgcnVuIGlu
IHRoZSBjb250ZXh0IG9mIGEgZGlmZmVyZW50IHRhc2sgdGhhbiB0aGUKICAgICBjb25zdW1lciBv
ZiB0aGUgZGF0YS4KICAgICBTZWU6IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1
Zy5jZ2k/aWQ9MTk1NTU4NQo0LiBuZXQveGZybS94ZnJtX3VzZXIuYzpjb3B5X3RvX3VzZXJfKigp
CiAgICAgSGVyZSBhIGNyeXB0b2dyYXBoaWMgc2VjcmV0IGlzIHJlZGFjdGVkIGJhc2VkIG9uIHRo
ZSB2YWx1ZSByZXR1cm5lZAogICAgIGZyb20gdGhlIGhvb2suIFRoZXJlIGFyZSB0d28gcG9zc2li
bGUgYWN0aW9ucyB0aGF0IG1heSBsZWFkIGhlcmU6CiAgICAgYSkgQSBuZXRsaW5rIG1lc3NhZ2Ug
WEZSTV9NU0dfR0VUU0Egd2l0aCBOTE1fRl9EVU1QIHNldCAtIGhlcmUgdGhlCiAgICAgICAgdGFz
ayBjb250ZXh0IGlzIHJlbGV2YW50LCBzaW5jZSB0aGUgZHVtcGVkIGRhdGEgaXMgc2VudCBiYWNr
IHRvCiAgICAgICAgdGhlIGN1cnJlbnQgdGFzay4KICAgICBiKSBXaGVuIGRlbGV0aW5nIGFuIFNB
IHZpYSBYRlJNX01TR19ERUxTQSwgdGhlIGR1bXBlZCBTQXMgYXJlCiAgICAgICAgYnJvYWRjYXN0
ZWQgdG8gdGFza3Mgc3Vic2NyaWJlZCB0byBYRlJNIGV2ZW50cyAtIGhlcmUgdGhlCiAgICAgICAg
U0VMaW51eCBjaGVjayBpcyBub3QgbWVuaW5nZnVsIGFzIHRoZSBjdXJyZW50IHRhc2sncyBjcmVk
cyBkbwogICAgICAgIG5vdCByZXByZXNlbnQgdGhlIHRhc2tzIHRoYXQgY291bGQgcG90ZW50aWFs
bHkgc2VlIHRoZSBzZWNyZXQuCiAgICAgSXQgcmVhbGx5IGRvZXNuJ3Qgc2VlbSB3b3J0aCBpdCB0
byB0cnkgdG8gcHJlc2VydmUgdGhlIGNoZWNrIGluIHRoZQogICAgIGEpIGNhc2UsIHNpbmNlIHRo
ZSBldmVudHVhbCBsZWFrIGNhbiBiZSBjaXJjdW12ZW50ZWQgYW55d2F5IHZpYSBiKSwKICAgICBw
bHVzIHRoZXJlIGlzIG5vIHdheSBmb3IgdGhlIHRhc2sgdG8gaW5kaWNhdGUgdGhhdCBpdCBkb2Vz
bid0IGNhcmUKICAgICBhYm91dCB0aGUgYWN0dWFsIGtleSB2YWx1ZSwgc28gdGhlIGNoZWNrIGNv
dWxkIGdlbmVyYXRlIGEgbG90IG9mCiAgICAgbm9pc2UuCgpJbXByb3ZlbWVudHMtc3VnZ2VzdGVk
LWJ5OiBDYXNleSBTY2hhdWZsZXIgPGNhc2V5QHNjaGF1Zmxlci1jYS5jb20+CkZpeGVzOiA1OTQz
OGI0NjQ3MWEgKCJzZWN1cml0eSxsb2NrZG93bixzZWxpbnV4OiBpbXBsZW1lbnQgU0VMaW51eCBs
b2NrZG93biIpClNpZ25lZC1vZmYtYnk6IE9uZHJlaiBNb3NuYWNlayA8b21vc25hY2VAcmVkaGF0
LmNvbT4KLS0tCiBhcmNoL3Bvd2VycGMveG1vbi94bW9uLmMgICAgICB8ICA0ICsrLS0KIGZzL3Ry
YWNlZnMvaW5vZGUuYyAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvbGludXgvbHNtX2hvb2tf
ZGVmcy5oIHwgIDMgKystCiBpbmNsdWRlL2xpbnV4L2xzbV9ob29rcy5oICAgICB8ICAzICsrLQog
aW5jbHVkZS9saW51eC9zZWN1cml0eS5oICAgICAgfCAxMSArKysrKysrKy0tLQoga2VybmVsL3Ry
YWNlL2JwZl90cmFjZS5jICAgICAgfCAgNCArKy0tCiBuZXQveGZybS94ZnJtX3VzZXIuYyAgICAg
ICAgICB8ICAyICstCiBzZWN1cml0eS9sb2NrZG93bi9sb2NrZG93bi5jICB8ICA1ICsrKy0tCiBz
ZWN1cml0eS9zZWN1cml0eS5jICAgICAgICAgICB8ICA2ICsrKy0tLQogc2VjdXJpdHkvc2VsaW51
eC9ob29rcy5jICAgICAgfCAxMiArKysrKysrKystLS0KIDEwIGZpbGVzIGNoYW5nZWQsIDMzIGlu
c2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy94
bW9uL3htb24uYyBiL2FyY2gvcG93ZXJwYy94bW9uL3htb24uYwppbmRleCAzZmUzNzQ5NWY2M2Qu
LmFlMzdjNDU5OGFhNCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL3htb24veG1vbi5jCisrKyBi
L2FyY2gvcG93ZXJwYy94bW9uL3htb24uYwpAQCAtMjk4LDcgKzI5OCw3IEBAIHN0YXRpYyBib29s
IHhtb25faXNfbG9ja2VkX2Rvd24odm9pZCkKIAlzdGF0aWMgYm9vbCBsb2NrZG93bjsKIAogCWlm
ICghbG9ja2Rvd24pIHsKLQkJbG9ja2Rvd24gPSAhIXNlY3VyaXR5X2xvY2tlZF9kb3duKExPQ0tE
T1dOX1hNT05fUlcpOworCQlsb2NrZG93biA9ICEhc2VjdXJpdHlfY3JlZF9sb2NrZWRfZG93bihO
VUxMLCBMT0NLRE9XTl9YTU9OX1JXKTsKIAkJaWYgKGxvY2tkb3duKSB7CiAJCQlwcmludGYoInht
b246IERpc2FibGVkIGR1ZSB0byBrZXJuZWwgbG9ja2Rvd25cbiIpOwogCQkJeG1vbl9pc19ybyA9
IHRydWU7CkBAIC0zMDYsNyArMzA2LDcgQEAgc3RhdGljIGJvb2wgeG1vbl9pc19sb2NrZWRfZG93
bih2b2lkKQogCX0KIAogCWlmICgheG1vbl9pc19ybykgewotCQl4bW9uX2lzX3JvID0gISFzZWN1
cml0eV9sb2NrZWRfZG93bihMT0NLRE9XTl9YTU9OX1dSKTsKKwkJeG1vbl9pc19ybyA9ICEhc2Vj
dXJpdHlfY3JlZF9sb2NrZWRfZG93bihOVUxMLCBMT0NLRE9XTl9YTU9OX1dSKTsKIAkJaWYgKHht
b25faXNfcm8pCiAJCQlwcmludGYoInhtb246IFJlYWQtb25seSBkdWUgdG8ga2VybmVsIGxvY2tk
b3duXG4iKTsKIAl9CmRpZmYgLS1naXQgYS9mcy90cmFjZWZzL2lub2RlLmMgYi9mcy90cmFjZWZz
L2lub2RlLmMKaW5kZXggNGI4M2NiZGVkNTU5Li5lMzliOWMyOTQ5ZDIgMTAwNjQ0Ci0tLSBhL2Zz
L3RyYWNlZnMvaW5vZGUuYworKysgYi9mcy90cmFjZWZzL2lub2RlLmMKQEAgLTM5Niw3ICszOTYs
NyBAQCBzdHJ1Y3QgZGVudHJ5ICp0cmFjZWZzX2NyZWF0ZV9maWxlKGNvbnN0IGNoYXIgKm5hbWUs
IHVtb2RlX3QgbW9kZSwKIAlzdHJ1Y3QgZGVudHJ5ICpkZW50cnk7CiAJc3RydWN0IGlub2RlICpp
bm9kZTsKIAotCWlmIChzZWN1cml0eV9sb2NrZWRfZG93bihMT0NLRE9XTl9UUkFDRUZTKSkKKwlp
ZiAoc2VjdXJpdHlfY3JlZF9sb2NrZWRfZG93bihOVUxMLCBMT0NLRE9XTl9UUkFDRUZTKSkKIAkJ
cmV0dXJuIE5VTEw7CiAKIAlpZiAoIShtb2RlICYgU19JRk1UKSkKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbHNtX2hvb2tfZGVmcy5oIGIvaW5jbHVkZS9saW51eC9sc21faG9va19kZWZzLmgK
aW5kZXggNjFmMDRmN2RjMWE0Li5hMTdjZDhlZTdhOGQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGlu
dXgvbHNtX2hvb2tfZGVmcy5oCisrKyBiL2luY2x1ZGUvbGludXgvbHNtX2hvb2tfZGVmcy5oCkBA
IC0zOTMsNyArMzkzLDggQEAgTFNNX0hPT0soaW50LCAwLCBicGZfcHJvZ19hbGxvY19zZWN1cml0
eSwgc3RydWN0IGJwZl9wcm9nX2F1eCAqYXV4KQogTFNNX0hPT0sodm9pZCwgTFNNX1JFVF9WT0lE
LCBicGZfcHJvZ19mcmVlX3NlY3VyaXR5LCBzdHJ1Y3QgYnBmX3Byb2dfYXV4ICphdXgpCiAjZW5k
aWYgLyogQ09ORklHX0JQRl9TWVNDQUxMICovCiAKLUxTTV9IT09LKGludCwgMCwgbG9ja2VkX2Rv
d24sIGVudW0gbG9ja2Rvd25fcmVhc29uIHdoYXQpCitMU01fSE9PSyhpbnQsIDAsIGNyZWRfbG9j
a2VkX2Rvd24sIGNvbnN0IHN0cnVjdCBjcmVkICpjcmVkLAorCSBlbnVtIGxvY2tkb3duX3JlYXNv
biB3aGF0KQogCiAjaWZkZWYgQ09ORklHX1BFUkZfRVZFTlRTCiBMU01fSE9PSyhpbnQsIDAsIHBl
cmZfZXZlbnRfb3Blbiwgc3RydWN0IHBlcmZfZXZlbnRfYXR0ciAqYXR0ciwgaW50IHR5cGUpCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2xzbV9ob29rcy5oIGIvaW5jbHVkZS9saW51eC9sc21f
aG9va3MuaAppbmRleCBiYTJjY2Q5NTA4MzMuLmYzY2Q4MmU0ZjBmYSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9sc21faG9va3MuaAorKysgYi9pbmNsdWRlL2xpbnV4L2xzbV9ob29rcy5oCkBA
IC0xNTM2LDEwICsxNTM2LDExIEBACiAgKiBAYnBmX3Byb2dfZnJlZV9zZWN1cml0eToKICAqCUNs
ZWFuIHVwIHRoZSBzZWN1cml0eSBpbmZvcm1hdGlvbiBzdG9yZWQgaW5zaWRlIGJwZiBwcm9nLgog
ICoKLSAqIEBsb2NrZWRfZG93bjoKKyAqIEBjcmVkX2xvY2tlZF9kb3duOgogICogICAgIERldGVy
bWluZSB3aGV0aGVyIGEga2VybmVsIGZlYXR1cmUgdGhhdCBwb3RlbnRpYWxseSBlbmFibGVzIGFy
Yml0cmFyeQogICogICAgIGNvZGUgZXhlY3V0aW9uIGluIGtlcm5lbCBzcGFjZSBzaG91bGQgYmUg
cGVybWl0dGVkLgogICoKKyAqICAgICBAY3JlZDogY3JlZGVudGlhbCBhc29jaWF0ZWQgd2l0aCB0
aGUgb3BlcmF0aW9uLCBvciBOVUxMIGlmIG5vdCBhcHBsaWNhYmxlCiAgKiAgICAgQHdoYXQ6IGtl
cm5lbCBmZWF0dXJlIGJlaW5nIGFjY2Vzc2VkCiAgKgogICogU2VjdXJpdHkgaG9va3MgZm9yIHBl
cmYgZXZlbnRzCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NlY3VyaXR5LmggYi9pbmNsdWRl
L2xpbnV4L3NlY3VyaXR5LmgKaW5kZXggOWFlZGEzZjllODM4Li5lODY2NzcxYzIxMzIgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvbGludXgvc2VjdXJpdHkuaAorKysgYi9pbmNsdWRlL2xpbnV4L3NlY3Vy
aXR5LmgKQEAgLTI2LDYgKzI2LDcgQEAKICNpbmNsdWRlIDxsaW51eC9rZXJuZWxfcmVhZF9maWxl
Lmg+CiAjaW5jbHVkZSA8bGludXgva2V5Lmg+CiAjaW5jbHVkZSA8bGludXgvY2FwYWJpbGl0eS5o
PgorI2luY2x1ZGUgPGxpbnV4L2NyZWQuaD4KICNpbmNsdWRlIDxsaW51eC9mcy5oPgogI2luY2x1
ZGUgPGxpbnV4L3NsYWIuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KQEAgLTMzLDcgKzM0LDYg
QEAKICNpbmNsdWRlIDxsaW51eC9tbS5oPgogCiBzdHJ1Y3QgbGludXhfYmlucHJtOwotc3RydWN0
IGNyZWQ7CiBzdHJ1Y3QgcmxpbWl0Owogc3RydWN0IGtlcm5lbF9zaWdpbmZvOwogc3RydWN0IHNl
bWJ1ZjsKQEAgLTQ2OSw3ICs0NjksNyBAQCB2b2lkIHNlY3VyaXR5X2lub2RlX2ludmFsaWRhdGVf
c2VjY3R4KHN0cnVjdCBpbm9kZSAqaW5vZGUpOwogaW50IHNlY3VyaXR5X2lub2RlX25vdGlmeXNl
Y2N0eChzdHJ1Y3QgaW5vZGUgKmlub2RlLCB2b2lkICpjdHgsIHUzMiBjdHhsZW4pOwogaW50IHNl
Y3VyaXR5X2lub2RlX3NldHNlY2N0eChzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIHZvaWQgKmN0eCwg
dTMyIGN0eGxlbik7CiBpbnQgc2VjdXJpdHlfaW5vZGVfZ2V0c2VjY3R4KHN0cnVjdCBpbm9kZSAq
aW5vZGUsIHZvaWQgKipjdHgsIHUzMiAqY3R4bGVuKTsKLWludCBzZWN1cml0eV9sb2NrZWRfZG93
bihlbnVtIGxvY2tkb3duX3JlYXNvbiB3aGF0KTsKK2ludCBzZWN1cml0eV9jcmVkX2xvY2tlZF9k
b3duKGNvbnN0IHN0cnVjdCBjcmVkICpjcmVkLCBlbnVtIGxvY2tkb3duX3JlYXNvbiB3aGF0KTsK
ICNlbHNlIC8qIENPTkZJR19TRUNVUklUWSAqLwogCiBzdGF0aWMgaW5saW5lIGludCBjYWxsX2Js
b2NraW5nX2xzbV9ub3RpZmllcihlbnVtIGxzbV9ldmVudCBldmVudCwgdm9pZCAqZGF0YSkKQEAg
LTEzMzksMTIgKzEzMzksMTcgQEAgc3RhdGljIGlubGluZSBpbnQgc2VjdXJpdHlfaW5vZGVfZ2V0
c2VjY3R4KHN0cnVjdCBpbm9kZSAqaW5vZGUsIHZvaWQgKipjdHgsIHUzMgogewogCXJldHVybiAt
RU9QTk9UU1VQUDsKIH0KLXN0YXRpYyBpbmxpbmUgaW50IHNlY3VyaXR5X2xvY2tlZF9kb3duKGVu
dW0gbG9ja2Rvd25fcmVhc29uIHdoYXQpCitzdGF0aWMgaW5saW5lIGludCBzZWN1cml0eV9jcmVk
X2xvY2tlZF9kb3duKHN0cnVjdCBjcmVkICpjcmVkLCBlbnVtIGxvY2tkb3duX3JlYXNvbiB3aGF0
KQogewogCXJldHVybiAwOwogfQogI2VuZGlmCS8qIENPTkZJR19TRUNVUklUWSAqLwogCitzdGF0
aWMgaW5saW5lIGludCBzZWN1cml0eV9sb2NrZWRfZG93bihlbnVtIGxvY2tkb3duX3JlYXNvbiB3
aGF0KQoreworCXJldHVybiBzZWN1cml0eV9jcmVkX2xvY2tlZF9kb3duKGN1cnJlbnRfY3JlZCgp
LCB3aGF0KTsKK30KKwogI2lmIGRlZmluZWQoQ09ORklHX1NFQ1VSSVRZKSAmJiBkZWZpbmVkKENP
TkZJR19XQVRDSF9RVUVVRSkKIGludCBzZWN1cml0eV9wb3N0X25vdGlmaWNhdGlvbihjb25zdCBz
dHJ1Y3QgY3JlZCAqd19jcmVkLAogCQkJICAgICAgIGNvbnN0IHN0cnVjdCBjcmVkICpjcmVkLApk
aWZmIC0tZ2l0IGEva2VybmVsL3RyYWNlL2JwZl90cmFjZS5jIGIva2VybmVsL3RyYWNlL2JwZl90
cmFjZS5jCmluZGV4IGIwYzQ1ZDkyM2YwZi4uMTAwOWE1MWZjZTM2IDEwMDY0NAotLS0gYS9rZXJu
ZWwvdHJhY2UvYnBmX3RyYWNlLmMKKysrIGIva2VybmVsL3RyYWNlL2JwZl90cmFjZS5jCkBAIC0y
MTUsNyArMjE1LDcgQEAgY29uc3Qgc3RydWN0IGJwZl9mdW5jX3Byb3RvIGJwZl9wcm9iZV9yZWFk
X3VzZXJfc3RyX3Byb3RvID0gewogc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQKIGJwZl9wcm9i
ZV9yZWFkX2tlcm5lbF9jb21tb24odm9pZCAqZHN0LCB1MzIgc2l6ZSwgY29uc3Qgdm9pZCAqdW5z
YWZlX3B0cikKIHsKLQlpbnQgcmV0ID0gc2VjdXJpdHlfbG9ja2VkX2Rvd24oTE9DS0RPV05fQlBG
X1JFQUQpOworCWludCByZXQgPSBzZWN1cml0eV9jcmVkX2xvY2tlZF9kb3duKE5VTEwsIExPQ0tE
T1dOX0JQRl9SRUFEKTsKIAogCWlmICh1bmxpa2VseShyZXQgPCAwKSkKIAkJZ290byBmYWlsOwpA
QCAtMjQ2LDcgKzI0Niw3IEBAIGNvbnN0IHN0cnVjdCBicGZfZnVuY19wcm90byBicGZfcHJvYmVf
cmVhZF9rZXJuZWxfcHJvdG8gPSB7CiBzdGF0aWMgX19hbHdheXNfaW5saW5lIGludAogYnBmX3By
b2JlX3JlYWRfa2VybmVsX3N0cl9jb21tb24odm9pZCAqZHN0LCB1MzIgc2l6ZSwgY29uc3Qgdm9p
ZCAqdW5zYWZlX3B0cikKIHsKLQlpbnQgcmV0ID0gc2VjdXJpdHlfbG9ja2VkX2Rvd24oTE9DS0RP
V05fQlBGX1JFQUQpOworCWludCByZXQgPSBzZWN1cml0eV9jcmVkX2xvY2tlZF9kb3duKE5VTEws
IExPQ0tET1dOX0JQRl9SRUFEKTsKIAogCWlmICh1bmxpa2VseShyZXQgPCAwKSkKIAkJZ290byBm
YWlsOwpkaWZmIC0tZ2l0IGEvbmV0L3hmcm0veGZybV91c2VyLmMgYi9uZXQveGZybS94ZnJtX3Vz
ZXIuYwppbmRleCA1YTBlZjQzNjFlNDMuLmZjYzVhYjBlNjAwMyAxMDA2NDQKLS0tIGEvbmV0L3hm
cm0veGZybV91c2VyLmMKKysrIGIvbmV0L3hmcm0veGZybV91c2VyLmMKQEAgLTg1MSw3ICs4NTEs
NyBAQCBzdGF0aWMgaW50IGNvcHlfdXNlcl9vZmZsb2FkKHN0cnVjdCB4ZnJtX3N0YXRlX29mZmxv
YWQgKnhzbywgc3RydWN0IHNrX2J1ZmYgKnNrYgogc3RhdGljIGJvb2wgeGZybV9yZWRhY3Qodm9p
ZCkKIHsKIAlyZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfU0VDVVJJVFkpICYmCi0JCXNlY3VyaXR5
X2xvY2tlZF9kb3duKExPQ0tET1dOX1hGUk1fU0VDUkVUKTsKKwkJc2VjdXJpdHlfY3JlZF9sb2Nr
ZWRfZG93bihOVUxMLCBMT0NLRE9XTl9YRlJNX1NFQ1JFVCk7CiB9CiAKIHN0YXRpYyBpbnQgY29w
eV90b191c2VyX2F1dGgoc3RydWN0IHhmcm1fYWxnb19hdXRoICphdXRoLCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKQpkaWZmIC0tZ2l0IGEvc2VjdXJpdHkvbG9ja2Rvd24vbG9ja2Rvd24uYyBiL3NlY3Vy
aXR5L2xvY2tkb3duL2xvY2tkb3duLmMKaW5kZXggODdjYmRjNjRkMjcyLi4yYTEzYzg2NmMyMmEg
MTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L2xvY2tkb3duL2xvY2tkb3duLmMKKysrIGIvc2VjdXJpdHkv
bG9ja2Rvd24vbG9ja2Rvd24uYwpAQCAtNTUsNyArNTUsOCBAQCBlYXJseV9wYXJhbSgibG9ja2Rv
d24iLCBsb2NrZG93bl9wYXJhbSk7CiAgKiBsb2NrZG93bl9pc19sb2NrZWRfZG93biAtIEZpbmQg
b3V0IGlmIHRoZSBrZXJuZWwgaXMgbG9ja2VkIGRvd24KICAqIEB3aGF0OiBUYWcgdG8gdXNlIGlu
IG5vdGljZSBnZW5lcmF0ZWQgaWYgbG9ja2Rvd24gaXMgaW4gZWZmZWN0CiAgKi8KLXN0YXRpYyBp
bnQgbG9ja2Rvd25faXNfbG9ja2VkX2Rvd24oZW51bSBsb2NrZG93bl9yZWFzb24gd2hhdCkKK3N0
YXRpYyBpbnQgbG9ja2Rvd25faXNfbG9ja2VkX2Rvd24oY29uc3Qgc3RydWN0IGNyZWQgKmNyZWQs
CisJCQkJICAgZW51bSBsb2NrZG93bl9yZWFzb24gd2hhdCkKIHsKIAlpZiAoV0FSTih3aGF0ID49
IExPQ0tET1dOX0NPTkZJREVOVElBTElUWV9NQVgsCiAJCSAiSW52YWxpZCBsb2NrZG93biByZWFz
b24iKSkKQEAgLTcyLDcgKzczLDcgQEAgc3RhdGljIGludCBsb2NrZG93bl9pc19sb2NrZWRfZG93
bihlbnVtIGxvY2tkb3duX3JlYXNvbiB3aGF0KQogfQogCiBzdGF0aWMgc3RydWN0IHNlY3VyaXR5
X2hvb2tfbGlzdCBsb2NrZG93bl9ob29rc1tdIF9fbHNtX3JvX2FmdGVyX2luaXQgPSB7Ci0JTFNN
X0hPT0tfSU5JVChsb2NrZWRfZG93biwgbG9ja2Rvd25faXNfbG9ja2VkX2Rvd24pLAorCUxTTV9I
T09LX0lOSVQoY3JlZF9sb2NrZWRfZG93biwgbG9ja2Rvd25faXNfbG9ja2VkX2Rvd24pLAogfTsK
IAogc3RhdGljIGludCBfX2luaXQgbG9ja2Rvd25fbHNtX2luaXQodm9pZCkKZGlmZiAtLWdpdCBh
L3NlY3VyaXR5L3NlY3VyaXR5LmMgYi9zZWN1cml0eS9zZWN1cml0eS5jCmluZGV4IDk0MzgzZjgz
YmE0Mi4uYTI5ZGFmMzM4YTVmIDEwMDY0NAotLS0gYS9zZWN1cml0eS9zZWN1cml0eS5jCisrKyBi
L3NlY3VyaXR5L3NlY3VyaXR5LmMKQEAgLTI1NTUsMTEgKzI1NTUsMTEgQEAgdm9pZCBzZWN1cml0
eV9icGZfcHJvZ19mcmVlKHN0cnVjdCBicGZfcHJvZ19hdXggKmF1eCkKIH0KICNlbmRpZiAvKiBD
T05GSUdfQlBGX1NZU0NBTEwgKi8KIAotaW50IHNlY3VyaXR5X2xvY2tlZF9kb3duKGVudW0gbG9j
a2Rvd25fcmVhc29uIHdoYXQpCitpbnQgc2VjdXJpdHlfY3JlZF9sb2NrZWRfZG93bihjb25zdCBz
dHJ1Y3QgY3JlZCAqY3JlZCwgZW51bSBsb2NrZG93bl9yZWFzb24gd2hhdCkKIHsKLQlyZXR1cm4g
Y2FsbF9pbnRfaG9vayhsb2NrZWRfZG93biwgMCwgd2hhdCk7CisJcmV0dXJuIGNhbGxfaW50X2hv
b2soY3JlZF9sb2NrZWRfZG93biwgMCwgY3JlZCwgd2hhdCk7CiB9Ci1FWFBPUlRfU1lNQk9MKHNl
Y3VyaXR5X2xvY2tlZF9kb3duKTsKK0VYUE9SVF9TWU1CT0woc2VjdXJpdHlfY3JlZF9sb2NrZWRf
ZG93bik7CiAKICNpZmRlZiBDT05GSUdfUEVSRl9FVkVOVFMKIGludCBzZWN1cml0eV9wZXJmX2V2
ZW50X29wZW4oc3RydWN0IHBlcmZfZXZlbnRfYXR0ciAqYXR0ciwgaW50IHR5cGUpCmRpZmYgLS1n
aXQgYS9zZWN1cml0eS9zZWxpbnV4L2hvb2tzLmMgYi9zZWN1cml0eS9zZWxpbnV4L2hvb2tzLmMK
aW5kZXggOTJmOTA5YTJlOGY3Li40NzQ5MmQwODZjZTYgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L3Nl
bGludXgvaG9va3MuYworKysgYi9zZWN1cml0eS9zZWxpbnV4L2hvb2tzLmMKQEAgLTcwMzEsMTAg
KzcwMzEsMTAgQEAgc3RhdGljIHZvaWQgc2VsaW51eF9icGZfcHJvZ19mcmVlKHN0cnVjdCBicGZf
cHJvZ19hdXggKmF1eCkKIH0KICNlbmRpZgogCi1zdGF0aWMgaW50IHNlbGludXhfbG9ja2Rvd24o
ZW51bSBsb2NrZG93bl9yZWFzb24gd2hhdCkKK3N0YXRpYyBpbnQgc2VsaW51eF9sb2NrZG93bihj
b25zdCBzdHJ1Y3QgY3JlZCAqY3JlZCwgZW51bSBsb2NrZG93bl9yZWFzb24gd2hhdCkKIHsKIAlz
dHJ1Y3QgY29tbW9uX2F1ZGl0X2RhdGEgYWQ7Ci0JdTMyIHNpZCA9IGN1cnJlbnRfc2lkKCk7CisJ
dTMyIHNpZDsKIAlpbnQgaW52YWxpZF9yZWFzb24gPSAod2hhdCA8PSBMT0NLRE9XTl9OT05FKSB8
fAogCQkJICAgICAod2hhdCA9PSBMT0NLRE9XTl9JTlRFR1JJVFlfTUFYKSB8fAogCQkJICAgICAo
d2hhdCA+PSBMT0NLRE9XTl9DT05GSURFTlRJQUxJVFlfTUFYKTsKQEAgLTcwNDYsNiArNzA0Niwx
MiBAQCBzdGF0aWMgaW50IHNlbGludXhfbG9ja2Rvd24oZW51bSBsb2NrZG93bl9yZWFzb24gd2hh
dCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJLyogSWdub3JlIGlmIHRoZXJlIGlzIG5vIHJl
bGV2YW50IGNyZWQgdG8gY2hlY2sgYWdhaW5zdCAqLworCWlmICghY3JlZCkKKwkJcmV0dXJuIDA7
CisKKwlzaWQgPSBjcmVkX3NpZChjcmVkKTsKKwogCWFkLnR5cGUgPSBMU01fQVVESVRfREFUQV9M
T0NLRE9XTjsKIAlhZC51LnJlYXNvbiA9IHdoYXQ7CiAKQEAgLTczNjcsNyArNzM3Myw3IEBAIHN0
YXRpYyBzdHJ1Y3Qgc2VjdXJpdHlfaG9va19saXN0IHNlbGludXhfaG9va3NbXSBfX2xzbV9yb19h
ZnRlcl9pbml0ID0gewogCUxTTV9IT09LX0lOSVQocGVyZl9ldmVudF93cml0ZSwgc2VsaW51eF9w
ZXJmX2V2ZW50X3dyaXRlKSwKICNlbmRpZgogCi0JTFNNX0hPT0tfSU5JVChsb2NrZWRfZG93biwg
c2VsaW51eF9sb2NrZG93biksCisJTFNNX0hPT0tfSU5JVChjcmVkX2xvY2tlZF9kb3duLCBzZWxp
bnV4X2xvY2tkb3duKSwKIAogCS8qCiAJICogUFVUICJDTE9OSU5HIiAoQUNDRVNTSU5HICsgQUxM
T0NBVElORykgSE9PS1MgSEVSRQotLSAKMi4zMS4xCgo=
--00000000000003f45805c24badf9--

