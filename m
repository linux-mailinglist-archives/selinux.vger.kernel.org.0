Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7EA58DFE0
	for <lists+selinux@lfdr.de>; Tue,  9 Aug 2022 21:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345203AbiHITHb (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Tue, 9 Aug 2022 15:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345832AbiHITGH (ORCPT
        <rfc822;selinux@vger.kernel.org>); Tue, 9 Aug 2022 15:06:07 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C826B248C1
        for <selinux@vger.kernel.org>; Tue,  9 Aug 2022 11:45:32 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id z7so4044945qki.11
        for <selinux@vger.kernel.org>; Tue, 09 Aug 2022 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bigbadwolfsecurity-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PjOAWYH6F7PbOe6YGeH854bcKIVmnLZoi9DCG2tWn/o=;
        b=FpS+/R3V7uDaqRh9156Fgd/q3ldRRSbttSIr/DEgMo/ECGFJ82JZTqmBUVndhaH0x9
         Zax0AdjKtsyb3AcbfGypptlR3nN/lO5QIScWANv+rHaOZmt7BJ0Txtqkm7gp6Thw7aYE
         tosWiaGiOKF//jo/4w3esYXeJo55h2T6WLkZ25nWvHffup6dqz5hCCWxct1N8Hj2Nt+1
         Ajf0efLztbSjvTQ8FSHcwsrZKbcMhkQ4KGc3BPro0pusFYSQDu4/buPtKvfCsy51HWtW
         ngoF0Vhoywt4aiQC1fC6ZU92s+FcaaYiNonva2qXOm6JXBoxtGKVZ6MraFY2Q68UdkNC
         DY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PjOAWYH6F7PbOe6YGeH854bcKIVmnLZoi9DCG2tWn/o=;
        b=6aJ8QaYocuhDX+QLGWjI0/AGLjKgaKGPg+iPbCAe4mDmc5k222f92pY/UAfglBb1bI
         sBR3f+JqvhcKzUr0NSf65ecir51VPApV04U6Lv9HocGmCHqAR+UurAy3QG1Q9vsRW+cn
         eufw2BWxnv4nC72G5qZoKKeZdvxwKpFLFw3stSbgZzvmv3RFE+EJ2pW5iPgM0mzDHtEI
         7G6mJ19zW9XKlvIeSDjRwktUUtdEcHrJrc14XVWdXrqyxUo6wQbFUPjszXUZetBXf0PU
         nYinoM5Yi/RP3bjgE6MINE9LjXV+VRmbxKQ6AEDs2g7AbzA7UeXmRwhGx/cK5KHKKFoK
         xS6A==
X-Gm-Message-State: ACgBeo3m5lL2yTOhUSYHEKxdKpJwaOM7FaKocay991di8e2MY7jEJnrb
        Gy9J/l9IA/DC6o834Ugjw5/TtHyHi3ktQl1536r+7V3f+PGBuMgX
X-Google-Smtp-Source: AA6agR5vHEM7AZs3FLoWvPDgfwIV36VCYcIoShiOBSmr3EqN7vhhtxVmZflqGNIUjPi7NtIQBfXe/PW8xhlMqhZvYXA=
X-Received: by 2002:a37:b147:0:b0:6b5:fa14:ac00 with SMTP id
 a68-20020a37b147000000b006b5fa14ac00mr18431427qkf.606.1660070731797; Tue, 09
 Aug 2022 11:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+EEuAgfGhTWBWXgtHSVU22feM+0PS=h-z-eVF4JxmSf2qyZzg@mail.gmail.com>
 <CAHC9VhS6A9yaywmRBVg9+AijAqZXxeB=e=HiZ3sUe_Zf+uahuw@mail.gmail.com>
In-Reply-To: <CAHC9VhS6A9yaywmRBVg9+AijAqZXxeB=e=HiZ3sUe_Zf+uahuw@mail.gmail.com>
From:   Karl MacMillan <karl@bigbadwolfsecurity.com>
Date:   Tue, 9 Aug 2022 14:45:21 -0400
Message-ID: <CA+EEuAgBiMXh+MMdE8pCYHqeqHXUJVmtrHgv8wGNHCEYMsuW5w@mail.gmail.com>
Subject: Re: KVM / virtual networking access control
To:     Paul Moore <paul@paul-moore.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Sun, Jul 31, 2022 at 12:45 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Fri, Jul 29, 2022 at 11:36 PM Karl MacMillan
> <karl@bigbadwolfsecurity.com> wrote:
> >
> > Hi,
> >
> > I'm trying to do some access control over the networking between KVM
> > virtual machines using Secmark and things are not working as I expect.
> > The key is that this is _between_ virtual machines, not just ingress /
> > egress to the virtual machines from external address.
> >
> > Quick summary: I'm connecting two VMs together using veth pairs and a
> > virtual bridge and I only ever see:
> >
> >     allow unlabeled_t bare_packet_a_t:packet { forward_in forward_out }=
;
>
> Just to make sure I'm understanding this correctly, we are talking
> about the SELinux controls from the perspective of the
> host/hypervisor, yes?
>

Yes

> Assuming that is the case, the "packet/{ forward_in forward_out }"
> permissions look correct to me.  In the case of the secmark forwarding
> rules you basically have this:
>
>   allow <peer> <secmark>:packet { forward_in };
>   allow <peer> <secmark>:packet { forward_out };
>

So I get this - that the host is basically forwarding packets
generated by the virtual machines. And I'll say that was really the
piece I was missing, so thanks for clearing that up.

I'm curious under what other circumstances processes can generate
network traffic that are treated in this way. Packet sockets? Tun /
tap devices?

I'm sure I'm preaching to the choir, but some more documentation on
this would be great. I know you've done so much (and those pdfs
helped). But I was aware of much of that content, I just didn't know
how it all applied to this specific area. See - part of why I was
confused here was that here we have these KVM processes where we
already _know_ the process context. It just seemed unimaginable that
what we have to do is a) enable some sort of labeled networking and b)
tell the kernel all over what the label of the peer is using network
information rather than process information it already knows! I know
you've added special casing for the loopback devices so that this is
not required there. But I kept thinking that surely there must be a
way to trigger something more like the packet { send recv }
permissions because we have a process generating network traffic on
the same host that is trying to enforce those controls.

