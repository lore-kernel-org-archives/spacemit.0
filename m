Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF227305677
	for <spacemit@lists.linux.dev>; Fri, 18 Sep 2026 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789706090; cv=none; b=AjohpNZP/VmjlSsPrkgrgFiryJq6AifmP1pNu/oxp3oMXYpvX1xcuwP424FRPSjO27Sv5LLRCEzijret7J7uBQ2s8nRtP1PyHVlHULbs/CFlupI8yv2rGfIVOhKZYD6vWgeWkKYXOEkhLBQ9/1zLgBzsqgkfbiDL5XCqkb6iAQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789706090; c=relaxed/simple;
	bh=pb7QWmmUVRzsDSjLMF/UZX3+6dT+6Z79T5y9CAx2Epg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXfFXMk/zA94Snlyx8o+lMsW9WXxctymLeS/uGlSmZVOgbP+RzfMpMa5Rl6MPnzQBskyRMNUTyLbYiiExDkv54jF/3mLoF5N5hl1OWY+BZKRRUS7hUe5ehZctPzBeMECCxtSBqMe7RaIxL9Nt8wexr51ozauT3fFrdnVYmM+9fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=fj9R5EdL; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="fj9R5EdL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=jMZYBazdiY2OeMs68QlA4oobhnvN+ZgUafNXD/I6otg=; b=fj9R5EdLsTSC7vDyLbknhfrWhx
	TYSuDHkJ0zhMkv42+uoJbMoQJ6HNs+bOgCDeGR3q0rlDeXM18esdjSVA4Or54LF6RKweO4MWPjtk7
	0GxsoYi85Thwf7GSFaosz+oewsOMeoT27hrJtI0enVBcyE8yLtbcz5u9s8W/dsdTSE9bbx/B2qkjI
	2B/u8nhq1d7+QPCXX26rAaGWDrPntCT1bFC/8H93wiZYXKvmJNifcSsW3Qr99ov6psDHWz4swjf8w
	kf45nag0/oZkGSZ5FuPZCe2vGuMgaROSZ8dPfQeld0sLsm6bSiwz245F6d1UJkvHNZ1+Dggg9bNMB
	2Lq3KVQw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x7QJ5-00000000BUn-2F7u;
	Fri, 18 Sep 2026 06:34:39 +0200
Date: Fri, 18 Sep 2026 06:34:39 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	tchiu@tenstorrent.com, kmehltretter@gmail.com
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <aqy_X2pur2aaUjdT@aurel32.net>
References: <aqm1Ik5202PyscK3@aurel32.net>
 <mhng-6CE84C42-173E-4FAB-B163-A2AF2DC3D084@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <mhng-6CE84C42-173E-4FAB-B163-A2AF2DC3D084@Palmers-Mini.rwc.dabbelt.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi Palmer,

Thanks for your answer.

