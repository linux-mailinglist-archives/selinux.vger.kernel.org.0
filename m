Return-Path: <selinux-owner@vger.kernel.org>
X-Original-To: lists+selinux@lfdr.de
Delivered-To: lists+selinux@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A00593290
	for <lists+selinux@lfdr.de>; Mon, 15 Aug 2022 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbiHOPy4 (ORCPT <rfc822;lists+selinux@lfdr.de>);
        Mon, 15 Aug 2022 11:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbiHOPyz (ORCPT
        <rfc822;selinux@vger.kernel.org>); Mon, 15 Aug 2022 11:54:55 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1548417077
        for <selinux@vger.kernel.org>; Mon, 15 Aug 2022 08:54:54 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-10ee900cce0so8587488fac.5
        for <selinux@vger.kernel.org>; Mon, 15 Aug 2022 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=2MeqZ9YpBhcxMePhf4XyuZxiB8DSxsSa93MuJDVwhuY=;
        b=VeUWuDhtkcP2mFTGI43BzGM9oZ/WHWyS1F8Zjg9YnGHOM/0w8XKSWKjTsEUnbWPzJG
         k/C/t4y1rTMr8geaxkoWok7FRzrDPn/LiG8PT2/MfqxVBh3RJ1LL+Km9f9VeW/e3aNAV
         76z2SXIwRfu+Wpf65hl2AkYljEhSJha2QMGw6BA0ue7ub/yMvK3NtPkDhrSXBLcYdQOt
         sviLLtENu0Bvk5nr5jWK+RZzoIVfl0+uFRfbmnK3AFVWaCklQnhLARLgJxtCy6MbOh4n
         OFFasu3YkXIaOpdZIMgoq1+bCigCyYMofY6z01j33cS4GRWdI6cDOLNZGpiMRyVWBsVj
         gZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=2MeqZ9YpBhcxMePhf4XyuZxiB8DSxsSa93MuJDVwhuY=;
        b=yUP3la9w2d+ttrr9OlqHb6dfvh5h12IWT2tbtG9iAg60YU5S07OKlRK6J0IVZwDOtk
         uew10HCtdsGKqgoJ5fCcKxxNhGibhonJYlnGWGFyaZHStBKK348Wnhnubmg6IoOjap3l
         mrPv08XyKUuHQjNA6BY7niuIkQOjpX1VFVPGr2oZplZQODQS3GzffBkTrhQdfgC+CEMj
         aVVmLTVwG8G3W8bgJQuSgjxqWiy8+TinHM91l4Hx+WUaQrYsgONrL8MdC3CcsBYg9v4Q
         NBDqLLGBwe02INwsHbOqzUZhMH2EvTr9GMGuliI7FCynlAYnqBanl14Ts2dTyknr2DuN
         XL9A==
X-Gm-Message-State: ACgBeo3/QViCAhk14wv+A1yYz/mkeXN3Jc8/gEikel5QsHGcVEyirT/P
        1fmCC1F3YAAkH+kcnuIvHoL64Dzjpb/qmBVfL0E=
X-Google-Smtp-Source: AA6agR7L5fqEilQapkf09kgA9IlM5Uy2WN67NYaTfFkZv2wWWeDikhTvjnk4rz47ShkX9HQA8BytKzPRRwm8N4E5I6w=
X-Received: by 2002:a05:6870:89a5:b0:116:ca99:6de7 with SMTP id
 f37-20020a05687089a500b00116ca996de7mr6962005oaq.182.1660578893328; Mon, 15
 Aug 2022 08:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220808173655.16867-1-cgzones@googlemail.com> <CAP+JOzSSptmKyETXZakgEGogdxdAaDqGT06uPyspk4jKETtF6A@mail.gmail.com>
In-Reply-To: <CAP+JOzSSptmKyETXZakgEGogdxdAaDqGT06uPyspk4jKETtF6A@mail.gmail.com>
From:   James Carter <jwcart2@gmail.com>
Date:   Mon, 15 Aug 2022 11:54:42 -0400
Message-ID: <CAP+JOzQvc=kAAJK6LGDNLH_WSwnVBoN=FSWR+t0xr1rQqSveKg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ci: bump versions in GitHub Actions
To:     =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc:     selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <selinux.vger.kernel.org>
X-Mailing-List: selinux@vger.kernel.org

