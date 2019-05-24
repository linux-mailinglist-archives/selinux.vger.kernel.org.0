Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9CB1291A5
	for <lists+selinux@lfdr.de>; Fri, 24 May 2019 09:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389131AbfEXHYx (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Fri, 24 May 2019 03:24:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:1303 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388974AbfEXHYx (ORCPT <rfc822;selinux@vger.kernel.org>);
        Fri, 24 May 2019 03:24:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 May 2019 00:24:51 -0700
X-ExtLoop1: 1
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
  by orsmga005.jf.intel.com with ESMTP; 24 May 2019 00:24:51 -0700
Received: from orsmsx116.amr.corp.intel.com ([169.254.7.165]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.182]) with mapi id 14.03.0415.000;
 Fri, 24 May 2019 00:24:51 -0700
From:   "Xing, Cedric" <cedric.xing@intel.com>
To:     Andy Lutomirski <luto@kernel.org>,
        "Christopherson, Sean J" <sean.j.christopherson@intel.com>
CC:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        LSM List <linux-security-module@vger.kernel.org>,
        "Paul Moore" <paul@paul-moore.com>,
        Eric Paris <eparis@parisplace.org>,
        "selinux@vger.kernel.org" <selinux@vger.kernel.org>,
        Jethro Beekman <jethro@fortanix.com>,
        "Hansen, Dave" <dave.hansen@intel.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        "Dr. Greg" <greg@enjellic.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "nhorman@redhat.com" <nhorman@redhat.com>,
        "npmccallum@redhat.com" <npmccallum@redhat.com>,
        "Ayoun, Serge" <serge.ayoun@intel.com>,
        "Katz-zamir, Shay" <shay.katz-zamir@intel.com>,
        "Huang, Haitao" <haitao.huang@intel.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Svahn, Kai" <kai.svahn@intel.com>, Borislav Petkov <bp@alien8.de>,
        Josh Triplett <josh@joshtriplett.org>,
        "Huang, Kai" <kai.huang@intel.com>,
        David Rientjes <rientjes@google.com>
Subject: RE: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
Thread-Topic: SGX vs LSM (Re: [PATCH v20 00/28] Intel SGX1 support)
Thread-Index: AQHVC0vUmIXibKT8TUm/EUnHn2XAfqZu5q2AgAAGWoCABXOKgIABz2SAgAAI9ACAAWgPAIAAAJWAgAAJhACAAByGAIAAdoKAgABA+ICAAIOmAIAAQKcAgAAWeICAAIbLAIAAGyYA///WAeA=
Date:   Fri, 24 May 2019 07:24:50 +0000
Message-ID: <960B34DE67B9E140824F1DCDEC400C0F654E8956@ORSMSX116.amr.corp.intel.com>
References: <20190521155140.GE22089@linux.intel.com>
 <20190522132022.GC31176@linux.intel.com>
 <20190522132227.GD31176@linux.intel.com>
 <0e183cce-c4b4-0e10-dbb6-bd81bea58b66@tycho.nsa.gov>
 <20190522153836.GA24833@linux.intel.com>
 <CALCETrUS8xyF1JJmQs18BGTDhPRXf+s81BkMZCZwmY73r7M+zg@mail.gmail.com>
 <20190523023517.GA31950@linux.intel.com>
 <20190523102628.GC10955@linux.intel.com>
 <20190523141752.GA12078@linux.intel.com>
 <CALCETrUzx3LPAKCLFf75P-XshAkRcr+JLET3LA_kHDs9MA11FA@mail.gmail.com>
 <20190523234044.GC12078@linux.intel.com>
 <CALCETrV4DVEfW6EJ6DnQGGYDJAiA5M1QcuYJTiroumOM+D6Jjg@mail.gmail.com>
In-Reply-To: <CALCETrV4DVEfW6EJ6DnQGGYDJAiA5M1QcuYJTiroumOM+D6Jjg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTJjYmEzMGQtNjgxMy00YWYzLThlZmYtNWE2MGQ5ZmU5M2RhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOXVNSTV6aWVnXC9ncVhcL2RYRUxwcisybEpuWE9weDNIeWx5YW1sRXZySFlBV2ZwVVwvTlRqUUlJdWwweTNGUUFvUCJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: selinux-owner@vger.kernel.org
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

