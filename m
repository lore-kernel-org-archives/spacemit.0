Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532463BE179
	for <spacemit@lists.linux.dev>; Tue, 15 Sep 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506862; cv=none; b=u9CRpweUu8rUZRhVJ6tVi/HmpFzFRrj7k8Hoe1eSltvQZpT1FsvIOm702P0P5jU3O2w1GdLa6K4xfi/q6RJRCQ953kLntoznrl/torzsJOJswXXBbLKzpqL764qSG6hy5y2QqfdsHkWCKUYX2nijlqyzXgq96vLruQl1b2L2QQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506862; c=relaxed/simple;
	bh=j+NHvawE0i/KJNx0YGrFeCLMOAoNAbuUg3YwRv5hmtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSLKWQvA/wyvPDLW3J9+AdmcNSnc0CmG4nu2D1MZMTHfVHB3dZVTyVyuHIkCkltvcSm+N0jIyvdkSvSkfkbq/NXKbzzmxDm2MxFeBCLwKs649Z0Vj2SSY4cBGS2fmTdd7Idopb4+XAbSUpqrKqVxOEjB4hGNBS5gJeFYkapxI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=AbdbTVd/; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="AbdbTVd/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Ip+Cwgi5TYff8rWkT7U+yZ7I3GxFDhKXbdUOWRBh9sw=; b=AbdbTVd/t4g7VUKOe/btkYV3/l
	jC6jDgpBI9uJMs2MMTzqczNZ8JMt/pqmMLhRpksxqGPlDOQ7ZwtgDImhU9E8HFu0UYFuDHMZGaWpT
	3DsQDFstH3rc5mA4Sfqfm9ffClQZM23cOTeVyci9GVClr2fX5lRCJxIJdCONDJelTw9/i8Y6a6wlf
	UkPYRvaTUg6QSDxxuIdwCaQHC0y1k6iFh5YQlbo+byqpFKLtZBf6bEcmTUIthgPdWLkOD+uvS5eT9
	8dM5LEc+vYPbfn0F50SoDPS6xFHApQ6OYl1WurRxwTB7jgRNM3NEYZH2tEIZBwvB4Fnb0M30vlLSz
	RjGzjUhA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x6aTj-0000000EYvq-0zIR;
	Tue, 15 Sep 2026 23:14:11 +0200
Date: Tue, 15 Sep 2026 23:14:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: spacemit@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, Andy Chiu <tchiu@tenstorrent.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <aqm1Ik5202PyscK3@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
 <aqGNGp8PInSV4vty@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aqGNGp8PInSV4vty@aurel32.net>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

Some more update, even if the progress is quite low.

On 2026-09-09 18:45, Aurelien Jarno wrote:
> [Added Andy and Karl in Cc: as they have been involved in the vectored=20
> user copy code and fighting similar issues]
>=20
> Hi,
>=20
> Some more progress on that topic.
>=20
> On 2026-09-08 06:42, Aurelien Jarno wrote:
> > Dear all,
> >=20
> > I have done some small progress on that issue. Help is still wanted and=
=20
> > would be appreciated.
> >=20
> > On 2026-08-30 22:52, Aurelien Jarno wrote:
> > > Dear all,
> > >=20
> > > For the last weeks, I have been tracking a random memory corruption a=
nd
> > > relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). It=
=20
> > > started upgrading to glibc 2.43, which does memset() through vector=
=20
> > > instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1=20
> > > kernel, but I have also been able to reproduce it with a vanilla 7.2.=
2=20
> > > kernel, using a similar configuration to the Debian kernel. The board=
=20
> > > uses OpenSBI 1.9 and the vendor U-Boot.

I have been able to also reproduce the issue with the vendor OpenSBI. It=20
is also reproducible with linux 7.2.6.

> > I have been able to rule out OpenSBI from the issue, I have checked=20
> > there is not trap to OpenSBI when the problem happens.
> >=20
> > > Typically it manifests itself with the following kind of error, when=
=20
> > > running g++ from GCC 16 as part of building software (e.g. OpenJDK,=
=20
> > > Blender, Dolfin, Qt6):  =20
> > >=20
> > > Assembler messages:
> > > {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
> > > {standard input}:284588: Error: unrecognized opcode `=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=
=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BFvl874'
> > >=20
> > > The broken chars are 0xff and it seems there are always 240 (but with=
=20
> > > poor statistics). Sometimes it instead causes a GCC ICE instead.
> >=20
> > I have identified that the 0xff comes from the poisoning done for v0 in
> > __riscv_v_vstate_discard(), which should only happen for a syscall.=20
> > Indeed changing the value to different ones propagates to the above=20
> > error message.
> >=20
> > Furthermore I have found that changing CONFIG_RISCV_ISA_V_PREEMPTIVE=20
> > doesn't change anything, and that changing RISCV_ISA_V_UCOPY_THRESHOLD=
=20
> > changes the number of broken bytes.
>=20
> The values from __riscv_v_vstate_discard() end-up there because they are=
=20
> the last values written to the vector registers. I have added some=20
> poisoning in __asm_vector_usercopy_sum_enabled before the loop, and=20
> those values appear instead. Using different values per vector register,=
=20
> I have found that the corruption comes from a partial load of the vle8.v=
=20
> instruction, while the result of the poisoning and the partial load are
> then both written by the vse8.v:
>=20
>  loop:
>         vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
>         fixup vle8.v vData, (pSrc), 10f
>         sub iNum, iNum, iVL
>         add pSrc, pSrc, iVL
>         fixup vse8.v vData, (pDst), 11f
>         add pDst, pDst, iVL
>         bnez iNum, loop

I have instrumented that code, basically adding a function to check the=20
copy afterwards (only using scalar instructions), and report values in=20
case of errors. So far I have been able to catch the issue 4 times that=20
way (including one where I haven't seen any visible consequence on the=20
userland).=20

This is what I observed:
- The issue always happens for the first bytes of the user copy, which=20
  in all cases were supposed to be up to 4096 bytes long.
- On the first iteration of the loop only the first 16 bytes are loaded=20
  by the vle8.v instruction but the full 256 bytes are written to the=20
  destination by the vse8.v instrution.
- On the second iteration of the loop, the vle8.v causes a trap, which=20
  ends up in the 10f fixup. At fixup level, vl=3D0x100, vlenb=3D0x20,=20
  vstart=3D0x0 and vtype=3D0xc3.
- Considering the 2 first iterations of the loop (i.e. 512 bytes),=20
  neither the source nor destination addresses cross a page.

All that said, it is what I can *observe*. I have no idea if the first=20
iteration of the loop also goes through fixup or not. Also in addition=20
to precise traps (which definitely happen for the second iteration), IRQ=20
could happen at any moment. I use CONFIG_RISCV_ISA_V_PREEMPTIVE=3Dn for my=
=20
test, in order to limit the code paths to review, so during that copy=20
preempt is disabled, but IRQ is not.

Regards
Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