On 2026-09-17 12:18, Palmer Dabbelt wrote:
> On Tue, 15 Sep 2026 14:14:10 PDT (-0700), aurelien@aurel32.net wrote:
> > Hi,
> >=20
> > Some more update, even if the progress is quite low.
>=20
> Well, thanks for digging into this.
>=20
> >=20
> > On 2026-09-09 18:45, Aurelien Jarno wrote:
> > > [Added Andy and Karl in Cc: as they have been involved in the
> > > vectored user copy code and fighting similar issues]
> > >=20
> > > Hi,
> > >=20
> > > Some more progress on that topic.
> > >=20
> > > On 2026-09-08 06:42, Aurelien Jarno wrote:
> > > > Dear all,
> > > > > I have done some small progress on that issue. Help is still
> > > wanted and > would be appreciated.
> > > > > On 2026-08-30 22:52, Aurelien Jarno wrote:
> > > > > Dear all,
> > > > > > > For the last weeks, I have been tracking a random memory
> > > corruption and
> > > > > relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V
> > > Jupiter). It > > started upgrading to glibc 2.43, which does
> > > memset() through vector > > instructions.  It is reproducible using
> > > the Debian 7.1.7-1~bpo13+1 > > kernel, but I have also been able to
> > > reproduce it with a vanilla 7.2.2 > > kernel, using a similar
> > > configuration to the Debian kernel. The board > > uses OpenSBI 1.9
> > > and the vendor U-Boot.
> >=20
> > I have been able to also reproduce the issue with the vendor OpenSBI. It
> > is also reproducible with linux 7.2.6.
> >=20
> > > > I have been able to rule out OpenSBI from the issue, I have
> > > checked > there is not trap to OpenSBI when the problem happens.
> > > > > > Typically it manifests itself with the following kind of
> > > error, when > > running g++ from GCC 16 as part of building software
> > > (e.g. OpenJDK, > > Blender, Dolfin, Qt6):   > > > > Assembler
> > > messages:
> > > > > {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
> > > > > {standard input}:284588: Error: unrecognized opcode `=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BFvl874'
> > > > > > > The broken chars are 0xff and it seems there are always 240
> > > (but with > > poor statistics). Sometimes it instead causes a GCC
> > > ICE instead.
> > > > > I have identified that the 0xff comes from the poisoning done
> > > for v0 in
> > > > __riscv_v_vstate_discard(), which should only happen for a
> > > syscall. > Indeed changing the value to different ones propagates to
> > > the above > error message.
> > > > > Furthermore I have found that changing
> > > CONFIG_RISCV_ISA_V_PREEMPTIVE > doesn't change anything, and that
> > > changing RISCV_ISA_V_UCOPY_THRESHOLD > changes the number of broken
> > > bytes.
> > >=20
> > > The values from __riscv_v_vstate_discard() end-up there because they
> > > are the last values written to the vector registers. I have added
> > > some poisoning in __asm_vector_usercopy_sum_enabled before the loop,
> > > and those values appear instead. Using different values per vector
> > > register, I have found that the corruption comes from a partial load
> > > of the vle8.v instruction, while the result of the poisoning and the
> > > partial load are
> > > then both written by the vse8.v:
> > >=20
> > >  loop:
> > >         vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> > >         fixup vle8.v vData, (pSrc), 10f
> > >         sub iNum, iNum, iVL
> > >         add pSrc, pSrc, iVL
> > >         fixup vse8.v vData, (pDst), 11f
> > >         add pDst, pDst, iVL
> > >         bnez iNum, loop
> >=20
> > I have instrumented that code, basically adding a function to check the
> > copy afterwards (only using scalar instructions), and report values in
> > case of errors. So far I have been able to catch the issue 4 times that
> > way (including one where I haven't seen any visible consequence on the
> > userland).
> >=20
> > This is what I observed:
> > - The issue always happens for the first bytes of the user copy, which
> > in all cases were supposed to be up to 4096 bytes long.
> > - On the first iteration of the loop only the first 16 bytes are loaded
> > by the vle8.v instruction but the full 256 bytes are written to the
> > destination by the vse8.v instrution.
>=20
> That sounds like some sort of trap handling issue: something's filling out
> the first word of the vector, but then not the rest, but then not trigger=
ing
> a restart of the instruction.  We talked some on IRC and it sounds like t=
hat

Yes, it's really looks like the instruction is interrupted but not=20
restarted, instead the following instruction is executed.

> trap isn't getting into Linux, so it's possible something in M-mode is
> mangling it -- this is where we start to get into vstart/idempotent

If you mean sbi_misaligned_v_ld_emulator() and=20
sbi_misaligned_v_st_emulator(), I have already ruled the mout. They are=20
not called because both userland (glibc 2.43) and kernel (vector user=20
copy) are using e8, so there are no possible alignment issues.


> instruction territory and that's not well tested by running on QEMU, so it
> wouldn't be super surprising we're just stumbling into a bug there.

I don't think it's a vstart issue. If vstart were wrongly restored to 0,=20
the whole vector would be loaded again, inefficient but correct. If=20
vstart were restored to another wrong value, the end of vector would=20
also be loaded, overriding the values from riscv_v_vstate_discard(). The=20
only vstart case that could explain that is vstart >=3D vl, but I don't=20
think this is allowed.

> I have a K3 that I've been meaning to play around with, I'm going to go t=
ry
> to see if I can get it running and reproduce this one.

Just to be clear, I only observed corruption in the vectored user copy=20
code on the K1. But the K3 is affected by similar random corruption than=20
the K1 that disappear when disabling the vector unit. I believe that the=20
corruption happens at multiple places, and that by chance on the K1 it=20
can be observed on the vectored user copy.

To reproduce the issue, I use on a Debian installation (or on the=20
original Bianbu installation) the following commands in a loop:
- sbuild -d sid blender
- sbuild -d sid --build-dep-resolver=3Daptitude --extra-repository=3D"deb h=
ttp://deb.debian.org/debian experimental main" --add-depends "libc6 (>=3D 2=
=2E44)" blender

The second command uses glibc 2.44, which uses more vector instructions=20
via ifunc, so it crashes faster. Still it can takes a few hours until it=20
happens. On the K1 it takes on average 5 hours, sometimes it takes up to=20
18 hours before I can reproduce the issue.

> > - On the second iteration of the loop, the vle8.v causes a trap, which
> > ends up in the 10f fixup. At fixup level, vl=3D0x100, vlenb=3D0x20,
> > vstart=3D0x0 and vtype=3D0xc3.
> > - Considering the 2 first iterations of the loop (i.e. 512 bytes),
> > neither the source nor destination addresses cross a page.
> >=20
> > All that said, it is what I can *observe*. I have no idea if the first
> > iteration of the loop also goes through fixup or not. Also in addition
> > to precise traps (which definitely happen for the second iteration), IRQ
> > could happen at any moment. I use CONFIG_RISCV_ISA_V_PREEMPTIVE=3Dn for=
 my
> > test, in order to limit the code paths to review, so during that copy
> > preempt is disabled, but IRQ is not.

I tried disabling the IRQ around the vectored user copy, but it didn't=20
change anything.

Regards
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
