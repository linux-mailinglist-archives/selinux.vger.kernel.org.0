Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86E8258F41A
	for <lists+selinux@lfdr.de>; Thu, 11 Aug 2022 00:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiHJWE0 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 10 Aug 2022 18:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbiHJWEY (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 10 Aug 2022 18:04:24 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20DB83F1B
        for <selinux@vger.kernel.org>; Wed, 10 Aug 2022 15:04:20 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-116c7286aaaso3569510fac.11
        for <selinux@vger.kernel.org>; Wed, 10 Aug 2022 15:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=OSnCqAsiFfou+mcP286AdFQAyCxJQT8Ekj6sjB1haJ8=;
        b=GsMzkm/RotNbmOZomW4tBr84gOLGEgUWranWXALxoSgO0wvC9JeCV+0oGZkef+50j+
         HmfE3umEpN0SLQZwQpID+ncDsqdTYoYht52kkxqqFuX4ABwKH523o2kTEO2YsEVNOPRV
         9REg4aPlzjohew7cqezWSddQ/g5vkbg6u/PUIKxRe9sepTNJAreQ07jph5WcffufQXio
         o7WO/oUcNXQpMgLyzp4IUP9dhWXrkPA+7Ttx7s86rntd4US5QPXVTASZE5xHU/GDDL9u
         TI8B0JnbEJXJmWD45qIPqnQzHiw62tv5Ma5QHzHryTH2Aai6yOHI3KAyQVxU9hwtJJdf
         OHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=OSnCqAsiFfou+mcP286AdFQAyCxJQT8Ekj6sjB1haJ8=;
        b=h2QeedqF0Tvkv0MqGzLYs02S1NMzc/4o00Hv2qThf8MdhZvrCYjSYtavEUP/Z5YO9M
         T14QS1RnTL3APOWNv3RJ+xrsewaNZTig7C8v4mKPZBc8bf69T1mR/WiR/koSvfdPXlVL
         2ZD/bI+ghNmabmRezoGYnmmaIGuB4F6c9txGN/HzaqJm7pxhrzs0/qhS1dJ2SjCW+1/R
         70Iw/b1TWgDuSbaAHOFPbpfoCDAM5RkOjNyvJ/LaFEn5bK63g+loDaa+eHO6fettb8bc
         AliPG3bslNa7YFrlQ7QwGIcPFr67d4WiRhICgCJn13VLutQWlUsbeEMs95oAzC4tkad2
         E6cA==
X-Gm-Message-State: ACgBeo2Pgtnz5xIHuQEPijh4SzfVcDT9H4vsjJelbz8cI7Iyw/qwirXk
        oyWdkCP++kWSYhyDlpkXZSO7cnh0dnnowqxmxkiSWIMBTwu2
X-Google-Smtp-Source: AA6agR46P4KcCwuCBJXmotktcZU1rsZZz3/jZNkvjmwRnLoOn8/Vgzzbh67PH5vOuNzCGgrOm5xb7798tMvomn4D8Kw=
X-Received: by 2002:a05:6870:9588:b0:101:c003:bfe6 with SMTP id
 k8-20020a056870958800b00101c003bfe6mr2367222oao.41.1660169059939; Wed, 10 Aug
 2022 15:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+EEuAgfGhTWBWXgtHSVU22feM+0PS=h-z-eVF4JxmSf2qyZzg@mail.gmail.com>
 <CAHC9VhS6A9yaywmRBVg9+AijAqZXxeB=e=HiZ3sUe_Zf+uahuw@mail.gmail.com> <CA+EEuAgBiMXh+MMdE8pCYHqeqHXUJVmtrHgv8wGNHCEYMsuW5w@mail.gmail.com>
In-Reply-To: <CA+EEuAgBiMXh+MMdE8pCYHqeqHXUJVmtrHgv8wGNHCEYMsuW5w@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 10 Aug 2022 18:04:08 -0400
Message-ID: <CAHC9VhRsLbpbboYAbr5w-xJ=353tcp4wN_LgxVBn7PKW0rhvmg@mail.gmail.com>
Subject: Re: KVM / virtual networking access control
To:     Karl MacMillan <karl@bigbadwolfsecurity.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Tue, Aug 9, 2022 at 2:45 PM Karl MacMillan
<karl@bigbadwolfsecurity.com> wrote:
> On Sun, Jul 31, 2022 at 12:45 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Fri, Jul 29, 2022 at 11:36 PM Karl MacMillan
> > <karl@bigbadwolfsecurity.com> wrote:

...

> > > Quick summary: I'm connecting two VMs together using veth pairs and a
> > > virtual bridge and I only ever see:
> > >
> > >     allow unlabeled_t bare_packet_a_t:packet { forward_in forward_out };
> >
> > Just to make sure I'm understanding this correctly, we are talking
> > about the SELinux controls from the perspective of the
> > host/hypervisor, yes?
> >
>
> Yes
>
> > Assuming that is the case, the "packet/{ forward_in forward_out }"
> > permissions look correct to me.  In the case of the secmark forwarding
> > rules you basically have this:
> >
> >   allow <peer> <secmark>:packet { forward_in };
> >   allow <peer> <secmark>:packet { forward_out };
> >
>
> So I get this - that the host is basically forwarding packets
> generated by the virtual machines. And I'll say that was really the
> piece I was missing, so thanks for clearing that up.
>
> I'm curious under what other circumstances processes can generate
> network traffic that are treated in this way. Packet sockets? Tun /
> tap devices?

I've never thought to catalog all of the different ways a local
process could send network traffic into the stack in such a way that
it isn't treated as a local connection so I can't give you a complete
list off the top of my head.  However, I can tell you that the
packet/forward_in check will be triggered via the netfilter
NF_INET_FORWARD hook and the packet/forward_out check will be
triggered via the netfilter NF_INET_POST_ROUTING hook (there is logic
in the selinux_ip_postroute() function to determine if they packet was
locally generated or forwarded through the stack).  I realize that
probably isn't very helpful, but it's the best I have without digging
through a bunch of code right now - sorry.

> I'm sure I'm preaching to the choir, but some more documentation on
> this would be great. I know you've done so much (and those pdfs
> helped). But I was aware of much of that content, I just didn't know
> how it all applied to this specific area.

