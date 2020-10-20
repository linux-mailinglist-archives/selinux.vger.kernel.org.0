Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8931628E61A
	for <lists+selinux@lfdr.de>; Wed, 14 Oct 2020 20:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728968AbgJNSOD (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Wed, 14 Oct 2020 14:14:03 -0400
Received: from mailomta18-re.btinternet.com ([213.120.69.111]:46918 "EHLO
        re-prd-fep-043.btinternet.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727369AbgJNSOD (ORCPT
        <rfc822;selinux@vger.kernel.org>); Wed, 14 Oct 2020 14:14:03 -0400
Received: from re-prd-rgout-003.btmx-prd.synchronoss.net ([10.2.54.6])
          by re-prd-fep-043.btinternet.com with ESMTP
          id <20201014181358.GQJL29506.re-prd-fep-043.btinternet.com@re-prd-rgout-003.btmx-prd.synchronoss.net>;
          Wed, 14 Oct 2020 19:13:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=btinternet.com; s=btmx201904; t=1602699238; 
        bh=RVCGXMQpRNGZvBkrCCQcVgdYwj2g6WgALXg4QElW5Lk=;
        h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:MIME-Version;
        b=VSQxHwnUeLnyMjnzmvCqrz4YsmwY8G0KIPvK1bo8wxNLUVLIpVFKeKhpmCyrjKQW0FRivDxRsuubkLCoOHzTSCoLxe9llf91HA9thhoBZW9yk6m5VfwM+wlHsw9HwQaZO98w/iXEbDcrmb9LS52fa3fegb4nvGADSr067LJDSwJ066WmTGHv/j7syZ0bMfxTw4Atrqa1dnWw8x4PLAhBZr/iTARuj1MaQ6kMmYUxFnrFRv/JfZfJ7BEg6dhf1g0F+dON2XbTS8n0axzvcGTiNqqWcvW5Qm8AEdUHGZUKnaSelaMDBcr+Hupvcal2Jwc69bDzU0FLyvaLlHTk03v55Q==
Authentication-Results: btinternet.com;
    auth=pass (LOGIN) smtp.auth=richard_c_haines@btinternet.com
X-Originating-IP: [86.183.114.60]
X-OWM-Source-IP: 86.183.114.60 (GB)
X-OWM-Env-Sender: richard_c_haines@btinternet.com
X-VadeSecure-score: verdict=clean score=0/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedujedriedugdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuueftkffvkffujffvgffngfevqffopdfqfgfvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeftihgthhgrrhguucfjrghinhgvshcuoehrihgthhgrrhgupggtpghhrghinhgvshessghtihhnthgvrhhnvghtrdgtohhmqeenucggtffrrghtthgvrhhnpeekgeeftdffkeeikedugedvkeejheeiffevveelgedtleduteevudelffdugffgieenucfkphepkeeirddukeefrdduudegrdeitdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhinhgvthepkeeirddukeefrdduudegrdeitddpmhgrihhlfhhrohhmpeeorhhitghhrghruggptggphhgrihhnvghssegsthhinhhtvghrnhgvthdrtghomhequceuqfffjgepkeeukffvoffkoffgpdhrtghpthhtohepoehomhhoshhnrggtvgesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeoshgvlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgheq
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-SNCR-hdrdom: btinternet.com
Received: from localhost.localdomain (86.183.114.60) by re-prd-rgout-003.btmx-prd.synchronoss.net (5.8.340) (authenticated as richard_c_haines@btinternet.com)
        id 5ED9C2FD15DCDE93; Wed, 14 Oct 2020 19:13:58 +0100
Message-ID: <3fd9d2c2603b156dacf9c5f5c3c4926dd870fd27.camel@btinternet.com>
Subject: Re: [PATCH V2 1/1] selinux-testsuite: Update SCTP asconf
 client/server
From:   Richard Haines <richard_c_haines@btinternet.com>
To:     Ondrej Mosnacek <omosnace@redhat.com>
Cc:     SElinux list <selinux@vger.kernel.org>
Date:   Wed, 14 Oct 2020 19:13:51 +0100
In-Reply-To: <CAFqZXNu0KqmZcTTZHOYbz-6tFbSU5Ss=-Y1JUHsmHMEU6jmb-A@mail.gmail.com>
References: <20200922085902.18315-1-richard_c_haines@btinternet.com>
         <CAFqZXNu0KqmZcTTZHOYbz-6tFbSU5Ss=-Y1JUHsmHMEU6jmb-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Wed, 2020-10-14 at 13:07 +0200, Ondrej Mosnacek wrote:
> On Tue, Sep 22, 2020 at 10:59 AM Richard Haines
> <richard_c_haines@btinternet.com> wrote:
> > The main changes have been to sctp_asconf_params_client.c and
> > sctp_asconf_params_server.c to make them more reliable for running
> > the
> > client and server on different systems.
> > 
> > Updated common code in sctp_common.c for sctp event handling and
> > updated
> > relevant programs to use handle_event()
> > 
> > Removed obsolete code/policy.
> > 
> > Signed-off-by: Richard Haines <richard_c_haines@btinternet.com>
> > ---
> > V2 Changes: Indent line, fix typo and increase timer to 3 secs as
> > per
> > Ondrej comments.
> > 
> >  policy/test_sctp.te                    |  75 ++++-
> >  tests/sctp/.gitignore                  |   1 -
> >  tests/sctp/Makefile                    |   3 +-
> >  tests/sctp/sctp_asconf_params_client.c | 322 ++++++++-----------
> >  tests/sctp/sctp_asconf_params_server.c | 275 +++++++++-------
> >  tests/sctp/sctp_common.c               | 189 ++++++++++-
> >  tests/sctp/sctp_common.h               |  12 +-
> >  tests/sctp/sctp_peeloff_server.c       |  42 +--
> >  tests/sctp/sctp_server.c               |   4 +-
> >  tests/sctp/sctp_set_peer_addr.c        | 415 -------------------
> > ------
> >  tests/sctp/test                        |  70 ++++-
> >  11 files changed, 623 insertions(+), 785 deletions(-)
> >  delete mode 100644 tests/sctp/sctp_set_peer_addr.c
> > 
> [...]
> > diff --git a/tests/sctp/test b/tests/sctp/test
> > index b4462c9..eede42f 100755
> > --- a/tests/sctp/test
> > +++ b/tests/sctp/test
> > @@ -50,7 +50,7 @@ BEGIN {
> >          }
> > 
> >          if ( $ipaddress[1] ne 0 and $ipaddress[0] ne $ipaddress[1]
> > ) {
> > -            $test_count += 2;
> > +            $test_count += 3;
> >              $test_asconf = 1;
> >          }
> > 
> > @@ -208,37 +208,77 @@ $result =
> >  ok( $result >> 8 eq 2 );
> > 
> >  #
> > -######################### SET_PRI_ADDR SET_PEER_ADDR
> > ########################
> > +##################### Dynamic Address Reconfiguration
> > #####################
> > +#
> > +# These tests require two non-loopback addresses.
> > +#
> > +# Server - setsockopt(SCTP_SET_PEER_PRIMARY_ADDR, $ipaddress[0]);
> > +# net/sctp/sm_make_chunk.c sctp_process_asconf_param()
> > SCTP_PARAM_SET_PRIMARY
> > +# Server -> Client (Set $ipaddress[0] as primary - client acks)
> > +#
> > +# Server - sctp_bindx(SCTP_BINDX_ADD_ADDR, $ipaddress[1]);
> > +# net/sctp/sm_make_chunk.c sctp_process_asconf_param()
> > SCTP_PARAM_ADD_IP
> > +# Server -> Client (Set $ipaddress[1] as primary - client acks)
> > +#
> > +# These are sent by the server and require bind permission. They
> > are
> > +# received by the client and the SCTP_PARAM_ADD_IP is validated
> > when
> > +# $ipaddress[1] is set for use via:
> > +#    net/sctp/socket.c
> > sctp_setsockopt_peer_primary_addr(setsockopt(SCTP_PRIMARY_ADDR))
> > +# This requires the 'bind' permission, if not granted client exits
> > with 51.
> >  #
> > 
> > -# These tests require two local non-loopback addresses.
> >  if ($test_asconf) {
> > -    print "# Testing asconf parameter chunk processing.\n";
> > 
> > -    # To enable processing of incoming ASCONF parameters:
> > -    # SCTP_PARAM_SET_PRIMARY, SCTP_PARAM_ADD_IP and
> > SCTP_PARAM_DEL_IP,
> > -    # need to set:
> > +    # To enable processing of ASCONF parameters
> > SCTP_PARAM_SET_PRIMARY
> > +    # and SCTP_PARAM_ADD_IP need to set:
> >      system("echo 1 > /proc/sys/net/sctp/addip_enable");
> >      system("echo 1 > /proc/sys/net/sctp/addip_noauth_enable");
> > 
> > -    # Verify ASCONF params.
> > +    print "Testing Dynamic Address Reconfiguration\n";
> > +
> > +    # Server should automatically exit after each test
> > +    $pid = server_start(
> > +        "-t sctp_asconf_params_server_t",
> > +        "sctp_asconf_params_server",
> > +        "$v $ipaddress[0] $ipaddress[1] 1035"
> > +    );
> > +
> >      $result = system
> > -"runcon -t test_sctp_set_peer_addr_t $basedir/sctp_set_peer_addr
> > $v $ipaddress[0] $ipaddress[1] 1035";
> > +"runcon -t sctp_asconf_params_client_t
> > $basedir/sctp_asconf_params_client $v $ipaddress[0] 1035";
> >      ok( $result eq 0 );
> > 
> > -    # Start the asconf server.
> > +    server_end($pid);
> > +
> > +    $pid = server_start(
> > +        "-t sctp_asconf_params_server_t",
> > +        "sctp_asconf_params_server",
> > +        "$v $ipaddress[0] $ipaddress[1] 1035"
> > +    );
> > +
> > +    print "Testing deny SCTP_PRIMARY_ADDR\n";
> > +    $result = system
> > +"runcon -t sctp_asconf_deny_pri_addr_client_t
> > $basedir/sctp_asconf_params_client $v $ipaddress[0] 1035 2>&1";
> > +    ok( $result >> 8 eq 51 );    # setsockopt(2) failed
> > +
> > +    server_end($pid);
> > +
> > +    #
> > +    # This is a local only test as it's the neverallow rule that
> > stops:
> > +    #    server -> client sctp_socket { connect };
> > +    #
> > +    # Srv sends SCTP_PARAM_ADD_IP and SCTP_PARAM_SET_PRIMARY in
> > ASCONF's
> > +    # Client returns ASCONF_ACK's with 'Request refused - no
> > authorization'
> >      $pid = server_start(
> > -        "-t test_sctp_set_peer_addr_t",
> > +        "-t sctp_asconf_params_server_t",
> >          "sctp_asconf_params_server",
> >          "$v $ipaddress[0] $ipaddress[1] 1035"
> >      );
> > 
> > -# This should fail connect permission attempting to send
> > SCTP_PARAM_ADD_IP to client.
> > +    print "Testing deny
> > SCTP_PARAM_ADD_IP/SCTP_PARAM_SET_PRIMARY\n";
> >      $result = system
> > -"runcon -t test_sctp_client_t --
> > $basedir/sctp_asconf_params_client $v $ipaddress[0] 1035 2>&1";
> > -    ok($result);
> > +"runcon -t sctp_asconf_deny_param_add_client_t
> > $basedir/sctp_asconf_params_client $v $ipaddress[0] 1035 2>&1";
> > +    ok( $result >> 8 eq 11 );   # Client error 'Dynamic Address
> > Reconfiguration'
> 
> I just experimented with automatically setting up a second IPv4
> address in the test (using a GRE tunnel over localhost) and this
> particular test is failing for me on the current 5.8.14 Fedora 32
> kernel, as well as on 5.9 in Rawhide. It seems that the command fails
> with the same exit code as the previous one ($result >> 8 eq 51, not
> 11). Interestingly, on RHEL-8 it passes, so it seems that the
> behavior
> has changed upstream at some point. Does anyone have any idea what
> might be the cause? Is it a bug in the kernel or the test?

Could you detail how you set up the second IPv4/GRE please so that I
can test this. It seems like the kernel from what you say, although I
couldn't see any major changes in the sm_make_chunk.c area. The test
should fail well before the error 51 because of:

# net/sctp/sm_make_chunk.c sctp_process_asconf_param()
SCTP_PARAM_ADD_IP and SCTP_PARAM_SET_PRIMARY
# neverallow sctp_asconf_params_server_t
sctp_asconf_deny_param_add_client_t:sctp_socket { connect };

> 
> > -    # The server should automatically exit.
> >      server_end($pid);
> > 
> >      system("echo 0 > /proc/sys/net/sctp/addip_enable");
> > --
> > 2.26.2
> > 