On Thu, Aug 11, 2022 at 12:55 PM James Carter <jwcart2@gmail.com> wrote:
>
> On Mon, Aug 8, 2022 at 1:38 PM Christian G=C3=B6ttsche
> <cgzones@googlemail.com> wrote:
> >
> > * Move from deprecated actions/setup-ruby to ruby/setup-ruby.
> > * Bump python and ruby upper versions.
> > * Bump Reference Policy version
> > * Do not install recommend packages and output package resolution
> > * Bump to macOS 12
> >
> >   macOS 10 is deprecated since 5/31/22 [1].
> >   VirtualBox and Vagrant seems to be supported [2][3].
> >
> > [1]: https://github.com/actions/virtual-environments/issues/5583
> > [2]: https://github.com/actions/virtual-environments/pull/5594
> > [3]: https://github.com/actions/virtual-environments/pull/5854
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>
> For this series:
> Acked-by: James Carter <jwcart2@gmail.com>
>
This series has been merged.
Thanks,
Jim

> > ---
> >  .github/workflows/run_tests.yml    | 62 +++++++++++++++++-------------
> >  .github/workflows/vm_testsuite.yml |  5 +--
> >  2 files changed, 38 insertions(+), 29 deletions(-)
> >
> > diff --git a/.github/workflows/run_tests.yml b/.github/workflows/run_te=
sts.yml
> > index 8b7cb720..db0e1af5 100644
> > --- a/.github/workflows/run_tests.yml
> > +++ b/.github/workflows/run_tests.yml
> > @@ -10,48 +10,51 @@ jobs:
> >        matrix:
> >          compiler: [gcc, clang]
> >          python-ruby-version:
> > -          - {python: 3.9, ruby: 2.7}
> > -          - {python: 3.9, ruby: 2.7, other: test-flags-override}
> > -          - {python: 3.9, ruby: 2.7, other: test-debug}
> > -          - {python: 3.9, ruby: 2.7, other: linker-bfd}
> > -          - {python: 3.9, ruby: 2.7, other: linker-gold}
> > +          - {python: '3.10', ruby: '3.1'}
> > +          - {python: '3.10', ruby: '3.1', other: test-flags-override}
> > +          - {python: '3.10', ruby: '3.1', other: test-debug}
> > +          - {python: '3.10', ruby: '3.1', other: linker-bfd}
> > +          - {python: '3.10', ruby: '3.1', other: linker-gold}
> >            # Test several Python versions with the latest Ruby version
> > -          - {python: 3.8, ruby: 2.7}
> > -          - {python: 3.7, ruby: 2.7}
> > -          - {python: 3.6, ruby: 2.7}
> > -          - {python: 3.5, ruby: 2.7}
> > -          - {python: pypy3, ruby: 2.7}
> > +          - {python: '3.9', ruby: '3.1'}
> > +          - {python: '3.8', ruby: '3.1'}
> > +          - {python: '3.7', ruby: '3.1'}
> > +          - {python: '3.6', ruby: '3.1'}
> > +          - {python: '3.5', ruby: '3.1'}
> > +          - {python: 'pypy3.7', ruby: '3.1'}
> >            # Test several Ruby versions with the latest Python version
> > -          - {python: 3.9, ruby: 2.6}
> > -          - {python: 3.9, ruby: 2.5}
> > +          - {python: '3.10', ruby: '3.0'}
> > +          - {python: '3.10', ruby: '2.7'}
> > +          - {python: '3.10', ruby: '2.6'}
> > +          - {python: '3.10', ruby: '2.5'}
> >          exclude:
> >            - compiler: clang
> > -            python-ruby-version: {python: 3.9, ruby: 2.7, other: linke=
r-bfd}
> > +            python-ruby-version: {python: '3.10', ruby: '3.1', other: =
linker-bfd}
> >            - compiler: clang
> > -            python-ruby-version: {python: 3.9, ruby: 2.7, other: linke=
r-gold}
> > +            python-ruby-version: {python: '3.10', ruby: '3.1', other: =
linker-gold}
> >          include:
> >            - compiler: gcc
> > -            python-ruby-version: {python: 3.9, ruby: 2.7, other: sanit=
izers}
> > +            python-ruby-version: {python: '3.10', ruby: '3.1', other: =
sanitizers}
> >
> >      steps:
> > -    - uses: actions/checkout@v2
> > +    - uses: actions/checkout@v3
> >
> >      - name: Set up Python ${{ matrix.python-ruby-version.python }}
> > -      uses: actions/setup-python@v2
> > +      uses: actions/setup-python@v4
> >        with:
> >          python-version: ${{ matrix.python-ruby-version.python }}
> >
> >      - name: Set up Ruby ${{ matrix.python-ruby-version.ruby }}
> > -      uses: actions/setup-ruby@v1
> > +      uses: ruby/setup-ruby@v1
> >        with:
> >          ruby-version: ${{ matrix.python-ruby-version.ruby }}
> > +        bundler-cache: true
> >
> >      - name: Install dependencies
> >        run: |
> > -        sudo apt-get update -qq
> > -        sudo apt-get install -qqy \
> > +        sudo apt-get update -q
> > +        sudo apt-get install -qy --no-install-recommends \
> >              bison \
> > -            clang \
> >              flex \
> >              gawk \
> >              gettext \
> > @@ -61,14 +64,16 @@ jobs:
> >              libcunit1-dev \
> >              libdbus-glib-1-dev \
> >              libpcre2-dev \
> > -            python3-dev \
> > -            python-dev \
> >              ruby-dev \
> >              swig \
> >              xmlto
> >
> >          pip install flake8
> >
> > +    - name: Install Clang
> > +      if: ${{ matrix.compiler =3D=3D 'clang' }}
> > +      run: sudo apt-get install -qqy clang
> > +
> >      - name: Configure the environment
> >        run: |
> >          DESTDIR=3D/tmp/destdir
> > @@ -82,6 +87,11 @@ jobs:
> >          elif [ "${{ matrix.python-ruby-version.other }}" =3D "linker-g=
old" ] ; then
> >              CC=3D"$CC -fuse-ld=3Dgold"
> >          fi
> > +        # https://bugs.ruby-lang.org/issues/18616
> > +        # https://github.com/llvm/llvm-project/issues/49958
> > +        if [ "${{ matrix.compiler }}" =3D "clang" ] && [[ "${{ matrix.=
python-ruby-version.ruby }}" =3D 3* ]] ; then
> > +            CC=3D"$CC -fdeclspec"
> > +        fi
> >          echo "CC=3D$CC" >> $GITHUB_ENV
> >
> >          EXPLICIT_MAKE_VARS=3D
> > @@ -110,7 +120,7 @@ jobs:
> >          PYTHON_SYS_PREFIX=3D"$(python -c 'import sys;print(sys.prefix)=
')"
> >          echo "PKG_CONFIG_PATH=3D${PYTHON_SYS_PREFIX}/lib/pkgconfig" >>=
 $GITHUB_ENV
> >
> > -        if [ "${{ matrix.python-ruby-version.python }}" =3D "pypy3" ] =
; then
> > +        if [[ "${{ matrix.python-ruby-version.python }}" =3D pypy* ]] =
; then
> >              # PyPy does not provide a config file for pkg-config
> >              # libpypy-c.so is provided in bin/libpypy-c.so for PyPy an=
d bin/libpypy3-c.so for PyPy3
> >              echo "PYINC=3D-I${PYTHON_SYS_PREFIX}/include" >> $GITHUB_E=
NV
> > @@ -122,10 +132,10 @@ jobs:
> >
> >      - name: Download and install refpolicy headers for sepolgen tests
> >        run: |
> > -        curl --location --retry 10 -o refpolicy.tar.bz2 https://github=
.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20180701/refpolic=
y-2.20180701.tar.bz2
> > +        curl --location --retry 10 -o refpolicy.tar.bz2 https://github=
.com/SELinuxProject/refpolicy/releases/download/RELEASE_2_20220520/refpolic=
y-2.20220520.tar.bz2
> >          tar -xvjf refpolicy.tar.bz2
> >          sed -e "s,^PREFIX :=3D.*,PREFIX :=3D $DESTDIR/usr," -i refpoli=
cy/support/Makefile.devel
> > -        sudo make -C refpolicy install-headers clean
> > +        sudo make -C refpolicy install-headers bare
> >          sudo mkdir -p /etc/selinux
> >          echo 'SELINUXTYPE=3Drefpolicy' | sudo tee /etc/selinux/config
> >          echo 'SELINUX_DEVEL_PATH =3D /usr/share/selinux/refpolicy' | s=
udo tee /etc/selinux/sepolgen.conf
> > diff --git a/.github/workflows/vm_testsuite.yml b/.github/workflows/vm_=
testsuite.yml
> > index 601276dd..92155da2 100644
> > --- a/.github/workflows/vm_testsuite.yml
> > +++ b/.github/workflows/vm_testsuite.yml
> > @@ -6,11 +6,10 @@ jobs:
> >    vm_testsuite:
> >
> >      # Use VirtualBox+vagrant on macOS, as described in https://github.=
com/actions/virtual-environments/issues/433
> > -    # Use an old version of macOS until https://github.com/actions/vir=
tual-environments/pull/4010 is merged.
> > -    runs-on: macos-10.15
> > +    runs-on: macos-12
> >
> >      steps:
> > -    - uses: actions/checkout@v2
> > +    - uses: actions/checkout@v3
> >
> >      - name: Create Vagrant VM
> >        run: |
> > --
> > 2.36.1
> >
