Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1011D5146
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972329; cv=none; b=U/Fa6tUdBuYoduNr9HogTpHO/+IKpu4dDYqFpL2xh0VI9HVQXbTtMPfh6wjwZkAVtha+V134Ug4h7h0vNTRQSV5o1TPLzRINEJkKp8M9HHTxHVtcJQm6L+q+gCww26dDlMT6fMW5T1GGE4RE7fdWv3oMCAVrQZ3mehYGzRsCado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972329; c=relaxed/simple;
	bh=eFdVLOoXp72a2hn6HZfKme7GOcWEzAXJkqBnWJLawBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR1L+LNtig5QyUOxc5dCAINCBoIyMq5rUfZ7V6ApISWS/GCZTLkgSRKprd4FVjhZMFf1LoscdVrK+9xZzi6adNSN6nVpbvZX+aA8jGDlLS4xVi5oGMSetfNub4FQLU77caNPhgf83dtuuaSShrfH8AVxu56EEIcbMhWvdLXVSAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=DBrutNc9; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="DBrutNc9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=WFdVhop09Vwq0/XYl66myl8jDJXz4Vz1i8q3oxQjIHw=; b=DBrutNc9RFlubJ2gG1RpH/cT97
	PsTQ8Z8VQ+QwlAA8aJvFoVflT2N6yqKBi7P3HZpcmcUR2xOVVq3V3G+1LYliywJ4jgH3qKFnpM8+z
	uFoh/jtbj3SFt2B/50fL4Tb8darUGo1mXr94Wp8BuPs5uG4wGC26Z8QhyUzcVfp5KikKlqtxQ83TL
	lkTFAFi/ILOhIeIDnmxTPqpnmfxVp1+ALprvHmPBL5ClE0CQiPiS4Pr9Pi8zDe8wA5Dqqi6/1gBgR
	KkGmhd1iYscP/dqnC/iO5Stfn2wAZnHXLhLHy5X8hMqJlku49miUDZLjHiyVfL15HGOjfV4Al68sM
	UMoz1Akw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x4LQC-0000000684v-0GIB;
	Wed, 09 Sep 2026 18:45:16 +0200
Date: Wed, 9 Sep 2026 18:45:14 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: spacemit@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, Andy Chiu <tchiu@tenstorrent.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: Random corruption on SpacemiT K1 (and K3) with RVV
Message-ID: <aqGNGp8PInSV4vty@aurel32.net>
References: <apSYF5x1Tu7PlyL1@aurel32.net>
 <ap-SIQ9DLt-CfAx6@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ap-SIQ9DLt-CfAx6@aurel32.net>
User-Agent: Mutt/2.4.1 (2026-07-04)

[Added Andy and Karl in Cc: as they have been involved in the vectored=20
user copy code and fighting similar issues]

Hi,

Some more progress on that topic.

On 2026-09-08 06:42, Aurelien Jarno wrote:
> Dear all,
>=20
> I have done some small progress on that issue. Help is still wanted and=
=20
> would be appreciated.
>=20
> On 2026-08-30 22:52, Aurelien Jarno wrote:
> > Dear all,
> >=20
> > For the last weeks, I have been tracking a random memory corruption and
> > relatively rare on SpacemiT K1 (Banana Pi F3 and Milk-V Jupiter). It=20
> > started upgrading to glibc 2.43, which does memset() through vector=20
> > instructions.  It is reproducible using the Debian 7.1.7-1~bpo13+1=20
> > kernel, but I have also been able to reproduce it with a vanilla 7.2.2=
=20
> > kernel, using a similar configuration to the Debian kernel. The board=
=20
> > uses OpenSBI 1.9 and the vendor U-Boot.
>=20
> I have been able to rule out OpenSBI from the issue, I have checked=20
> there is not trap top OpenSBI when the problem happens.
>=20
> > Typically it manifests itself with the following kind of error, when=20
> > running g++ from GCC 16 as part of building software (e.g. OpenJDK,=20
> > Blender, Dolfin, Qt6):  =20
> >=20
> > Assembler messages:
> > {standard input}:284588: Error: unknown pseudo-op: `.uleb1'
> > {standard input}:284588: Error: unrecognized opcode `=C3=BF=C3=BF=C3=BF=
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
=C3=BF=C3=BF=C3=BF=C3=BF=C3=BF=C3=BFvl874'
> >=20
> > The broken chars are 0xff and it seems there are always 240 (but with=
=20
> > poor statistics). Sometimes it instead causes a GCC ICE instead.
>=20
> I have identified that the 0xff comes from the poisoning done for v0 in
> __riscv_v_vstate_discard(), which should only happen for a syscall.=20
> Indeed changing the value to different ones propagates to the above=20
> error message.
>=20
> Furthermore I have found that changing CONFIG_RISCV_ISA_V_PREEMPTIVE=20
> doesn't change anything, and that changing RISCV_ISA_V_UCOPY_THRESHOLD=20
> changes the number of broken bytes.

The values from __riscv_v_vstate_discard() end-up there because they are=20
the last values written to the vector registers. I have added some=20
poisoning in __asm_vector_usercopy_sum_enabled before the loop, and=20
those values appear instead. Using different values per vector register,=20
I have found that the corruption comes from a partial load of the vle8.v=20
instruction, while the result of the poisoning and the partial load are
then both written by the vse8.v:

 loop:
        vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
        fixup vle8.v vData, (pSrc), 10f
        sub iNum, iNum, iVL
        add pSrc, pSrc, iVL
        fixup vse8.v vData, (pDst), 11f
        add pDst, pDst, iVL
        bnez iNum, loop

One hypothesis could be that for some reason, an exception (page table=20
fault, irq, ...), the vle8.v instruction is interrupted, and only=20
partially loads the vector register from memory. This stops at a 16-byte=20
boundary (at least on the K1), and the remaining part of the v0-v7=20
register is left with the previous value (with the original kernel that=20
is the poisoning done in __riscv_v_vstate_discard). In theory when the=20
instruction is interrupted, vstart is set to a non-zero value (for=20
instance 16), and it should get re-executed after the exception. In=20
practice, in some very rare cases, it doesn't happen and the next=20
executed instruction is the following sub.

That said with exceptions and vector context switches, the explanation=20
is likely way more complex. [1] gives a possible different scenario,=20
involving an interrupt or a fault between the vsetvli and vle8.v/vse8.v=20
instructions. However it doesn't fix the issue, neither patch [2]
(in that case tested with CONFIG_RISCV_ISA_V_PREEMPTIVE=3Dy).


> Disabling the vectored user code entirely with the following patch seems
> to prevent the issue (or make it sufficiently rare that I have not=20
> encountered it):

A much better way to do that is setting RISCV_ISA_V_UCOPY_THRESHOLD=3D-1. =
=20

I also tried the same kernel on a K3, and it appears to improve=20
stability, getting rid of issues that I attributed to thermal issues. =20
(due to the absence of fan driver, I run the fan as a fixed speed=20
~4000rpm). The symptoms are however quite different, it's GCC crashes=20
with "The bug is not reproducible, so it is likely a hardware or OS=20
problem.".

Regards
Aurelien

[1] https://lore.kernel.org/20260806193241.10552-1-kmehltretter@gmail.com/
[2] https://lore.kernel.org/all/20260810172255.1532787-2-tchiu@tenstorrent.=
com/

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