SGkgQW5keSwNCg0KPiBGcm9tOiBBbmR5IEx1dG9taXJza2kgW21haWx0bzpsdXRvQGtlcm5lbC5v
cmddDQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjMsIDIwMTkgNjoxOCBQTQ0KPiANCj4gT24gVGh1
LCBNYXkgMjMsIDIwMTkgYXQgNDo0MCBQTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuLmouY2hy
aXN0b3BoZXJzb25AaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IE9uIFRodSwgTWF5IDIz
LCAyMDE5IGF0IDA4OjM4OjE3QU0gLTA3MDAsIEFuZHkgTHV0b21pcnNraSB3cm90ZToNCj4gPiA+
IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDc6MTcgQU0gU2VhbiBDaHJpc3RvcGhlcnNvbg0KPiA+
ID4gPHNlYW4uai5jaHJpc3RvcGhlcnNvbkBpbnRlbC5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+
ID4gPiBPbiBUaHUsIE1heSAyMywgMjAxOSBhdCAwMToyNjoyOFBNICswMzAwLCBKYXJra28gU2Fr
a2luZW4gd3JvdGU6DQo+ID4gPiA+ID4gT24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDc6MzU6MTdQ
TSAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToNCj4gPiA+ID4gPiA+IEJ1dCBhY3R1
YWxseSwgdGhlcmUncyBubyBuZWVkIHRvIGRpc2FsbG93IG1tYXAoKSBhZnRlciBFQ1JFQVRFDQo+
ID4gPiA+ID4gPiBzaW5jZSB0aGUgTFNNIGNoZWNrcyBhbHNvIGFwcGx5IHRvIG1tYXAoKSwgZS5n
LiBGSUxFX19FWEVDVVRFDQo+ID4gPiA+ID4gPiB3b3VsZCBiZSBuZWVkZWQgdG8NCj4gPiA+ID4g
PiA+IG1tYXAoKSBhbnkgZW5jbGF2ZSBwYWdlcyBQUk9UX0VYRUMuICBJIGd1ZXNzIG15IHBhc3Qg
c2VsZg0KPiA+ID4gPiA+ID4gdGhvdWdodCBtbWFwKCkgYnlwYXNzZWQgTFNNIGNoZWNrcz8gIFRo
ZSByZWFsIHByb2JsZW0gaXMgdGhhdA0KPiA+ID4gPiA+ID4gbW1hcCgpJ25nIGFuIGV4aXN0aW5n
IGVuY2xhdmUgd291bGQgcmVxdWlyZSBGSUxFX19XUklURSBhbmQNCj4gPiA+ID4gPiA+IEZJTEVf
X0VYRUNVVEUsIHdoaWNoIHB1dHMgdXMgYmFjayBhdCBzcXVhcmUgb25lLg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gSSdtIGxvc3Qgd2l0aCB0aGUgY29uc3RyYWludHMgd2Ugd2FudCB0byBzZXQuDQo+
ID4gPiA+DQo+ID4gPiA+IEFzIGlzIHRvZGF5LCBTRUxpbnV4IHBvbGljaWVzIHdvdWxkIHJlcXVp
cmUgZW5jbGF2ZSBsb2FkZXJzIHRvDQo+ID4gPiA+IGhhdmUgRklMRV9fV1JJVEUgYW5kIEZJTEVf
X0VYRUNVVEUgcGVybWlzc2lvbnMgb24NCj4gPiA+ID4gL2Rldi9zZ3gvZW5jbGF2ZS4gIFByZXN1
bWFibHkgb3RoZXIgTFNNcyBoYXZlIHNpbWlsYXINCj4gPiA+ID4gcmVxdWlyZW1lbnRzLiAgUmVx
dWlyaW5nIGFsbCBwcm9jZXNzZXMgdG8gaGF2ZQ0KPiA+ID4gPiBGSUxFX197V1JJVEUsRVhFQ1VU
RX0gcGVybWlzc2lvbnMgbWVhbnMgdGhlIHBlcm1pc3Npb25zIGRvbid0IGFkZA0KPiA+ID4gPiBt
dWNoIHZhbHVlLCBlLmcuIHRoZXkgY2FuJ3QgYmUgdXNlZCB0byBkaXN0aW5ndWlzaCBiZXR3ZWVu
IGFuDQo+ID4gPiA+IGVuY2xhdmUgdGhhdCBpcyBiZWluZyBsb2FkZWQgZnJvbSBhbiB1bm1vZGlm
aWVkIGZpbGUgYW5kIGFuIGVuY2xhdmUgdGhhdCBpcyBiZWluZw0KPiBnZW5lcmF0ZWQgb24gdGhl
IGZseSwgZS5nLiBHcmFwaGVuZS4NCj4gPiA+ID4NCj4gPiA+ID4gTG9va2luZyBiYWNrIGF0IEFu
ZHkncyBtYWlsLCBoZSB3YXMgdGFsa2luZyBhYm91dCByZXF1aXJpbmcNCj4gPiA+ID4gRklMRV9f
RVhFQ1VURSB0byBydW4gYW4gZW5jbGF2ZSwgc28gcGVyaGFwcyBpdCdzIG9ubHkgRklMRV9fV1JJ
VEUNCj4gPiA+ID4gdGhhdCB3ZSdyZSB0cnlpbmcgdG8gc3BlY2lhbCBjYXNlLg0KPiA+ID4gPg0K
PiA+ID4NCj4gPiA+IEkgdGhvdWdodCBhYm91dCB0aGlzIHNvbWUgbW9yZSwgYW5kIEkgaGF2ZSBh
IG5ldyBwcm9wb3NhbCB0aGF0IGhlbHBzDQo+ID4gPiBhZGRyZXNzIHRoZSBFTFJBTkdFIGFsaWdu
bWVudCBpc3N1ZSBhbmQgdGhlIHBlcm1pc3Npb24gaXNzdWUgYXQgdGhlDQo+ID4gPiBjb3N0IG9m
IHNvbWUgZXh0cmEgdmVyYm9zaXR5LiAgTWF5YmUgeW91IGFsbCBjYW4gcG9rZSBob2xlcyBpbiBp
dCA6KQ0KPiA+ID4gVGhlIGJhc2ljIGlkZWEgaXMgdG8gbWFrZSBldmVyeXRoaW5nIG1vcmUgZXhw
bGljaXQgZnJvbSBhIHVzZXIncw0KPiA+ID4gcGVyc3BlY3RpdmUuICBIZXJlJ3MgaG93IGl0IHdv
cmtzOg0KPiA+ID4NCj4gPiA+IE9wZW5pbmcgL2Rldi9zZ3gvZW5jbGF2ZSBnaXZlcyBhbiBlbmNs
YXZlX2ZkIHRoYXQsIGJ5IGRlc2lnbiwNCj4gPiA+IGRvZXNuJ3QgZ2l2ZSBFWEVDVVRFIG9yIFdS
SVRFLiAgbW1hcCgpIG9uIHRoZSBlbmNsYXZlX2ZkIG9ubHkgd29ya3MNCj4gPiA+IGlmIHlvdSBw
YXNzIFBST1RfTk9ORSBhbmQgZ2l2ZXMgdGhlIGNvcnJlY3QgYWxpZ25tZW50LiAgVGhlDQo+ID4g
PiByZXN1bHRpbmcgVk1BIGNhbm5vdCBiZSBtcHJvdGVjdGVkIG9yIG1yZW1hcHBlZC4gIEl0IGNh
bid0IGJlDQo+ID4gPiBtbWFwcGVkIGF0IGFsbCB1bnRpbA0KPiA+DQo+ID4gSSBhc3N1bWUgeW91
J3JlIHRoaW5raW5nIG9mIGNsZWFyaW5nIGFsbCBWTV9NQVkqIGZsYWdzIGluIHNneF9tbWFwKCk/
DQo+ID4NCj4gPiA+IGFmdGVyIEVDUkVBVEUgYmVjYXVzZSB0aGUgYWxpZ25tZW50IGlzbid0IGtu
b3duIGJlZm9yZSB0aGF0Lg0KPiA+DQo+ID4gSSBkb24ndCBmb2xsb3cuICBUaGUgYWxpZ25tZW50
IGlzIGtub3duIGJlY2F1c2UgdXNlcnNwYWNlIGtub3dzIHRoZQ0KPiA+IHNpemUgb2YgaXRzIGVu
Y2xhdmUuICBUaGUgaW5pdGlhbCB1bmtub3duIGlzIHRoZSBhZGRyZXNzLCBidXQgdGhhdA0KPiA+
IGJlY29tZXMga25vd24gb25jZSB0aGUgaW5pdGlhbCBtbWFwKCkgY29tcGxldGVzLg0KPiANCj4g
Wy4uLl0NCj4gDQo+IEkgdGhpbmsgSSBtYWRlIHRoZSBtaXN0YWtlIG9mIGdldHRpbmcgdG9vIGNh
cnJpZWQgYXdheSB3aXRoIGltcGxlbWVudGF0aW9uIGRldGFpbHMgcmF0aGVyDQo+IHRoYW4ganVz
dCBnZXR0aW5nIHRvIHRoZSBwb2ludC4gIEFuZCBJIG1pc3JlbWVtYmVyZWQgdGhlIEVDUkVBVEUg
ZmxvdyAtLSBvb3BzLiAgTGV0IG1lIHRyeQ0KPiBhZ2Fpbi4gIEZpcnN0LCBoZXJlIGFyZSBzb21l
IHByb2JsZW1zIHdpdGggc29tZSBlYXJsaWVyIHByb3Bvc2FscyAobWluZSwgeW91cnMNCj4gQ2Vk
cmljJ3MpOg0KPiANCj4gIC0gSGF2aW5nIHRoZSBFQUREIG9wZXJhdGlvbiBhbHdheXMgd29yayBi
dXQgaGF2ZSBkaWZmZXJlbnQgZWZmZWN0cyBkZXBlbmRpbmcgb24gdGhlDQo+IHNvdXJjZSBtZW1v
cnkgcGVybWlzc2lvbnMgaXMsIGF0IHRoZSB2ZXJ5IGxlYXN0LCBjb25mdXNpbmcuDQoNCkluaGVy
aXRpbmcgcGVybWlzc2lvbnMgZnJvbSBzb3VyY2UgcGFnZXMgSU1ITyBpcyB0aGUgZWFzaWVzdCB3
YXkgdG8gdmFsaWRhdGUgdGhlIEVQQyBwZXJtaXNzaW9ucyB3aXRob3V0IGFueSBjaGFuZ2VzIHRv
IExTTS4gQW5kIHRoZSBhcmd1bWVudCBhYm91dCBpdHMgc2VjdXJpdHkgaXMgYWxzbyBlYXN5IHRv
IG1ha2UuDQoNCkkgdW5kZXJzdGFuZCB0aGF0IGl0IG1heSB0YWtlIHNvbWUgZWZmb3J0IHRvIGRv
Y3VtZW50IGl0IHByb3Blcmx5IGJ1dCBvdGhlcndpc2UgZG9uJ3Qgc2VlIGFueSBwcmFjdGljYWwg
aXNzdWVzIHdpdGggaXQuDQoNCj4gDQo+ICAtIElmIHdlIHdhbnQgdG8gZW5jb3VyYWdlIHVzZXIg
cHJvZ3JhbXMgdG8gYmUgd2VsbC1iZWhhdmVkLCB3ZSB3YW50IHRvIG1ha2UgaXQgZWFzeSB0bw0K
PiBtYXAgdGhlIFJYIHBhcnRzIG9mIGFuIGVuY2xhdmUgUlgsIHRoZSBSVyBwYXJ0cyBSVywgdGhl
IFJPIHBhcnRzIFIsIGV0Yy4gIEJ1dCB0aGlzDQo+IGludGVyYWN0cyBwb29ybHkgd2l0aCB0aGUg
c2d4X21tYXAoKSBhbGlnbm1lbnQgbWFnaWMsIGFzIHlvdSd2ZSBwb2ludGVkIG91dC4NCj4gDQo+
ICAtIFdlIGRvbid0IHdhbnQgdG8gY291cGxlIExTTXMgd2l0aCBTR1ggdG9vIHRpZ2h0bHkuDQo+
IA0KPiBTbyBoZXJlJ3MgaG93IGEgbmljZSBpbnRlcmZhY2UgbWlnaHQgd29yazoNCj4gDQo+IGlu
dCBlbmNsYXZlX2ZkID0gb3BlbigiL2Rldi9zZ3gvZW5jbGF2ZSIsIE9fUkRXUik7DQo+IA0KPiAv
KiBlbmNsYXZlX2ZkIHBvaW50cyB0byBhIHRvdGFsbHkgYmxhbmsgZW5jbGF2ZS4gQmVmb3JlIEVD
UkVBVEUsIHdlIG5lZWQgdG8gZGVjaWRlIG9uIGFuDQo+IGFkZHJlc3MuICovDQo+IA0KPiB2b2lk
ICphZGRyID0gbW1hcChOVUxMLCBzaXplLCBQUk9UX05PTkUsIE1BUF9TSEFSRUQsIGVuY2xhdmVf
ZmQsIDApOw0KPiANCj4gLyogd2UgaGF2ZSBhbiBhZGRyZXNzISAqLw0KPiANCj4gaW9jdGwoZW5j
bGF2ZV9mZCwgRUNSRUFURSwgLi4uKTsNCj4gDQo+IC8qIG5vdyBhZGQgc29tZSBkYXRhIHRvIHRo
ZSBlbmNsYXZlLiAgV2Ugd2FudCB0aGUgUldYIGFkZGl0aW9uIHRvIGZhaWwNCj4gaW1tZWRpYXRl
bHkgdW5sZXNzIHdlIGhhdmUgdGhlIHJlbGV2YW50IExTTSBwZW1pc3Npb24uICAgU2ltaWxhcmx5
LCB3ZQ0KPiB3YW50IHRoZSBSWCBhZGRpdGlvbiB0byBmYWlsIGltbWVkaWF0ZWx5IHVubGVzcyB0
aGUgc291cmNlIFZNQSBpcyBhcHByb3ByaWF0ZS4gKi8NCj4gDQo+IGlvY3RsKGVuY2xhdmVfZmQs
IEVBREQsIHJ4X3NvdXJjZV8xLCBNQVhQRVJNPVJYLCAuLi4pOyAgW3RoZSAuLi4NCj4gaW5jbHVk
ZXMgU0VDSU5GTywgd2hpY2ggdGhlIGtlcm5lbCBkb2Vzbid0IHJlYWxseSBjYXJlIGFib3V0XSBp
b2N0bChlbmNsYXZlX2ZkLCBFQURELA0KPiByb19zb3VyY2VfMSwgTUFYUEVSTT1SWCAuLi4pOyBp
b2N0bChlbmNsYXZlX2ZkLCBFQURELCByd19zb3VyY2VfMSwgTUFYUEVSTT1SVyAuLi4pOw0KPiBp
b2N0bChlbmNsYXZlX2ZkLCBFQURELCByd3hfc291cmNlXzEsIE1BWFBFUk09UldYIC4uLik7DQoN
CklmIE1BWFBFUk0gaXMgdGFrZW4gZnJvbSBpb2N0bCBwYXJhbWV0ZXJzLCB0aGUgcmVhbCBxdWVz
dGlvbiBoZXJlIGlzIGhvdyB0byB2YWxpZGF0ZSBNQVhQRVJNLiBHdWVzcyB3ZSBzaG91bGRuJ3Qg
YWxsb3cgYXJiaXRyYXJ5IE1BWFBFUk0gdG8gYmUgc3BlY2lmaWVkIGJ5IHVzZXIgY29kZSwgYW5k
IHRoZSBvbmx5IGxvZ2ljYWwgc291cmNlIEkgY2FuIHRoaW5rIG9mIGlzIGZyb20gdGhlIHNvdXJj
ZSBwYWdlcyAob3IgZnJvbSB0aGUgZW5jbGF2ZSBzb3VyY2UgZmlsZSwgYnV0IG1lbW9yeSBtYXBw
aW5nIGlzIHByZWZlcnJlZCBiZWNhdXNlIGl0IG9mZmVycyBtb3JlIGZsZXhpYmlsaXR5KS4gDQog
DQo+IA0KPiBpb2N0bChlbmNsYXZlX2ZkLCBFSU5JVCwgLi4uKTsgIC8qIHByZXN1bWFibHkgcGFz
cyBzaWdzdHJ1Y3RfZmQgaGVyZSwgdG9vLiAqLw0KPiANCj4gLyogYXQgdGhpcyBwb2ludCwgYWxs
IGlzIHdlbGwgZXhjZXB0IHRoYXQgdGhlIGVuY2xhdmUgaXMgbWFwcGVkIFBST1RfTk9ORS4gVGhl
cmUgYXJlIGENCj4gY291cGxlIHdheXMgSSBjYW4gaW1hZ2luZSB0byBmaXggdGhpcy4gKi8NCj4g
DQo+IFdlIGNvdWxkIHVzZSBtbWFwOg0KPiANCj4gbW1hcChiYXNlYWRkcitvZmZzZXQsIGxlbiwg
UFJPVF9SRUFELCBNQVBfU0hBUkVEIHwgTUFQX0ZJWEVELCBlbmNsYXZlX2ZkLCAwKTsgIC8qIG9u
bHkNCj4gc3VjY2VlZHMgaWYgTUFYUEVSTSAmIFIgPT0gUiAqLw0KPiANCj4gQnV0IHRoaXMgaGFz
IHNvbWUgYW5ub3lpbmcgaW1wbGljYXRpb25zIHdpdGggcmVnYXJkIHRvIHNneF9nZXRfdW5tYXBw
ZWRfYXJlYSgpLiAgV2UgY291bGQNCj4gdXNlIGFuIGlvY3RsOg0KDQpUaGVyZSdzIGFuIGVhc3kg
Zml4LiBKdXN0IGxldCBzZ3hfZ2V0X3VubWFwcGVkX2FyZWEoKSBkbyB0aGUgbmF0dXJhbCBhbGln
bm1lbnQgb25seSBpZiBNQVBfRklYRUQgaXMgKm5vdCogc2V0LCBvdGhlcndpc2UsIGhvbm9yIGJv
dGggYWRkcmVzcyBhbmQgbGVuLiANCg0KQnV0IG1tYXAoKSBpcyBzdWJqZWN0IHRvIExTTSBjaGVj
ayAocHJvYmFibHkgYWdhaW5zdCAvZGV2L3NneC9lbmNsYXZlPykuIEhvdyB0byBkbyBtbWFwKFJY
KSBpZiBGSUxFX19FWEVDVVRFIGlzICpub3QqIGdyYW50ZWQgZm9yIC9kZXYvc2d4L2VuY2xhdmUs
IGV2ZW4gaWYgTUFYUEVSTT1SWD8NCg0KPiANCj4gaW9jdGwoZW5jbGF2ZV9mZCwgU0dYX0lPQ19N
UFJPVEVDVCwgb2Zmc2V0LCBsZW4sIFBST1RfUkVBRCk7DQo+IA0KPiB3aGljaCBoYXMgdGhlIHBv
dGVudGlhbGx5IG5pY2UgcHJvcGVydHkgdGhhdCB3ZSBjYW4gY29tcGxldGVseSBieXBhc3MgdGhl
IExTTSBob29rcywNCj4gYmVjYXVzZSB0aGUgTFNNIGhhcyAqYWxyZWFkeSogdmV0dGVkIGV2ZXJ5
dGhpbmcgd2hlbiB0aGUgRUFERCBjYWxscyB3ZXJlIGFsbG93ZWQuICBPciB3ZQ0KPiBjb3VsZCBt
YXliZSBldmVuIGp1c3QgdXNlDQo+IG1wcm90ZWN0KCkgaXRzZWxmOg0KPiANCj4gbXByb3RlY3Qo
YmFzZWFkZHIgKyBvZmZzZXQsIGxlbiwgUFJPVF9SRUFEKTsNCg0KSG93IHRvIGJ5cGFzcyBMU00g
aG9va3MgaW4gdGhpcyBtcHJvdGVjdCgpPw0KDQo+IA0KPiBPciwgZm9yIHRoZSByZWFsbHkgZXZp
bCBvcHRpb24sIHdlIGNvdWxkIHVzZSBhIGJpdCBvZiBtYWdpYyBpbiAuZmF1bHQgYW5kIGRvIG5v
dGhpbmcgaGVyZS4NCj4gSW5zdGVhZCB3ZSdkIG1ha2UgdGhlIGluaXRpYWwgbWFwcGluZyBQUk9U
X1JFQUR8UFJPVF9XUklURXxQUk9UX0VYRUMgYW5kIGhhdmUgLmZhdWx0DQo+IGFjdHVhbGx5IGlu
c3RhbnRpYXRlIHRoZSBQVEVzIHdpdGggdGhlIGludGVyc2VjdGlvbiBvZiB0aGUgVk1BIHBlcm1p
c3Npb25zIGFuZCBNQVhQRVJNLiAgSQ0KPiBkb24ndCB0aGluayBJIGxpa2UgdGhpcyBhbHRlcm5h
dGl2ZSwgc2luY2UgaXQgZmVlbHMgbW9yZSBtYWdpY2FsIHRoYW4gbmVlZGVkIGFuZCBpdCB3aWxs
DQo+IGJlIGhhcmRlciB0byBkZWJ1Zy4gIEkgbGlrZSB0aGUgZmFjdCB0aGF0IC9wcm9jL3NlbGYv
bWFwcyBzaG93cyB0aGUgYWN0dWFsIHBlcm1pc3Npb25zIGluDQo+IGFsbCB0aGUgb3RoZXIgdmFy
aWFudHMuDQoNCkFncmVlZC4NCiANCj4gDQo+IA0KPiBBbGwgb2YgdGhlIHJlc3Qgb2YgdGhlIGNy
dWQgaW4gbXkgZWFybGllciBlbWFpbCB3YXMganVzdCBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzLiAg
VGhlDQo+IHBvaW50IEkgd2FzIHRyeWluZyB0byBtYWtlIHdhcyB0aGF0IEkgdGhpbmsgaXQncyBw
b3NzaWJsZSB0byBpbXBsZW1lbnQgdGhpcyB3aXRob3V0IG1ha2luZw0KPiB0b28gbXVjaCBvZiBh
IG1lc3MgaW50ZXJuYWxseS4gIEkgdGhpbmsgSSBmYXZvciB0aGUgbXByb3RlY3QoKSBhcHByb2Fj
aCBzaW5jZSBpdCBtYWtlcyB0aGUNCj4gYmVoYXZpb3IgZmFpcmx5IG9idmlvdXMuDQo+IA0KPiBJ
IGRvbid0IHRoaW5rIGFueSBvZiB0aGlzIG5lZWRzIHRvIGNoYW5nZSBmb3IgU0dYMi4gIFdlJ2Qg
aGF2ZSBhbg0KPiBpb2N0bCgpIHRoYXQgZG9lcyBFQVVHIGFuZCBzcGVjaWZpZXMgTUFYUEVSTS4g
IFRyeWluZyB0byBtcHJvdGVjdCgpIGEgcGFnZSB0aGF0IGhhc24ndA0KPiBiZWVuIGFkZGVkIHll
dCB3aXRoIGFueSBwZXJtaXNzaW9uIG90aGVyIHRoYW4gUFJPVF9OT05FIHdvdWxkIGZhaWwuICBJ
IHN1cHBvc2Ugd2UgbWlnaHQNCj4gZW5kIHVwIG5lZWRpbmcgYSB3YXkgdG8gbGV0IHRoZSBFQVVH
IG9wZXJhdGlvbiAqY2hhbmdlKiBNQVhQRVJNLCBhbmQgdGhpcyBvcGVyYXRpb24gd291bGQNCj4g
aGF2ZSB0byBkbyBzb21lIG1vcmUgTFNNIGNoZWNrcyBhbmQgd2FsayBhbGwgdGhlIGV4aXN0aW5n
IG1hcHBpbmdzIHRvIG1ha2Ugc3VyZSB0aGV5J3JlDQo+IGNvbnNpc3RlbnQgd2l0aCB0aGUgbmV3
IE1BWFBFUk0uDQoNCkVBVUcgaW9jdGwgY291bGQgYmUgYSBzb2x1dGlvbiwgYnV0IGlzbid0IG9w
dGltYWwgYXQgbGVhc3QuIFdoYXQgd2UndmUgZG9uZSBpcyAjUEYgYmFzZWQuIFNwZWNpZmljYWxs
eSwgYW4gU0dYMiBlbmNsYXZlIHdpbGwgaGF2ZSBpdHMgaGVhcCBtYXBwZWQgYXMgUlcsIGJ1dCB3
aXRob3V0IGFueSBwYWdlcyBwb3B1bGF0ZWQgYmVmb3JlIEVJTklULiBUaGVuIHdoZW4gdGhlIGVu
Y2xhdmUgbmVlZHMgYSBuZXcgcGFnZSBpbiBpdHMgaGVhcCwgaXQgaXNzdWVzIEVBQ0NFUFQsIHdo
aWNoIHdpbGwgY2F1c2UgYSAjUEYgYW5kIHRoZSBkcml2ZXIgd2lsbCByZXNwb25kIGJ5IEVBVUcg
YSBuZXcgRVBDIHBhZ2UuIEFuZCB0aGVuIHRoZSBlbmNsYXZlIHdpbGwgYmUgcmVzdW1lZCBhbmQg
dGhlIGZhdWx0ZWQgRUFDQ0VQVCB3aWxsIGJlIHJldHJpZWQgKGFuZCBzdWNjZWVkKS4gDQoNCj4g
DQo+IEFzIGFuIGFzaWRlLCBJIHdvbmRlciBpZiBMaW51cyBldCBhbGwgd291bGQgYmUgb2theSB3
aXRoIGEgbmV3IE1BUF9GVUxMWV9BTElHTkVEIG1tYXAoKQ0KPiBmbGFnIHRoYXQgYWxsb2NhdGVk
IG1lbW9yeSBhbGlnbmVkIHRvIHRoZSByZXF1ZXN0ZWQgc2l6ZS4gIFRoZW4gd2UgY291bGQgZ2V0
IHJpZCBvZiB5ZXQNCj4gYW5vdGhlciBiaXQgb2YgbWFnaWMuDQo+IA0KPiAtLUFuZHkNCg0KSSd2
ZSBhbHNvIGdvdCBhIGNoYW5jZSB0byB0aGluayBtb3JlIGFib3V0IGl0IGxhdGVseS4gDQoNCldo
ZW4gd2UgdGFsayBhYm91dCBFUEMgcGFnZSBwZXJtaXNzaW9ucyB3aXRoIFNHWDIgaW4gbWluZCwg
SSB0aGluayB3ZSBzaG91bGQgZGlzdGluZ3Vpc2ggYmV0d2VlbiBpbml0aWFsIHBlcm1pc3Npb25z
IGFuZCBydW50aW1lIHBlcm1pc3Npb25zLiBJbml0aWFsIHBlcm1pc3Npb25zIHJlZmVyIHRvIHRo
ZSBwYWdlIHBlcm1pc3Npb25zIHNldCBhdCBFQURELiBUaGV5IGFyZSB0ZWNobmljYWxseSBzZXQg
YnkgInVudHJ1c3RlZCIgY29kZSBzbyBzaG91bGQgZ28gYnkgcG9saWNpZXMgc2ltaWxhciB0byB0
aG9zZSBhcHBsaWNhYmxlIHRvIHJlZ3VsYXIgc2hhcmVkIG9iamVjdHMuIFJ1bnRpbWUgcGVybWlz
c2lvbnMgcmVmZXIgdG8gdGhlIHBlcm1pc3Npb25zIGdyYW50ZWQgYnkgRU1PRFBFLCBFQVVHIGFu
ZCBFQUNDRVBUQ09QWS4gVGhleSBhcmUgcmVzdWx0ZWQgZnJvbSBpbmhlcmVudCBiZWhhdmlvciBv
ZiB0aGUgZW5jbGF2ZSwgd2hpY2ggaW4gdGhlb3J5IGlzIGRldGVybWluZWQgYnkgdGhlIGVuY2xh
dmUncyBtZWFzdXJlbWVudHMgKE1SRU5DTEFWRSBhbmQvb3IgTVJTSUdORVIpLg0KDQpBbmQgd2Ug
aGF2ZSAyIGRpc3RpbmN0IGZpbGVzIHRvIHdvcmsgd2l0aCAtIHRoZSBlbmNsYXZlIGZpbGUgYW5k
IC9kZXYvc2d4L2VuY2xhdmUuIEFuZCBJIGNvbnNpZGVyIHRoZSBlbmNsYXZlIGZpbGUgYSBsb2dp
Y2FsIHNvdXJjZSBmb3IgaW5pdGlhbCBwZXJtaXNzaW9ucyB3aGlsZSAvZGV2L3NneC9lbmNsYXZl
IGlzIGEgbWVhbnMgdG8gY29udHJvbCBydW50aW1lIHBlcm1pc3Npb25zLiBUaGVuIHdlIGNhbiBo
YXZlIGEgc2ltcGxlciBhcHByb2FjaCBsaWtlIHRoZSBwc2V1ZG8gY29kZSBiZWxvdy4NCg0KLyoq
DQogKiBTdW1tYXJ5Og0KICogLSBUaGUgZW5jbGF2ZSBmaWxlIHJlc2VtYmxlcyBhIHNoYXJlZCBv
YmplY3QgdGhhdCBjb250YWlucyBSTy9SWC9SVyBzZWdtZW50cw0KICogLSBGSUxFX18qIGFyZSBh
c3NpZ25lZCB0byAvZGV2L3NneC9lbmNsYXZlLCB0byBkZXRlcm1pbmUgYWNjZXB0YWJsZSBwZXJt
aXNzaW9ucyB0byBtbWFwKCkvbXByb3RlY3QoKSwgdmFsaWQgY29tYmluYXRpb25zIGFyZQ0KICog
ICArIEZJTEVfX1JFQUQgLSBBbGxvdyBTR1gxIGVuY2xhdmVzIG9ubHkNCiAqICAgKyBGSUxFX19S
RUFEfEZJTEVfX1dSSVRFIC0gQWxsb3cgU0dYMiBlbmNsYXZlcyB0byBleHBhbmQgZGF0YSBzZWdt
ZW50cyAoZS5nLiBoZWFwcywgc3RhY2tzLCBldGMuKQ0KICogICArIEZJTEVfX1JFQUR8RklMRV9f
V1JJVEV8RklMRV9fRVhFQ1VURSAtIEFsbG93IFNHWDIgZW5jbGF2ZXMgdG8gZXhwZW5kIGJvdGgg
ZGF0YSBhbmQgY29kZSBzZWdtZW50cy4gVGhpcyBpcyBuZWNlc3NhcnkgdG8gc3VwcG9ydCBkeW5h
bWljYWxseSBsaW5rZWQgZW5jbGF2ZXMgKGUuZy4gR3JhcGhlbmUpDQogKiAgICsgRklMRV9fUkVB
RHxGSUxFX19FWEVDVVRFIC0gQWxsb3cgUlctPlJYIGNoYW5nZXMgZm9yIFNHWDEgZW5jbGF2ZXMg
LSBuZWNlc3NhcnkgdG8gc3VwcG9ydCBkeW5hbWljYWxseSBsaW5rZWQgZW5jbGF2ZXMgKGUuZy4g
R3JhcGhlbmUpIG9uIFNHWDEuIEVYRUNNRU0gaXMgYWxzbyByZXF1aXJlZCBmb3IgdGhpcyB0byB3
b3JrDQogKiAgICsgPE5vbmU+IC0gRGlzYWxsb3cgdGhlIGNhbGxpbmcgcHJvY2VzcyB0byBsYXVu
Y2ggYW55IGVuY2xhdmVzDQogKi8NCg0KLyogU3RlcCAxOiBtbWFwKCkgdGhlIGVuY2xhdmUgZmls
ZSBhY2NvcmRpbmcgdG8gdGhlIHNlZ21lbnQgYXR0cmlidXRlcyAoc2ltaWxhciB0byB3aGF0IGRs
b3BlbigpIHdvdWxkIGRvIGZvciByZWd1bGFyIHNoYXJlZCBvYmplY3RzKSAqLw0KaW50IGltYWdl
X2ZkID0gb3BlbigiL3BhdGgvdG8vZW5jbGF2ZS9maWxlIiwgT19SRE9OTFkpOw0KZm9yZWFjaCBw
aGRyIGluIGxvYWRhYmxlIHNlZ21lbnRzIC8qIHBoZHItPnBfdHlwZSA9PSBQVF9MT0FEICovIHsN
CiAgICAvKiA8c2VnbWVudCBwZXJtaXNzaW9uPiBiZWxvdyBpcyBzdWJqZWN0IHRvIExTTSBjaGVj
a3MgKi8NCiAgICBsb2FkYWJsZV9zZWdtZW50c1tpXSA9IG1tYXAoTlVMTCwgcGhkci0+cF9tZW1z
eiwgTUFQX1BSSUFURSwgPHNlZ21lbnQgcGVybWlzc2lvbj4sIGltYWdlX2ZkLCBwaGRyLT5wX29m
ZnNldCk7DQp9DQoNCi8qIFN0ZXAgMjogQ3JlYXRlIGVuY2xhdmUgKi8NCmludCBlbmNsYXZlX2Zk
ID0gb3BlbigiL2Rldi9zZ3gvZW5jbGF2ZSIsIE9fUkRPTkxZIC8qIG9yIE9fUkRXUiBmb3IgU0dY
MiBlbmNsYXZlcyAqLyk7DQp2b2lkICplbmNsYXZlX2Jhc2UgPSBtbWFwKE5VTEwsIDxlbmNsYXZl
IHNpemU+LCBNQVBfU0hBUkVELCBQUk9UX1JFQUQsIGVuY2xhdmVfZmQsIDApOyAvKiBPbmx5IEZJ
TEVfX1JFQUQgaXMgcmVxdWlyZWQgaGVyZSAqLw0KaW9jdGwoZW5jbGF2ZV9mZCwgSU9DX0VDUkVB
VEUsIC4uLik7DQoNCi8qIFN0ZXAgMzogRUFERCBhbmQgbWFwIGluaXRpYWwgRVBDIHBhZ2VzICov
DQpmb3JlYWNoIHMgaW4gbG9hZGFibGVfc2VnbWVudHMgew0KICAgIC8qIElPQ19FQUREX0FORF9N
QVBfU0VHTUVOVCB3aWxsIG1ha2Ugc3VyZSBzLT5wZXJtIGlzIGEgc3Vic2V0IG9mIFZNQSBwZXJt
aXNzaW9ucyBvZiB0aGUgc291cmNlIHBhZ2VzLCBhbmQgdXNlIHRoYXQgYXMgKmJvdGgqIEVQQ00g
YW5kIFZNQSBwZXJtaXNzaW9ucykuDQogICAgICogR2l2ZW4gZW5jbGF2ZV9mZCBtYXkgaGF2ZSBG
SUxFX19SRUFEIG9ubHksIExTTSBoYXMgdG8gYmUgYnlwYXNzZWQgc28gdGhlICJtbWFwIiBwYXJ0
IGhhcyB0byBiZSBkb25lIGluc2lkZSB0aGUgZHJpdmVyLg0KICAgICAqIEluaXRpYWwgRVBDIHBh
Z2VzIHdpbGwgYmUgbWFwcGVkIG9ubHkgb25jZSwgc28gbm8gaW5vZGUgaXMgbmVlZGVkIHRvIHJl
bWVtYmVyIHRoZSBpbml0aWFsIHBlcm1pc3Npb25zLiBtbWFwL21wcm90ZWN0IGFmdGVyd2FyZHMg
YXJlIHN1YmplY3QgdG8gRklMRV9fKiBvbiAvZGV2L3NneC9lbmNsYXZlDQogICAgICogVGhlIGtl
eSBwb2ludCBoZXJlIGlzOiBwZXJtaXNzaW9ucyBvZiBzb3VyY2UgcGFnZXMgZ292ZXJuIGluaXRp
YWwgcGVybWlzc2lvbnMgb2YgRUFERCdlZCBwYWdlcywgcmVnYXJkbGVzcyBGSUxFX18qIG9uIC9k
ZXYvc2d4L2VuY2xhdmUNCiAgICAgKi8NCiAgICBpb2N0bChlbmNsYXZlX2ZkLCBJT0NfRUFERF9B
TkRfTUFQX1NFR01FTlQsIHMtPmJhc2UsIHMtPnNpemUsIHMtPnBlcm0uLi4pOw0KfQ0KLyogRUFE
RCBvdGhlciBlbmNsYXZlIGNvbXBvbmVudHMsIGUuZy4gVENTLCBzdGFja3MsIGhlYXBzLCBldGMu
ICovDQppb2N0bChlbmNsYXZlX2ZkLCBJT0NfRUFERF9BTkRfTUFQX1NFR01FTlQsIHRjcywgMHgx
MDAwLCBSVyB8IFBUX1RDUy4uLik7DQppb2N0bChlbmNsYXZlX2ZkLCBJT0NfRUFERF9BTkRfTUFQ
X1NFR01FTlQsIDx6ZXJvIHBhZ2U+LCA8c3RhY2sgc2l6ZT4sIFJXLi4uKTsNCi4uLg0KDQovKiBT
dGVwIDQgKFNHWDIgb25seSk6IFJlc2VydmUgcmFuZ2VzIGZvciBhZGRpdGlvbmFsIGhlYXBzLCBz
dGFja3MsIGV0Yy4gKi8NCi8qIEZJTEVfX1dSSVRFIHJlcXVpcmVkIHRvIGFsbG93IGV4cGFuc2lv
biBvZiBkYXRhIHNlZ21lbnRzIGF0IHJ1bnRpbWUgKi8NCi8qIEtleSBwb2ludCBoZXJlIGlzOiBw
ZXJtaXNzaW9ucywgaWYgbmVlZGVkIHRvIGNoYW5nZSBhdCBydW50aW1lLCBhcmUgc3ViamVjdCB0
byBGSUxMX18qIG9uIC9kZXYvc2d4L2VuY2xhdmUgKi8gDQptcHJvdGVjdCg8aGVhcCBhZGRyZXNz
PiwgPGhlYXAgc2l6ZT4sIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOyANCg0KLyogU3RlcCA1OiBF
SU5JVCAqLw0KaW9jdGwoSU9DX0VJTklULCA8c2lnc3RydWN0Pi4uLik7DQoNCi8qIFN0ZXAgNiAo
U0dYMiBvbmx5KTogU2V0IFJYIGZvciBkeW5hbWljYWxseSBsb2FkZWQgY29kZSBwYWdlcyAoZS5n
LiBHcmFwaGVuZSwgZW5jcnlwdGVkIGVuY2xhdmVzLCBldGMuKSBhcyBuZWVkZWQsIGF0IHJ1bnRp
bWUgKi8NCi8qIEZJTEVfX0VYRUNVVEUgcmVxdWlyZWQgKi8NCm1wcm90ZWN0KDxSWCBhZGRyZXNz
PiwgPFJYIHNpemU+LCBQUk9UX1JFQUQgfCBQUk9UX0VYRUMpOw0KDQotQ2VkcmljDQo=