> ... and I'm guessing you haven't setup any peer labeling between the
> two guests so you are seeing unlabeled_t for "<peer>".
>

I see your suggestion below (which worked), but I will say that I
tried CIPSO / CALIPSO before sending this email. I just did not know
how to get the fallback labeling to do what I needed.

> > What I want is packet { send recv } because that would be against the
> > label of the KVM process rather than the peer label (which on the same
> > system would always be unlabeled - I see no way to use CIPSO/CALIPSO
> > to get peer labels to work here).
>
> The "packet/{ send recv }" controls are for packets that originate and
> terminate on the node applying the policy; think of your typical
> client/server nodes.  The "packet/{ forward_in forward_out }" controls
> are for packets that are passing through the node applying the policy,
> e.g. intermediate nodes such as bridges and switches ... even software
> bridges like that found in hypervisors ;)
>
> > I would appreciate any insight into what might be going on. This is
> > mainly tested on a RHEL 8.6 box, but some testing has been done on a
> > Fedora 36 box as well.
>
> I don't know all the details of your setup, or the security goals you
> are trying to enforce, but since it looks like you are bridging the
> network traffic between the guests, you might want to try setting up
> the NetLabel static/fallback mechanism to assign a peer label to
> traffic on those interfaces (no more unlabeled_t in the secmark
> forwarding rules).  Adding the peer labeling information will also
> trigger the network peer label controls in the kernel so you will see
> additional "netif/{ ingress egress}" and "node/{ recvfrom sendto }"
> checks.
>

So this works . . . with some interesting caveats. What works for me is:

1. Setting CIPSO fallback labels on the bridge interface and using IP
selectors to set labels per-VM.
2. Using physdev-in in SECMARK rules to set packet labels on packets
based on which veth pair is connected to the bridge (and I can use
other selectors for SECMARK - but this one is nice).

So at this point I can do what I want (except the namespace issue
below) - which is to control how my VMs talk on a single box and build
pipelines of VMs or other interesting topologies. I can also do some
coarse-grained enforcement using netif {ingress egress} which is also
wnice.

What is not working:

1. I cannot do CIPSO fallback labeling based on either the macvtap or
the veth pairs. It will accept the fallback rules, but I still get
unlabeled for the peer. This is not great because it means that I have
to use labeling based upon IP addresses to differentiate VMs (vs
interfaces), which means that my labeling is dependent on the
configuration inside of my VMs. I don't like having to trust my VMs at
all. Or I could add a lot more bridges I guess, but I've not tried
that.
2. I cannot get netlabelct to run inside of a network namespace, so I
can't do fallback labeling of bridges in a namespace. I get the error
"netlabelctl: error, failed to initialize the NetLabel library". This
makes many of the topologies I want to do much harder.

I have an overall concern, which is back to what I was saying above
about process labels. At that point, it doesn't feel like there is a
lot of advantage of doing SELinux enforcement of the networking vs
just the iptables network enforcement. Much of the power of the
SELinux enforcement, to me, is to tie iptables to process labels or,
with labeled networking, to transmit remote process labels. Here . . .
well, we are generating peer labels on box based on network properties
and then writing rules that are based solely on information that
iptables already had (ip addresses and interface names). Am I missing
something?

Thanks so much for all of your help,

Karl

> Here are few slides that might be helpful (they are older, but still rele=
vant):
>
> https://www.paul-moore.com/docs/selinux_network_controls-pmoore-122012-r1=
.pdf
> https://www.paul-moore.com/docs/labeled_networking-lfjapan-07092008.pdf
>
> --
> paul-moore.com

[1] https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/=
8/html/configuring_and_managing_virtualization/configuring-virtual-machine-=
network-connections_configuring-and-managing-virtualization#understanding-v=
irtual-networking-overview_configuring-virtual-machine-network-connections