Yes, we can definitely do better here.  The SELinux Notebook has some
information on labeled networking, but I think it could be better.

I think part of what makes this so challenging is that in order to
configure this properly you need to have a good understanding of the
networking concepts, their implementation in the Linux Kernel, and
SELinux's various networking controls.  As you likely know at this
point, that's a lot of stuff :)

Oh, and don't forget the unique nature of any given solution's network
topology.  That dooms any hope of creating a useful template, recipe,
or some other general solution that could be used by admins to help
them deal with some of the complexity.

> See - part of why I was
> confused here was that here we have these KVM processes where we
> already _know_ the process context.

The important detail is that because of ... well, networking ... all
we really can rely on when making access control decisions at the
packet level is the packet itself.  If that packet doesn't have a
on-the-wire security label, or some other security hint (see labeled
IPsec, but don't use it), we need to fallback to other mechanisms if
we want to assign that packet a security label.  If the packet
originated from a local socket that the kernel knows about, it can
obtain the security label from the socket, but that's a special case.

> It just seemed unimaginable that
> what we have to do is a) enable some sort of labeled networking and b)
> tell the kernel all over what the label of the peer is using network
> information rather than process information it already knows!

Ah, but the part you are forgetting is that in your configuration the
kernel can't match the packets with the originating process.  I know
it sounds silly, but that's the wacky world of networking for you :)

> I know
> you've added special casing for the loopback devices so that this is
> not required there.

I think you are confusing the special full-context NetLabel trick that
we can do over loopback with connecting bridged network packets to a
local originating process.  They are *very* different things.

> But I kept thinking that surely there must be a
> way to trigger something more like the packet { send recv }
> permissions because we have a process generating network traffic on
> the same host that is trying to enforce those controls.

Sadly that is not how it works, or is likely to ever work.  Perhaps
thinking of it this way may help: what is actually generating those
packets that you want to control?  Is is the QEMU/KVM process on the
host system, or a virtualized process running inside of that QEMU/KVM
process?

(SPOILER: it's the latter, which makes all the difference)

> > I don't know all the details of your setup, or the security goals you
> > are trying to enforce, but since it looks like you are bridging the
> > network traffic between the guests, you might want to try setting up
> > the NetLabel static/fallback mechanism to assign a peer label to
> > traffic on those interfaces (no more unlabeled_t in the secmark
> > forwarding rules).  Adding the peer labeling information will also
> > trigger the network peer label controls in the kernel so you will see
> > additional "netif/{ ingress egress}" and "node/{ recvfrom sendto }"
> > checks.
> >
>
> So this works . . . with some interesting caveats. What works for me is:
>
> 1. Setting CIPSO fallback labels on the bridge interface and using IP
> selectors to set labels per-VM.
> 2. Using physdev-in in SECMARK rules to set packet labels on packets
> based on which veth pair is connected to the bridge (and I can use
> other selectors for SECMARK - but this one is nice).
>
> So at this point I can do what I want (except the namespace issue
> below) - which is to control how my VMs talk on a single box and build
> pipelines of VMs or other interesting topologies. I can also do some
> coarse-grained enforcement using netif {ingress egress} which is also
> wnice.

I'm glad you got it working.

> What is not working:
>
> 1. I cannot do CIPSO fallback labeling based on either the macvtap or
> the veth pairs.

Could you create an issue on the SELinux kernel repo on GH with as
much detail as you can gather?  I know macvtap is a bit "special" due
to how it is implemented, and veth pairs might have a similar issue
(or simply lack the netfilter hooks).

* https://github.com/SELinuxProject/selinux-kernel

> 2. I cannot get netlabelct to run inside of a network namespace, so I
> can't do fallback labeling of bridges in a namespace. I get the error
> "netlabelctl: error, failed to initialize the NetLabel library". This
> makes many of the topologies I want to do much harder.

That is likely due to netlabelctl being unable to talk to the NetLabel
subsystem in the kernel, which I'm guessing is due to the NetLabel
subsystem only registering itself in the initial network namespace.
That's something we will need to change at some point, but there are
bigger issues around namespacing that would likely need to be
addressed first.

> I have an overall concern, which is back to what I was saying above
> about process labels. At that point, it doesn't feel like there is a
> lot of advantage of doing SELinux enforcement of the networking vs
> just the iptables network enforcement.

Arguably I believe there is some value in having the allowed access
defined in the policy, although admittedly the labeling is still done
outside of policy much like we do with a context mount.

> Much of the power of the
> SELinux enforcement, to me, is to tie iptables to process labels or,
> with labeled networking, to transmit remote process labels.

Which works when the kernel has visibility to the process where the
network traffic originated.  In the VM case, the kernel's visibility
stops at the QEMU (or similar) process, it can not see the virtualized
process which created the network traffic.

> Here . . .
> well, we are generating peer labels on box based on network properties
> and then writing rules that are based solely on information that
> iptables already had (ip addresses and interface names). Am I missing
> something?

I believe my comments above have provided a bit more background on why
things are the way they are, but if things still don't make sense let
us know :)

-- 
paul-moore.com
